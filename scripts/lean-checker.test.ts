import { afterEach, describe, expect, it } from "bun:test";
import { appendFileSync, cpSync, mkdirSync, mkdtempSync, rmSync } from "node:fs";
import { join, resolve } from "node:path";
import * as checker from "./lean-architecture/checkLeanImports";
import { buildLeanMetadata } from "./generate-lean-metadata";

const temporaryDirectories: string[] = [];
afterEach(() => {
  for (const path of temporaryDirectories.splice(0)) rmSync(path, { recursive: true });
});

describe("Lean dependency layer checks", () => {
  it("checks valid imports containing nested comments or line breaks", () => {
    expect(typeof checker.checkLeanImports).toBe("function");
    const result = checker.checkLeanImports(
      "LeanToCook/Recipes/TomatoEgg/Model.lean",
      `
/- import Fake.Module /- nested comment -/ -/
import /- context -/ LeanToCook.Core.Execution -- trailing comment
import
  LeanToCook.Verification.CrossRecipe
namespace Example
def label := "import Fake.String"
end Example
`,
    );
    expect(result.isErr()).toBe(true);
    if (result.isErr())
      expect(result.error.message).toContain("LeanToCook.Verification.CrossRecipe");
  });

  it("keeps commented imports and quoted import text out of dependencies", () => {
    expect(typeof checker.checkLeanImports).toBe("function");
    expect(
      checker
        .checkLeanImports(
          "LeanToCook/Recipes/TomatoEgg/Model.lean",
          `
import LeanToCook.Core.Execution -- real dependency
/- import LeanToCook.Verification.CrossRecipe -/
namespace Example
def label := "import LeanToCook.Verification.CrossRecipe"
end Example
`,
        )
        .isOk(),
    ).toBe(true);
  });

  it("does not parse raw string contents after the module header", () => {
    expect(
      checker
        .checkLeanImports(
          "LeanToCook/Recipes/TomatoEgg/Model.lean",
          `
import LeanToCook.Core.Execution
def label := r#"a quote " and /- inside raw text"#
`,
        )
        .isOk(),
    ).toBe(true);
  });

  it("prevents a recipe proof from importing verification or another recipe", () => {
    expect(typeof checker.checkLeanImports).toBe("function");
    for (const dependency of [
      "LeanToCook.Verification.CrossRecipe",
      "LeanToCook.Recipes.ThreeFresh.Proofs",
    ])
      expect(
        checker
          .checkLeanImports("LeanToCook/Recipes/TomatoEgg/Proofs.lean", `import ${dependency}\n`)
          .isErr(),
      ).toBe(true);
  });

  it("allows its own specification and local lemmas", () => {
    expect(typeof checker.checkLeanImports).toBe("function");
    expect(
      checker
        .checkLeanImports(
          "LeanToCook/Recipes/TomatoEgg/Proofs.lean",
          "import LeanToCook.Recipes.TomatoEgg.Spec\nimport LeanToCook.Recipes.TomatoEgg.Lemmas.ReserveOrder\n",
        )
        .isOk(),
    ).toBe(true);
  });
});

it("rebuilds source digests from the current filesystem on each invocation", () => {
  const base = resolve(import.meta.dir, "../docs/anatomy-designs/2026-11-01-lean-followup");
  mkdirSync(base, { recursive: true });
  const fixture = mkdtempSync(join(base, "metadata-"));
  temporaryDirectories.push(fixture);
  cpSync(resolve(import.meta.dir, "../packages/lean-proofs"), fixture, {
    recursive: true,
    filter: (source) => !source.includes("/.lake") && !source.includes("/node_modules"),
  });
  const first = buildLeanMetadata(fixture)["verification/manifest.json"];
  appendFileSync(
    join(fixture, "LeanToCook/Core/Quantities.lean"),
    "\n/- changed fixture source -/\n",
  );
  const second = buildLeanMetadata(fixture)["verification/manifest.json"];
  expect(second.subjects[0]!.sourceDigest).not.toBe(first.subjects[0]!.sourceDigest);
});
