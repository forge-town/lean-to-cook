import { execFileSync } from "node:child_process";
import { readFileSync, readdirSync } from "node:fs";
import { join, resolve } from "node:path";
import { Result } from "neverthrow";
import { validateLeanMetadata } from "./generate-lean-metadata";
import { checkLeanImports } from "./lean-architecture/checkLeanImports";

const collect = (directory: string): string[] =>
  readdirSync(directory, { withFileTypes: true }).flatMap((entry) =>
    entry.isDirectory()
      ? collect(join(directory, entry.name))
      : entry.name.endsWith(".lean")
        ? [join(directory, entry.name)]
        : [],
  );

const root = resolve(import.meta.dir, "../packages/lean-proofs");
const main = Result.fromThrowable(() => {
  const validation = validateLeanMetadata(
    JSON.parse(readFileSync(join(root, "verification/manifest.json"), "utf8")),
    JSON.parse(readFileSync(join(root, "bridge/action-map.json"), "utf8")),
  );
  if (validation.isErr()) throw validation.error;
  const { manifest, actionMap } = validation.value;
  for (const path of collect(join(root, "LeanToCook"))) {
    const local = path.slice(root.length + 1).replaceAll("\\", "/");
    const checked = checkLeanImports(local, readFileSync(path, "utf8"));
    if (checked.isErr()) throw checked.error;
  }
  const targets: string[] = [
    "import LeanToCook",
    "set_option maxRecDepth 10000",
    "set_option maxHeartbeats 4000000",
  ];
  const claimCount = manifest.subjects.reduce((count, subject) => count + subject.claims.length, 0);
  for (const subject of manifest.subjects) {
    targets.push(`namespace ${subject.namespace}`);
    for (const claim of subject.claims) {
      const args = [...claim.parameters.matchAll(/\((\w+)\s*:/g)]
        .map((match) => match[1])
        .join(" ");
      targets.push(
        `example ${claim.parameters} : ${claim.expression} := ${claim.proof} ${args}`,
        `#print axioms ${claim.proof}`,
      );
    }
    targets.push(`end ${subject.namespace}`);
  }
  for (const recipe of actionMap.recipes) {
    targets.push(
      `example : ([${recipe.steps.map((step) => `${recipe.namespace}.Step.${step.constructor}`).join(", ")}] : List ${recipe.namespace}.Step) = ${recipe.namespace}.${recipe.plan} := by decide`,
    );
    for (const step of recipe.steps)
      targets.push(
        `#check (${recipe.namespace}.Step.${step.constructor} : ${recipe.namespace}.Step)`,
      );
  }
  const output = execFileSync("lake", ["env", "lean", "-DwarningAsError=true", "--stdin"], {
    cwd: root,
    input: targets.join("\n"),
    encoding: "utf8",
    timeout: 180_000,
    maxBuffer: 32 * 1024 * 1024,
  });
  const reportedClaims = [...output.matchAll(/does not depend on any axioms|depends on axioms:/g)]
    .length;
  if (reportedClaims !== claimCount)
    throw new Error(`Incomplete Lean axiom report: ${reportedClaims}/${claimCount}`);
  const axioms = new Set(
    [...output.matchAll(/depends on axioms:\s*\[([\s\S]*?)\]/g)].flatMap((match) =>
      match[1]!.split(/[,\s]+/).filter(Boolean),
    ),
  );
  for (const axiom of axioms)
    if (!manifest.allowedAxioms.includes(axiom)) throw new Error(`Unapproved Lean axiom: ${axiom}`);

  return {
    subjects: manifest.subjects.length,
    claims: claimCount,
    recipes: actionMap.recipes.length,
    actions: actionMap.recipes.reduce((count, recipe) => count + recipe.steps.length, 0),
    axioms: [...axioms],
    correspondence: actionMap.correspondence,
    review: "unchecked",
  };
});
if (import.meta.main)
  main().match(
    (result) => console.log(JSON.stringify(result, null, 2)),
    (error) => {
      console.error(error);
      process.exitCode = 1;
    },
  );
