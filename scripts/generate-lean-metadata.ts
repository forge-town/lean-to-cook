import { createHash } from "node:crypto";
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { err, ok } from "neverthrow";
import { recipeCatalog } from "../packages/schemas/src/recipes/recipeCatalog";
import { sourceRecipeCatalog } from "../packages/schemas/src/sourceRecipes/sourceRecipeCatalog";
import { LeanManifestSchema } from "../packages/schemas/src/leanVerification/LeanManifest.schema";
import { LeanActionMapSchema } from "../packages/schemas/src/leanVerification/LeanActionMap.schema";
import { getSourceProofPath } from "../packages/lean-proofs/bridge/sourceProofPath";

const root = resolve(import.meta.dir, "../packages/lean-proofs");
const claims = (source: string) =>
  [...source.matchAll(/^theorem (\w+)((?:\s*\([^)]*\))*)\s*:\s*([\s\S]*?)\s*:=\s*by\b/gm)].map(
    (match) => ({ proof: match[1]!, parameters: match[2]!.trim(), expression: match[3]!.trim() }),
  );

export const buildLeanMetadata = (sourceRoot = root) => {
  const root = sourceRoot;
  const load = (module: string) =>
    readFileSync(join(root, module.replaceAll(".", "/") + ".lean"), "utf8");
  const filesUnder = (folder: string): string[] =>
    readdirSync(join(root, folder), { withFileTypes: true }).flatMap((entry) =>
      entry.isDirectory() ? filesUnder(`${folder}/${entry.name}`) : [`${folder}/${entry.name}`],
    );
  const shared = [...filesUnder("LeanToCook/Core"), ...filesUnder("LeanToCook/Theories")]
    .sort()
    .map((path) => path + "\0" + readFileSync(join(root, path), "utf8"))
    .join("\0");
  const digest = (modules: string[]) =>
    createHash("sha256")
      .update(shared + modules.map((module) => module + "\0" + load(module)).join("\0"))
      .digest("hex");
  const subjects = recipeCatalog.map((recipe) => {
    const generic = recipe.proof.module === "LeanToCook.CatalogCases.Proofs";
    const namespace = generic
      ? "LeanToCook.CatalogCases"
      : recipe.proof.module.replace(/\.Recipes\./, ".").replace(/\.Proofs$/, "");
    const base = recipe.proof.module.replace(/\.Proofs$/, "");
    const modules = [base + ".Model", base + ".Spec", base + ".Proofs"];
    const stem = recipe.proof.theorems[0]!.name.replace(/_is_certified$/, "");
    const all = claims(load(recipe.proof.module));

    return {
      id: recipe.id,
      scope: generic ? "generic-four-stage" : "recipe-execution",
      namespace,
      modules,
      sourceDigest: digest(modules),
      review: "unchecked",
      claims: generic ? all.filter((claim) => claim.proof.startsWith(stem + "_")) : all,
    };
  });
  const sourceSubjects = sourceRecipeCatalog.map((recipe) => {
    const module =
      "LeanToCook.Generated." +
      getSourceProofPath(recipe)
        .replace(/\.lean$/, "")
        .replaceAll("/", ".");

    return {
      id: recipe.id,
      scope: "source-structure",
      namespace: "LeanToCook.SourceCatalog",
      modules: [module],
      sourceDigest: digest([module]),
      review: "unchecked",
      provenance: { commit: recipe.upstreamCommit, path: recipe.sourcePath },
      claims: claims(load(module)),
    };
  });
  const dataModules = ["References", "Ingredients", "Recipes", "Proofs"].map(
    (name) => "LeanToCook.DataContracts." + name,
  );

  const manifest = LeanManifestSchema.parse({
    schemaVersion: 1,
    leanVersion: readFileSync(join(root, "lean-toolchain"), "utf8").trim().split(":v")[1],
    allowedAxioms: ["propext", "Quot.sound", "Classical.choice"],
    subjects: [
      ...subjects,
      ...sourceSubjects,
      {
        id: "generic-model",
        scope: "generic-four-stage",
        namespace: "LeanToCook.CatalogCases",
        modules: ["Model", "Spec", "Proofs"].map((part) => "LeanToCook.CatalogCases." + part),
        sourceDigest: digest(
          ["Model", "Spec", "Proofs"].map((part) => "LeanToCook.CatalogCases." + part),
        ),
        review: "unchecked",
        claims: claims(load("LeanToCook.CatalogCases.Proofs")).filter((claim) =>
          claim.proof.startsWith("all_expansion_"),
        ),
      },
      {
        id: "catalog-data",
        scope: "catalog-data",
        namespace: "LeanToCook.CatalogData",
        modules: dataModules,
        sourceDigest: digest(dataModules),
        review: "unchecked",
        claims: claims(load("LeanToCook.DataContracts.Proofs")),
      },
    ],
  });
  const actionMap = LeanActionMapSchema.parse({
    schemaVersion: 1,
    correspondence: "checked-mapping-only",
    sourceWorkbench: "presentation-only",
    recipes: recipeCatalog.map((recipe) => {
      const subject = manifest.subjects.find((item) => item.id === recipe.id)!;
      const genericActions: Record<string, string> = {
        prepareCatalogCase: "prepare",
        processCatalogCase: "process",
        finishCatalogCase: "finish",
        plateCatalogCase: "plate",
      };

      return {
        recipeId: recipe.id,
        scope: subject.scope,
        namespace: subject.namespace,
        module: subject.modules[0],
        plan: load(subject.modules[0]!).match(/def (\w+Plan) : List Step/)?.[1],
        steps: recipe.steps.map((step) => ({
          id: step.id,
          sequence: step.sequence,
          formalAction: step.formalAction,
          requires: step.requires,
          effects: step.effects,
          constructor:
            subject.scope === "generic-four-stage"
              ? genericActions[step.formalAction]
              : step.formalAction,
        })),
      };
    }),
  });

  return {
    "verification/manifest.json": manifest,
    "verification/manifest.schema.json": LeanManifestSchema.toJSONSchema(),
    "bridge/action-map.json": actionMap,
    "bridge/action-map.schema.json": LeanActionMapSchema.toJSONSchema(),
  };
};
export const validateLeanMetadata = (manifest: unknown, actionMap: unknown) => {
  const parsedManifest = LeanManifestSchema.safeParse(manifest);
  const parsedMap = LeanActionMapSchema.safeParse(actionMap);
  if (!parsedManifest.success || !parsedMap.success)
    return err(new Error("Invalid Lean metadata schema"));
  const expected = buildLeanMetadata();
  if (
    JSON.stringify(parsedManifest.data) !== JSON.stringify(expected["verification/manifest.json"])
  )
    return err(new Error("Lean coverage/target/source digest drift"));
  if (JSON.stringify(parsedMap.data) !== JSON.stringify(expected["bridge/action-map.json"]))
    return err(new Error("Lean/frontend action correspondence drift"));

  return ok({ manifest: parsedManifest.data, actionMap: parsedMap.data });
};

if (import.meta.main) {
  for (const [path, value] of Object.entries(buildLeanMetadata())) {
    const full = join(root, path);
    const content = JSON.stringify(value, null, 2) + "\n";
    if (process.argv.includes("--check")) {
      if (!existsSync(full) || readFileSync(full, "utf8") !== content)
        throw new Error(`Lean metadata drift: ${path}`);
    } else {
      mkdirSync(dirname(full), { recursive: true });
      writeFileSync(full, content);
    }
  }
  console.log("Lean verification manifest and action correspondence are up to date.");
}
