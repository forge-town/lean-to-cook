import { existsSync } from "node:fs";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { getSourceRecipeById } from "@repo/schemas";
import { compileCatalogLean } from "../compileCatalogLean/compileCatalogLean.helper";
import { leanProjectRoot, loadLeanModel, loadOriginLean } from "./loadLeanModel.helper";

describe("normalized Lean source loading", () => {
  it("locates the Lake package independently of the model depth", () => {
    expect(existsSync(join(leanProjectRoot, "lakefile.lean"))).toBe(true);
  });

  it("returns a complete data model for display and certificate digests", async () => {
    const source = await loadLeanModel();
    for (const declaration of [
      "structure Reference",
      "structure Ingredient",
      "structure Recipe",
      "structure Quantity",
      "def recipeValid",
    ])
      expect(source).toContain(declaration);
  });

  it("loads and compiles the exact origin certificate after splitting the catalog", async () => {
    const known = getSourceRecipeById("4378c05c5f7b")!;
    const raw = {
      resource: "recipes",
      record: {
        recipeSources: [
          { sourceId: known.id, path: known.sourcePath, commit: known.upstreamCommit },
        ],
      },
    } as Parameters<typeof loadOriginLean>[0];
    const origin = await loadOriginLean(raw);
    expect(origin?.source).toContain(`theorem recipe_${known.id}_kernel_certificate`);
    expect(origin?.source).toContain("import LeanToCook.Core.SourceRecipe");
    expect(origin?.source).not.toContain("def allRecipes");
    const checked = await compileCatalogLean([
      origin!.source,
      `namespace CatalogQuantityRegression
open LeanToCook.CatalogData
example : requirementValid [] ["g"] ⟨"盐", .unclassified, none, "", some ⟨1000000, "g"⟩, false⟩ = true := by decide
example : requirementValid [] ["g"] ⟨"盐", .unclassified, none, "", some ⟨0, "g"⟩, false⟩ = false := by decide
end CatalogQuantityRegression`,
    ]);
    expect(checked.leanVersion).toContain("4.25.0");
  }, 60000);
});
