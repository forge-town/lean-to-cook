import { expect, it } from "vitest";
import { toEditorValues, toWriteValues } from "./editorValues";
import { CatalogWriteSchema, RecipeInputSchema, type RecipeInput } from "@repo/schemas/catalog";
const raw: RecipeInput = {
  title: "鸡蛋",
  categoryId: null,
  description: "",
  servings: null,
  notes: "",
  requirements: [
    {
      label: "盐适量",
      kind: "unclassified",
      ingredientId: null,
      amount: null,
      unitId: null,
      quantityText: "适量",
      optional: false,
    },
  ],
  steps: ["加盐"],
};
it("preserves unresolved requirements and unknown portions through the editor", () => {
  const form = toEditorValues("recipes", raw);
  expect(form.servings).toBe("");
  expect(toWriteValues("recipes", form)).toEqual(raw);
});
it("does not mutate the fetched recipe while editing", () => {
  const form = toEditorValues("recipes", raw);
  form.requirements[0]!.label = "changed";
  expect(raw.requirements[0]!.label).toBe("盐适量");
});
it("converts explicit amounts and aliases to API contracts", () => {
  const form = toEditorValues("recipes", raw);
  form.requirements[0]!.amount = "2.5";
  form.requirements[0]!.unitId = crypto.randomUUID();
  const values = RecipeInputSchema.parse(toWriteValues("recipes", form));
  expect(values.requirements[0]?.amount).toBe("2.5");
  expect(
    CatalogWriteSchema.safeParse({ resource: "recipes", id: null, expectedUpdatedAt: null, values })
      .success,
  ).toBe(true);
  const ingredient = toEditorValues("ingredients", {
    name: "西红柿",
    aliases: ["番茄"],
    categoryId: null,
    description: "",
  });
  ingredient.aliasesText = "番茄\n番茄";
  expect(
    CatalogWriteSchema.safeParse({
      resource: "ingredients",
      id: null,
      expectedUpdatedAt: null,
      values: toWriteValues("ingredients", ingredient),
    }).success,
  ).toBe(false);
});

it("should preserve exact decimal strings through the write adapter", () => {
  const form = toEditorValues("recipes", raw);
  form.requirements[0]!.amount = "999999999.000001";
  expect(toWriteValues("recipes", form)).toHaveProperty(
    "requirements.0.amount",
    "999999999.000001",
  );
});
it("should reject excess precision before it can be rounded", () => {
  const form = toEditorValues("recipes", raw);
  form.requirements[0]!.amount = "999999999.00000101";
  form.requirements[0]!.unitId = crypto.randomUUID();
  expect(RecipeInputSchema.safeParse(toWriteValues("recipes", form)).success).toBe(false);
});
