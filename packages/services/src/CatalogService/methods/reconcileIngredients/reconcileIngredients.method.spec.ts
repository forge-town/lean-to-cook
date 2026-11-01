import { expect, it, vi } from "vitest";
vi.mock("@repo/models", () => ({
  CatalogPersistenceError: class extends Error {},
  CatalogRepository: { findUnclassifiedRequirements: vi.fn(), linkIngredients: vi.fn() },
  catalogDao: { listIngredients: vi.fn() },
}));
import { CatalogRepository, catalogDao } from "@repo/models";
import { reconcileIngredientsMethod } from "./reconcileIngredients.method";
it("keeps preview read-only and reports actual writes when applying", async () => {
  vi.mocked(catalogDao.listIngredients).mockResolvedValue([
    {
      id: "milk",
      name: "牛奶",
      sourceName: "牛奶",
      aliases: [],
      createdAt: new Date(),
      updatedAt: new Date(),
      categoryId: null,
      description: "",
      imageKey: null,
    },
  ] as Awaited<ReturnType<typeof catalogDao.listIngredients>>);
  vi.mocked(CatalogRepository.findUnclassifiedRequirements).mockResolvedValue([
    {
      id: "row",
      recipeId: "recipe",
      label: "牛奶",
      updatedAt: new Date(),
      recipeUpdatedAt: new Date(),
    },
  ]);
  const preview = await reconcileIngredientsMethod({ apply: false });
  expect(preview._unsafeUnwrap()).toMatchObject({ matched: 1, linked: 0, applied: false });
  expect(CatalogRepository.linkIngredients).not.toHaveBeenCalled();
  vi.mocked(CatalogRepository.linkIngredients).mockResolvedValue({ linked: 0, recipes: 0 });
  const applied = await reconcileIngredientsMethod({ apply: true });
  expect(applied._unsafeUnwrap()).toMatchObject({ matched: 1, linked: 0, applied: true });
});
