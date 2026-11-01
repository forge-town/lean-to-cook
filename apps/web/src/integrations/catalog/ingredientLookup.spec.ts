import { expect, it } from "vitest";
import { findIngredientPresentation } from "./ingredientLookup";
import type { PublicIngredient } from "@repo/schemas/catalog";
it("keeps original recipe bindings after a rename and resolves aliases with NFKC", () => {
  const record: PublicIngredient = {
    id: crypto.randomUUID(),
    name: "可乐饮料",
    sourceName: "可乐",
    description: "",
    categoryId: null,
    imageKey: "jar",
    aliases: ["Ｃｏｋｅ"],
    updatedAt: new Date().toISOString(),
  };
  expect(findIngredientPresentation([record], "可乐")).toBe(record);
  expect(findIngredientPresentation([record], "coke")).toBe(record);
  expect(findIngredientPresentation([record], "其他食材")).toBeUndefined();
  // An original source binding wins over a later ambiguous alias.
  expect(
    findIngredientPresentation(
      [{ ...record, sourceName: "其他", aliases: ["可乐"] }, record],
      "可乐"
    )
  ).toBe(record);
});
