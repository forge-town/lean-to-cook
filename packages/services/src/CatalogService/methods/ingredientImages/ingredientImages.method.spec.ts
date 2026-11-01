import { expect, it, vi } from "vitest";
vi.mock("@repo/models", () => ({
  CatalogPersistenceError: class extends Error {},
  catalogDao: { listIngredients: vi.fn(), assignIngredientImages: vi.fn() },
}));
import { catalogDao } from "@repo/models";
import { assignIngredientImagesMethod, listIngredientsMethod } from "./ingredientImages.method";
it("only proposes images for unassigned ingredients and preserves manual choices", async () => {
  vi.mocked(catalogDao.listIngredients).mockResolvedValue([
    { id: "a", name: "土豆", imageKey: null },
    { id: "b", name: "可乐", imageKey: "teacup" },
  ] as Awaited<ReturnType<typeof catalogDao.listIngredients>>);
  vi.mocked(catalogDao.assignIngredientImages).mockResolvedValue({ updated: 1 });
  const result = await assignIngredientImagesMethod();
  expect(result._unsafeUnwrap()).toEqual({ updated: 1 });
  expect(catalogDao.assignIngredientImages).toHaveBeenCalledWith([{ id: "a", imageKey: "potato" }]);
});
it("does not expose malformed persisted image keys as public presentation data", async () => {
  vi.mocked(catalogDao.listIngredients).mockResolvedValue([
    {
      id: crypto.randomUUID(),
      name: "可乐",
      sourceName: "可乐",
      categoryId: null,
      description: "",
      aliases: [],
      createdAt: new Date(),
      updatedAt: new Date(),
      imageKey: "not-an-image",
    },
  ] as Awaited<ReturnType<typeof catalogDao.listIngredients>>);
  const result = await listIngredientsMethod();
  expect(result.isErr()).toBe(true);
});
