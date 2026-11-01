import { describe, expect, it } from "vitest";

import { getIngredientIconAsset } from "./ingredientIconCatalog";

describe("getIngredientIconAsset", () => {
  it.each([
    ["蒜末", "allium", "garlic"],
    ["洋葱", "allium", "onion"],
    ["香葱", "allium", "herb"],
    ["生姜", "ginger", "gingerRoot"],
    ["龙虾", "shellfish", "lobster"],
    ["生蚝", "shellfish", "oyster"],
    ["鲜虾", "shrimp", "shrimp"],
    ["鸡翅中", "meat", "poultryLeg"],
    ["鸡蛋", "egg", "egg"],
    ["鸡精", "seasoning", "salt"],
    ["牛奶", "liquid", "glassOfMilk"],
    ["牛油果", "fruit", "avocado"],
    ["猪油", "butter", "butter"],
    ["食用油", "oil", "pouringLiquid"],
    ["柠檬", "fruit", "lemon"],
    ["豆腐", "tofu", "tofu"],
  ] as const)("maps %s to a specific Fluent asset", (name, kind, expected) => {
    expect(getIngredientIconAsset({ kind, name, state: "raw" }).key).toBe(expected);
  });

  it.each([
    ["鸡蛋", "egg", "cooking"],
    ["红薯", "potato", "roastedSweetPotato"],
    ["米饭", "rice", "cookedRice"],
    ["番茄蛋花汤", "liquid", "bowlWithSpoon"],
  ] as const)("uses a cooked variant for %s", (name, kind, expected) => {
    expect(getIngredientIconAsset({ kind, name, state: "cooked" }).key).toBe(expected);
  });

  it("falls back to the ingredient kind", () => {
    expect(getIngredientIconAsset({ kind: "mushroom", name: "未知菌类", state: "raw" })).toEqual({
      key: "mushroom",
      src: "/ingredient-icons/fluent-flat/mushroom.svg",
    });
  });
});
