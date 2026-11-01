import { describe, expect, it } from "vitest";

import { appliedTheoryCatalog, appliedTheorySchema, getRecipeById, getTheoryById } from "./index";

describe("applied theory catalog", () => {
  it("publishes seven vertical theorems and one synthesis theorem", () => {
    expect(appliedTheoryCatalog).toHaveLength(8);
    expect(appliedTheoryCatalog.filter(({ scale }) => scale === "vertical")).toHaveLength(7);
    expect(appliedTheoryCatalog.filter(({ scale }) => scale === "synthesis")).toHaveLength(1);
    expect(new Set(appliedTheoryCatalog.map(({ id }) => id)).size).toBe(8);
  });

  it("resolves every case and theory reference", () => {
    for (const application of appliedTheoryCatalog) {
      expect(appliedTheorySchema.parse(application)).toEqual(application);
      expect(application.lean.module).toBe("LeanToCook.Verification.AppliedTheory");

      for (const recipeId of application.caseIds) {
        expect(getRecipeById(recipeId)?.id).toBe(recipeId);
      }

      for (const theoryId of application.theoryIds) {
        expect(getTheoryById(theoryId)?.id).toBe(theoryId);
      }
    }
  });
});
