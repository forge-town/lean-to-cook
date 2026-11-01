import { describe, expect, it } from "bun:test";
import * as generator from "./generate-source-recipe-proofs";
import { readFileSync } from "node:fs";
import { planAnatomyBundle } from "anatomy-cli";

const entry = {
  id: "abc123",
  category: "vegetable",
  title: "Test",
  license: "Unlicense" as const,
  sourcePath: "dishes/test.md",
  sourceUrl: "https://example.com/test",
  upstreamCommit: "fixed",
};
const markdown = "## 必备原料和工具\n- 土豆\n\n## 操作\n1. 洗净土豆\n";

describe("split Lean source generation", () => {
  it("keeps the generated catalog as an import and registry entrypoint", () => {
    const source = generator.buildSourceCatalogLean([entry], () => markdown);
    expect(source).toContain("import LeanToCook.Generated.Sources.Vegetable.RecipeAbc123");
    expect(source).not.toContain("structure Recipe where");
    expect(source).not.toContain("theorem recipe_abc123_kernel_certificate");
    expect(source).toContain("recipe_abc123");
  });

  it("emits a standalone certificate with the shared model import", () => {
    expect(typeof generator.buildSourceProofFiles).toBe("function");
    const files = generator.buildSourceProofFiles([entry], () => markdown);
    const certificate = files["Sources/Vegetable/RecipeAbc123.lean"];
    expect(certificate).toContain("import LeanToCook.Core.SourceRecipe");
    expect(certificate).toContain("theorem recipe_abc123_kernel_certificate");
    expect(certificate).toContain('sourceCommit := "fixed"');
    expect(files["SourceCatalog.lean"]).toBe(
      generator.buildSourceCatalogLean([entry], () => markdown),
    );
  });

  it("rejects duplicate IDs and canonical category collisions", () => {
    expect(typeof generator.buildSourceProofFiles).toBe("function");
    expect(() => generator.buildSourceProofFiles([entry, entry], () => markdown)).toThrow();
    expect(() =>
      generator.buildSourceProofFiles(
        [entry, { ...entry, id: "def456", category: "Vegetable" }],
        () => markdown,
      ),
    ).toThrow();
  });

  it("rejects empty source plans", () => {
    expect(() => generator.buildSourceCatalogLean([entry], () => "## 操作\n")).toThrow(
      "Cannot certify empty recipe",
    );
  });
});

describe("portable recipe Anatomy", () => {
  const bundle = JSON.parse(readFileSync(new URL("../anatomy.json", import.meta.url), "utf8"));
  const recipeBundle = { ...bundle, root: "lean-recipe-unit" };
  const tree = (name: string, files: string[]) => ({
    kind: "directory",
    name,
    children: files.map((name) => ({ kind: "file", name })),
  });
  const blocking = (target: ReturnType<typeof tree>, candidate = recipeBundle) => {
    const result = planAnatomyBundle({
      bundle: candidate,
      target,
      coverage: { status: "complete" },
    });
    expect(result.isOk()).toBe(true);
    return result.isOk() ? result.value.issues.filter((issue) => issue.severity === "block") : [];
  };

  it("accepts separately named recipes without optional helper folders", () => {
    for (const name of ["TomatoEgg", "ThreeFresh"])
      expect(blocking(tree(name, ["Model.lean", "Spec.lean", "Proofs.lean"]))).toHaveLength(0);
  });

  it("blocks missing proofs and undeclared legacy files", () => {
    expect(blocking(tree("TomatoEgg", ["Model.lean", "Spec.lean"])).length).toBeGreaterThan(0);
    expect(
      blocking(tree("TomatoEgg", ["Model.lean", "Spec.lean", "Proofs.lean", "Legacy.lean"])).length,
    ).toBeGreaterThan(0);
  });

  it("blocks names that break the PascalCase binding", () => {
    expect(
      blocking(tree("tomato-egg", ["Model.lean", "Spec.lean", "Proofs.lean"])).length,
    ).toBeGreaterThan(0);
  });
});
