import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { sourceRecipeCatalog } from "@repo/schemas";
import { getSourceProofPath } from "../../../packages/lean-proofs/bridge/sourceProofPath";
import { describe, expect, it } from "vitest";

const sourceCatalogLean = readFileSync(
  resolve(
    import.meta.dirname,
    "../../../packages/lean-proofs/LeanToCook/Generated/SourceCatalog.lean"
  ),
  "utf8"
);

describe("generated Lean source recipe certificates", () => {
  it("publishes a structural kernel certificate for every source recipe", () => {
    const certificates = sourceRecipeCatalog.map((recipe) =>
      readFileSync(
        resolve(
          import.meta.dirname,
          "../../../packages/lean-proofs/LeanToCook/Generated",
          getSourceProofPath(recipe)
        ),
        "utf8"
      )
    );

    expect(certificates).toHaveLength(sourceRecipeCatalog.length);

    for (const [index, recipe] of sourceRecipeCatalog.entries()) {
      const source = certificates[index]!;
      expect(source).toContain(`def recipe_${recipe.id} : Recipe`);
      expect(source).toContain(`theorem recipe_${recipe.id}_kernel_certificate`);
      expect(source).toContain(`sourcePath := ${JSON.stringify(recipe.sourcePath)}`);
    }
  });

  it("closes the generated catalog at all 373 recipes", () => {
    expect(sourceCatalogLean).toContain(
      `theorem allRecipes_count : allRecipes.length = ${sourceRecipeCatalog.length} := by decide`
    );
  });
});
