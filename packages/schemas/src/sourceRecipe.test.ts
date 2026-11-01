import { describe, expect, it } from "vitest";

import { recipeCategorySchema } from "./domain/RecipeCategory.schema";
import { sourceRecipeCatalog } from "./sourceRecipes/sourceRecipeCatalog";
import { sourceRecipeCoverage } from "./sourceRecipes/sourceRecipeCoverage";

describe("source recipe catalog", () => {
  it("indexes every non-template recipe from the pinned HowToCook snapshot", () => {
    expect(sourceRecipeCatalog).toHaveLength(373);
    expect(new Set(sourceRecipeCatalog.map(({ id }) => id)).size).toBe(373);
    expect(new Set(sourceRecipeCatalog.map(({ sourcePath }) => sourcePath)).size).toBe(373);
  });

  it.each([
    "dishes/meat_dish/冬瓜桑拿鸡.md",
    "dishes/soup/山药南瓜炖鸡汤.md",
    "dishes/soup/白萝卜丝清汤.md",
    "dishes/staple/滕州菜煎饼.md",
    "dishes/vegetable_dish/炒土豆和胡萝卜蒸菜.md",
    "dishes/vegetable_dish/炸洋葱花/炸洋葱花.md",
  ])("imports the new upstream recipe %s", (sourcePath) => {
    expect(sourceRecipeCatalog.some((recipe) => recipe.sourcePath === sourcePath)).toBe(true);
  });

  it("retains only the canonical Chenpi pork rib soup document", () => {
    expect(sourceRecipeCatalog.filter((recipe) => recipe.title === "陈皮排骨汤")).toHaveLength(1);
    expect(
      sourceRecipeCatalog.some(
        (recipe) => recipe.sourcePath === "dishes/soup/陈皮排骨汤/陈皮排骨汤.md",
      ),
    ).toBe(true);
    expect(
      sourceRecipeCatalog.some((recipe) => recipe.sourcePath === "dishes/soup/陈皮排骨汤.md"),
    ).toBe(false);
  });

  it("keeps provenance and covers every supported recipe category", () => {
    expect(new Set(sourceRecipeCatalog.map(({ category }) => category))).toEqual(
      new Set(recipeCategorySchema.options),
    );

    for (const recipe of sourceRecipeCatalog) {
      expect(recipe.license).toBe("Unlicense");
      expect(recipe.upstreamCommit).toBe("308cc8b7dab1da84b20e7fafdf836a715437f582");
      expect(recipe.sourceUrl).toContain(recipe.upstreamCommit);
    }
  });

  it("publishes only successfully compiled recipes as verified", () => {
    expect(sourceRecipeCoverage.summary).toMatchObject({
      catalogEntries: sourceRecipeCatalog.length,
      compilationFailure: 0,
      duplicate: 0,
      missingProof: 0,
      missingSchema: 0,
      sourceRecipes: sourceRecipeCatalog.length,
      sourceDrift: 0,
      verified: sourceRecipeCatalog.length,
    });
    expect(sourceRecipeCoverage.entries).toHaveLength(sourceRecipeCatalog.length);
    expect(sourceRecipeCoverage.entries.every(({ status }) => status === "verified")).toBe(true);
  });
});
