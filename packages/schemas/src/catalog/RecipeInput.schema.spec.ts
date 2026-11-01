import { describe, expect, it } from "vitest";
import { RecipeInputSchema } from "./RecipeInput.schema";
import { IngredientInputSchema } from "./IngredientInput.schema";

const recipe = {
  title: "番茄炒蛋",
  categoryId: null,
  description: "家常做法",
  servings: null,
  notes: "",
  requirements: [
    {
      label: "鸡蛋适量",
      kind: "unclassified",
      ingredientId: null,
      quantityText: "适量",
      amount: null,
      unitId: null,
      optional: false,
    },
  ],
  steps: ["打散鸡蛋"],
};
describe("editable recipe contracts", () => {
  it("accepts raw imported requirements without inventing ingredients or servings", () => {
    expect(RecipeInputSchema.safeParse(recipe).success).toBe(true);
  });
  it("rejects empty steps and blank titles", () => {
    expect(RecipeInputSchema.safeParse({ ...recipe, title: " " }).success).toBe(false);
    expect(RecipeInputSchema.safeParse({ ...recipe, steps: [] }).success).toBe(false);
  });
  it("rejects a numeric quantity without a unit", () => {
    expect(
      RecipeInputSchema.safeParse({
        ...recipe,
        requirements: [{ ...recipe.requirements[0], amount: "2" }],
      }).success,
    ).toBe(false);
  });
  it("rejects a tool linked to a food ingredient", () => {
    expect(
      RecipeInputSchema.safeParse({
        ...recipe,
        requirements: [
          { ...recipe.requirements[0], kind: "tool", ingredientId: crypto.randomUUID() },
        ],
      }).success,
    ).toBe(false);
  });
  it("accepts ingredient aliases but rejects duplicates", () => {
    expect(
      IngredientInputSchema.safeParse({
        name: "西红柿",
        description: "",
        categoryId: null,
        aliases: ["番茄"],
      }).success,
    ).toBe(true);
    expect(
      IngredientInputSchema.safeParse({
        name: "西红柿",
        description: "",
        categoryId: null,
        aliases: ["番茄", "番茄"],
      }).success,
    ).toBe(false);
  });
});

it("rejects quantities that PostgreSQL would silently round beyond six decimals", () => {
  const input = {
    title: "称量示例",
    categoryId: null,
    description: "",
    servings: null,
    notes: "",
    requirements: [
      {
        label: "盐",
        kind: "unclassified",
        ingredientId: null,
        quantityText: "",
        amount: "1.2345678",
        unitId: crypto.randomUUID(),
        optional: false,
      },
    ],
    steps: ["称量后加入"],
  };
  expect(RecipeInputSchema.safeParse(input).success).toBe(false);
  expect(
    RecipeInputSchema.safeParse({
      ...input,
      requirements: [{ ...input.requirements[0], amount: "1.234567" }],
    }).success,
  ).toBe(true);
});

it("should accept exact decimal strings without a floating point conversion", () => {
  const input = {
    title: "称量",
    categoryId: null,
    description: "",
    servings: null,
    notes: "",
    steps: ["称量"],
    requirements: [
      {
        label: "盐",
        kind: "unclassified",
        ingredientId: null,
        quantityText: "",
        amount: "999999999.000001",
        unitId: crypto.randomUUID(),
        optional: false,
      },
    ],
  };
  expect(RecipeInputSchema.safeParse(input).success).toBe(true);
  expect(
    RecipeInputSchema.safeParse({
      ...input,
      requirements: [{ ...input.requirements[0], amount: "999999999.00000101" }],
    }).success,
  ).toBe(false);
});
it("should enforce decimal boundaries without accepting numeric or exponential values", async () => {
  const { QuantityAmountSchema } = await import("./QuantityAmount.schema");
  for (const value of [
    "0",
    "-1",
    "1e3",
    "1,000",
    "1000000000.000001",
    "0.0000001",
    "999999999.00000101",
    2.5,
  ]) {
    expect(QuantityAmountSchema.safeParse(value).success).toBe(false);
  }
  expect(QuantityAmountSchema.parse("0.000001")).toBe("0.000001");
  expect(QuantityAmountSchema.parse("1000000000")).toBe("1000000000");
  expect(QuantityAmountSchema.parse("1.230000")).toBe("1.23");
});
