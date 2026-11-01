import { expect, it } from "vitest";
import { planIngredientLinks } from "./planIngredientLinks.helper";
const date = new Date();
const requirement = (label: string, id = label) => ({
  id,
  recipeId: "recipe",
  label,
  updatedAt: date,
  recipeUpdatedAt: date,
});
const milk = { id: "milk", name: "牛奶", sourceName: "牛奶", aliases: ["纯牛奶", "ＭＩＬＫ"] };
it("links whole normalized names and confirmed aliases without guessing alternatives or tools", () => {
  const plan = planIngredientLinks(
    [milk],
    [
      requirement("牛奶"),
      requirement(" milk "),
      requirement("纯牛奶"),
      requirement("牛奶（或水）"),
      requirement("牛奶 100ml"),
      requirement("奶锅"),
    ],
  );
  expect(plan.links.map((row) => row.ingredientId)).toEqual(["milk", "milk", "milk"]);
  expect(plan.unmatched).toBe(3);
});
it("retains original-name bindings and refuses an ambiguous name", () => {
  const plan = planIngredientLinks(
    [
      { ...milk, name: "鲜牛奶" },
      { ...milk, id: "other", name: "奶油", sourceName: null, aliases: ["纯牛奶"] },
    ],
    [requirement("牛奶"), requirement("纯牛奶")],
  );
  expect(plan.links.map((row) => row.ingredientId)).toEqual(["milk"]);
  expect(plan.ambiguous).toBe(1);
});
