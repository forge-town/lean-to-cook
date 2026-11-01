import type { BaseRecord, DataProvider } from "@refinedev/core";
import { CatalogDetailSchema } from "@repo/schemas/catalog";
export const publishedRecipeFixture = CatalogDetailSchema.parse({
  id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
  resource: "recipes",
  updatedAt: "2026-10-31T00:00:00.000Z",
  values: {
    title: "菠萝咖啡特调",
    description: "菠萝汁与冷萃咖啡。",
    categoryId: null,
    servings: 1,
    notes: "冰块最后放。",
    requirements: [
      {
        label: "咖啡液",
        kind: "unclassified",
        ingredientId: null,
        amount: null,
        unitId: null,
        quantityText: "30 ml",
        optional: false,
      },
    ],
    steps: ["倒入菠萝汁。", "加入冷萃咖啡和冰块。"],
  },
  references: [],
  source: null,
  publication: "published",
  verification: "not_verified",
  publicPath: "/catalog/recipes/eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
});
const readonly = async () => {
  throw new Error("Read-only fixture");
};
export const publishedRecipeFixtureProvider: DataProvider = {
  getApiUrl: () => "/offline",
  getList: async () => ({ data: [], total: 0 }),
  getOne: async <T extends BaseRecord>() => ({ data: publishedRecipeFixture as BaseRecord as T }),
  create: readonly,
  update: readonly,
  deleteOne: readonly,
};
