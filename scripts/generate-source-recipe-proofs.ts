import { getSourceProofPath } from "../packages/lean-proofs/bridge/sourceProofPath";
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

interface SourceRecipeCatalogEntry {
  category: string;
  id: string;
  license: "Unlicense";
  sourcePath: string;
  sourceUrl: string;
  title: string;
  upstreamCommit: string;
}

interface ParsedRecipe {
  ingredients: string[];
  steps: string[];
}

const scriptDirectory = dirname(fileURLToPath(import.meta.url));
const repositoryRoot = resolve(scriptDirectory, "..");
const contentRoot = join(repositoryRoot, "content", "how-to-cook");
const catalogPath = join(
  repositoryRoot,
  "packages",
  "schemas",
  "src",
  "sourceRecipes",
  "sourceRecipeCatalogData.json",
);
const outputPath = join(repositoryRoot, "packages", "lean-proofs", "LeanToCook", "Generated");

const cleanInlineMarkdown = (value: string) =>
  value
    .replaceAll(/!\[([^\]]*)\]\([^)]+\)/g, "$1")
    .replaceAll(/\[([^\]]+)\]\([^)]+\)/g, "$1")
    .replaceAll(/[*_`~]/g, "")
    .replace(/^>\s*/, "")
    .trim();

const getSectionLines = (markdown: string, heading: string) => {
  const lines = markdown.split("\n");
  const startIndex = lines.findIndex((line) => line.trim() === `## ${heading}`);

  if (startIndex < 0) return [];

  const followingLines = lines.slice(startIndex + 1);
  const endIndex = followingLines.findIndex((line) => /^##\s+/u.test(line.trim()));

  return (endIndex < 0 ? followingLines : followingLines.slice(0, endIndex))
    .map((line) => line.trim())
    .filter((line) => line.length > 0);
};

export const parseRecipeForLean = (markdown: string): ParsedRecipe => {
  const ingredients = getSectionLines(markdown, "必备原料和工具").flatMap((line) => {
    const match = line.match(/^[-*+]\s+(.+)$/u);

    return match?.[1] ? [cleanInlineMarkdown(match[1])] : [];
  });
  const steps = getSectionLines(markdown, "操作").flatMap((line) => {
    const match = line.match(/^\d+[.)、]\s*(.+)$/u);

    if (!match?.[1] || /^!\[[^\]]*\]\([^)]+\)$/u.test(match[1])) return [];

    return [cleanInlineMarkdown(match[1])];
  });

  return { ingredients, steps };
};

const toLeanString = (value: string) => JSON.stringify(value.replaceAll("\r", ""));

export const buildLeanRecipe = (sourceRecipe: SourceRecipeCatalogEntry, recipe: ParsedRecipe) => {
  const declaration = `recipe_${sourceRecipe.id}`;
  const ingredientLines = recipe.ingredients.map((ingredient) => `    ${toLeanString(ingredient)}`);
  const stepLines = recipe.steps.map(
    (instruction, index) =>
      `    { index := ${index + 1}, instruction := ${toLeanString(instruction)} }`,
  );

  return `/- ${sourceRecipe.title} · ${sourceRecipe.sourcePath} -/
def ${declaration} : Recipe := {
  id := ${toLeanString(sourceRecipe.id)}
  title := ${toLeanString(sourceRecipe.title)}
  category := ${toLeanString(sourceRecipe.category)}
  sourcePath := ${toLeanString(sourceRecipe.sourcePath)}
  sourceCommit := ${toLeanString(sourceRecipe.upstreamCommit)}
  ingredients := [
${ingredientLines.join(",\n")}
  ]
  steps := [
${stepLines.join(",\n")}
  ]
}

theorem ${declaration}_ingredients_nonempty :
    ${declaration}.ingredients.isEmpty = false := by decide

theorem ${declaration}_steps_nonempty :
    ${declaration}.steps.isEmpty = false := by decide

theorem ${declaration}_step_count :
    ${declaration}.steps.length = ${recipe.steps.length} := by decide

theorem ${declaration}_steps_ordered :
    orderedFrom 1 ${declaration}.steps = true := by decide

theorem ${declaration}_executes_to_terminal :
    executesToTerminal ${declaration} = true := by decide

theorem ${declaration}_kernel_certificate :
    kernelCertified ${declaration} = true := by decide`;
};

export const buildSourceProofFiles = (
  sourceRecipes: SourceRecipeCatalogEntry[],
  loadMarkdown: (sourcePath: string) => string,
): Record<string, string> => {
  const files: Record<string, string> = {};
  const ids = new Set<string>();
  const categories = new Map<string, string>();
  for (const recipe of sourceRecipes) {
    const path = getSourceProofPath(recipe);
    const category = path.split("/")[1]!;
    if (
      ids.has(recipe.id) ||
      (categories.has(category) && categories.get(category) !== recipe.category)
    )
      throw new Error(`Duplicate source proof identity: ${recipe.category}/${recipe.id}`);
    ids.add(recipe.id);
    categories.set(category, recipe.category);
    const parsed = parseRecipeForLean(loadMarkdown(recipe.sourcePath));
    if (!parsed.ingredients.length || !parsed.steps.length)
      throw new Error(`Cannot certify empty recipe: ${recipe.sourcePath}`);
    files[path] =
      `/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/\nimport LeanToCook.Core.SourceRecipe\n\nnamespace LeanToCook.SourceCatalog\n\n${buildLeanRecipe(recipe, parsed)}\n\nend LeanToCook.SourceCatalog\n`;
  }
  const imports = sourceRecipes.map(
    (recipe) =>
      `import LeanToCook.Generated.${getSourceProofPath(recipe)
        .replace(/\.lean$/, "")
        .replaceAll("/", ".")}`,
  );
  files["SourceCatalog.lean"] = `/- AUTO-GENERATED by scripts/generate-source-recipe-proofs.ts.
Structural certificates; no claim about physical safety, nutrition, or culinary sufficiency.
Source: Anduin2017/HowToCook @ ${sourceRecipes[0]?.upstreamCommit ?? "unknown"}; Unlicense.
-/
${imports.length ? imports.join("\n") : "import LeanToCook.Core.SourceRecipe"}

namespace LeanToCook.SourceCatalog

def allRecipes : List Recipe := [
${sourceRecipes.map((recipe) => `  recipe_${recipe.id}`).join(",\n")}
]

set_option maxRecDepth 10000 in
theorem allRecipes_count : allRecipes.length = ${sourceRecipes.length} := by decide

end LeanToCook.SourceCatalog
`;
  return files;
};

export const buildSourceCatalogLean = (
  sourceRecipes: SourceRecipeCatalogEntry[],
  loadMarkdown: (sourcePath: string) => string,
) => buildSourceProofFiles(sourceRecipes, loadMarkdown)["SourceCatalog.lean"]!;

if (import.meta.main) {
  const sourceRecipes = JSON.parse(readFileSync(catalogPath, "utf8")) as SourceRecipeCatalogEntry[];
  const files = buildSourceProofFiles(sourceRecipes, (path) =>
    readFileSync(join(contentRoot, path), "utf8"),
  );
  const expected = new Set(Object.keys(files));
  const existing = (directory: string): string[] =>
    readdirSync(directory, { withFileTypes: true }).flatMap((entry) =>
      entry.isDirectory()
        ? existing(join(directory, entry.name)).map((path) => `${entry.name}/${path}`)
        : [entry.name],
    );
  mkdirSync(outputPath, { recursive: true });
  const stale = existing(outputPath).filter((path) => !expected.has(path));
  const drifted = Object.entries(files).filter(([path, content]) => {
    const full = join(outputPath, path);
    return !existsSync(full) || readFileSync(full, "utf8") !== content;
  });
  if (process.argv.includes("--check")) {
    if (stale.length || drifted.length)
      throw new Error(
        `Generated Lean drift: ${stale.length} stale, ${drifted.length} changed/missing files`,
      );
  } else {
    for (const path of stale) rmSync(join(outputPath, path));
    for (const [path, content] of Object.entries(files)) {
      mkdirSync(dirname(join(outputPath, path)), { recursive: true });
      writeFileSync(join(outputPath, path), content);
    }
  }
  console.log(
    `${process.argv.includes("--check") ? "Checked" : "Generated"} ${sourceRecipes.length} Lean structural certificates in ${outputPath}.`,
  );
}
