import { getSourceProofPath } from "../packages/lean-proofs/bridge/sourceProofPath";
import { execFileSync } from "node:child_process";
import { existsSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { dirname, join, relative, resolve, sep } from "node:path";
import { fileURLToPath } from "node:url";

import { sourceRecipeSchema } from "../packages/schemas/src/domain/SourceRecipe.schema";
import { buildLeanRecipe, parseRecipeForLean } from "./generate-source-recipe-proofs";

const UPSTREAM_COMMIT = "308cc8b7dab1da84b20e7fafdf836a715437f582";
const EXPECTED_CATEGORIES = new Set([
  "aquatic",
  "breakfast",
  "condiment",
  "dessert",
  "drink",
  "meat_dish",
  "semi-finished",
  "soup",
  "staple",
  "vegetable_dish",
]);

type CoverageStatus =
  | "verified"
  | "missing-schema"
  | "missing-proof"
  | "compilation-failure"
  | "source-drift"
  | "duplicate";

interface SourceRecipeEntry {
  category: string;
  id: string;
  license: "Unlicense";
  sourcePath: string;
  sourceUrl: string;
  title: string;
  upstreamCommit: string;
}

interface CoverageEntry {
  id: string | null;
  sourcePath: string;
  status: CoverageStatus;
  reasons: string[];
  title?: string;
}

interface CoverageReport {
  source: {
    commit: string;
    repository: string;
  };
  summary: {
    catalogEntries: number;
    compilationFailure: number;
    duplicate: number;
    missingProof: number;
    missingSchema: number;
    sourceRecipes: number;
    sourceDrift: number;
    verified: number;
  };
  entries: CoverageEntry[];
  diagnostics: string[];
}

const scriptDirectory = dirname(fileURLToPath(import.meta.url));
const repositoryRoot = resolve(scriptDirectory, "..");
const contentRoot = join(repositoryRoot, "content", "how-to-cook");
const dishesRoot = join(contentRoot, "dishes");
const catalogPath = join(
  repositoryRoot,
  "packages",
  "schemas",
  "src",
  "sourceRecipes",
  "sourceRecipeCatalogData.json",
);
const leanSourcePath = join(
  repositoryRoot,
  "packages",
  "lean-proofs",
  "LeanToCook",
  "Generated",
  "SourceCatalog.lean",
);
const reportPath = join(contentRoot, "COVERAGE.json");

const toPosixPath = (path: string) => path.split(sep).join("/");

const collectMarkdownFiles = (directory: string): string[] =>
  readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const entryPath = join(directory, entry.name);

    return entry.isDirectory()
      ? collectMarkdownFiles(entryPath)
      : entry.isFile() && entry.name.endsWith(".md")
        ? [entryPath]
        : [];
  });

const sourcePaths = collectMarkdownFiles(dishesRoot)
  .map((path) => toPosixPath(relative(contentRoot, path)))
  .filter((path) => !path.startsWith("dishes/template/"))
  .sort((left, right) => left.localeCompare(right, "zh-CN"));

const rawCatalog = JSON.parse(readFileSync(catalogPath, "utf8")) as unknown[];
const validCatalog = rawCatalog.flatMap((entry) => {
  const result = sourceRecipeSchema.safeParse(entry);

  return result.success ? [result.data] : [];
});
const leanSource = readFileSync(leanSourcePath, "utf8").replaceAll("\r\n", "\n");

const pathsInCatalog = new Map<string, SourceRecipeEntry[]>();
const idsInCatalog = new Map<string, SourceRecipeEntry[]>();

for (const entry of validCatalog) {
  const byPath = pathsInCatalog.get(entry.sourcePath) ?? [];
  byPath.push(entry);
  pathsInCatalog.set(entry.sourcePath, byPath);

  const byId = idsInCatalog.get(entry.id) ?? [];
  byId.push(entry);
  idsInCatalog.set(entry.id, byId);
}

const duplicatePaths = new Set(
  [...pathsInCatalog.entries()].filter(([, entries]) => entries.length > 1).map(([path]) => path),
);
const duplicateIds = new Set(
  [...idsInCatalog.entries()].filter(([, entries]) => entries.length > 1).map(([id]) => id),
);
const catalogByPath = new Map(validCatalog.map((entry) => [entry.sourcePath, entry]));
const catalogPaths = new Set(validCatalog.map(({ sourcePath }) => sourcePath));
const sourcePathSet = new Set(sourcePaths);
const diagnostics: string[] = [];

interface Finding {
  reason: string;
  status: CoverageStatus;
}

/** Most severe first; the first status present on an entry wins. */
const STATUS_PRIORITY: CoverageStatus[] = [
  "missing-schema",
  "duplicate",
  "source-drift",
  "missing-proof",
  "compilation-failure",
];

const resolveStatus = (findings: Finding[]): CoverageStatus =>
  STATUS_PRIORITY.find((status) => findings.some((finding) => finding.status === status)) ??
  "verified";

/**
 * Verifies that the committed Lean catalog still certifies this exact recipe.
 * Presence of the declaration alone is not enough: the embedded ingredients and
 * steps must match what the current markdown parses to, otherwise the proof is
 * stale and silently certifies content that no longer exists.
 */
const getLeanCertificateFinding = (
  entry: SourceRecipeEntry,
  parsedRecipe: ReturnType<typeof parseRecipeForLean>,
): Finding | undefined => {
  const declaration = `recipe_${entry.id}`;
  const certificatePath = join(dirname(leanSourcePath), getSourceProofPath(entry));
  const certificate = existsSync(certificatePath) ? readFileSync(certificatePath, "utf8") : "";

  if (
    !certificate.includes(`def ${declaration} : Recipe`) ||
    !certificate.includes(`theorem ${declaration}_kernel_certificate`)
  ) {
    return {
      reason: "No generated Lean definition and kernel certificate were found.",
      status: "missing-proof",
    };
  }

  if (
    !certificate.includes(buildLeanRecipe(entry, parsedRecipe)) ||
    !leanSource.includes(
      `import LeanToCook.Generated.${getSourceProofPath(entry)
        .replace(/\.lean$/, "")
        .replaceAll("/", ".")}`,
    )
  ) {
    return {
      reason:
        "The Lean certificate no longer matches the current source markdown; re-run generate-source-proofs.",
      status: "source-drift",
    };
  }

  return undefined;
};

const entries: CoverageEntry[] = sourcePaths.map((sourcePath) => {
  const entry = catalogByPath.get(sourcePath);
  const findings: Finding[] = [];

  if (!entry) {
    return {
      id: null,
      reasons: ["No valid Schema entry matches this source path."],
      sourcePath,
      status: "missing-schema",
    };
  }

  if (duplicatePaths.has(sourcePath) || duplicateIds.has(entry.id)) {
    findings.push({
      reason: "Source path or catalog id is duplicated.",
      status: "duplicate",
    });
  }

  if (
    entry.upstreamCommit !== UPSTREAM_COMMIT ||
    !entry.sourceUrl.includes(UPSTREAM_COMMIT) ||
    !sourcePathSet.has(entry.sourcePath)
  ) {
    findings.push({
      reason: "Catalog provenance does not match the pinned source snapshot.",
      status: "source-drift",
    });
  }

  const markdown = readFileSync(join(contentRoot, sourcePath), "utf8");
  const parsedRecipe = parseRecipeForLean(markdown);

  if (parsedRecipe.ingredients.length === 0 || parsedRecipe.steps.length === 0) {
    findings.push({
      reason: "The source recipe has no parseable ingredients or steps.",
      status: "missing-proof",
    });
  } else {
    const certificateFinding = getLeanCertificateFinding(entry, parsedRecipe);

    if (certificateFinding) findings.push(certificateFinding);
  }

  return {
    id: entry.id,
    reasons: findings.map(({ reason }) => reason),
    sourcePath,
    status: resolveStatus(findings),
    title: entry.title,
  };
});

for (const entry of validCatalog.filter(({ sourcePath }) => !sourcePathSet.has(sourcePath))) {
  entries.push({
    id: entry.id,
    reasons: ["Catalog entry points to a path absent from the vendored source snapshot."],
    sourcePath: entry.sourcePath,
    status: "source-drift",
    title: entry.title,
  });
}

for (const category of EXPECTED_CATEGORIES) {
  const categoryPath = join(dishesRoot, category);

  if (!existsSync(categoryPath)) {
    diagnostics.push(`Missing source category directory: dishes/${category}`);
  }
}

const buildLean = process.argv.includes("--skip-lean")
  ? { compiled: false, error: "Lean build skipped by --skip-lean." }
  : (() => {
      try {
        execFileSync("lake", ["build"], {
          cwd: join(repositoryRoot, "packages", "lean-proofs"),
          encoding: "utf8",
          stdio: "pipe",
        });

        return { compiled: true, error: undefined };
      } catch (error) {
        const message = error instanceof Error ? error.message : String(error);

        return { compiled: false, error: message };
      }
    })();

if (!buildLean.compiled) {
  diagnostics.push(buildLean.error ?? "Lean build did not complete.");

  for (const entry of entries) {
    if (entry.status === "verified") {
      entry.status = "compilation-failure";
      entry.reasons = ["Lean build did not produce a successful verification result."];
    }
  }
}

const countStatus = (status: CoverageStatus) =>
  entries.filter((entry) => entry.status === status).length;
const report: CoverageReport = {
  source: {
    commit: UPSTREAM_COMMIT,
    repository: "Anduin2017/HowToCook",
  },
  summary: {
    catalogEntries: validCatalog.length,
    compilationFailure: countStatus("compilation-failure"),
    duplicate: countStatus("duplicate"),
    missingProof: countStatus("missing-proof"),
    missingSchema: countStatus("missing-schema"),
    sourceRecipes: sourcePaths.length,
    sourceDrift: countStatus("source-drift"),
    verified: countStatus("verified"),
  },
  entries,
  diagnostics,
};

if (process.argv.includes("--write")) {
  writeFileSync(reportPath, `${JSON.stringify(report, null, 2)}\n`);
}

console.log(JSON.stringify(report.summary, null, 2));
for (const diagnostic of diagnostics) console.error(`coverage: ${diagnostic}`);

if (
  report.summary.missingSchema > 0 ||
  report.summary.missingProof > 0 ||
  report.summary.sourceDrift > 0 ||
  report.summary.duplicate > 0 ||
  report.summary.compilationFailure > 0
) {
  process.exitCode = 1;
}
