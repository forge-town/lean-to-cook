import { ResultAsync } from "neverthrow";
import { catalogDao } from "@repo/models";
import {
  PublicIngredientSchema,
  matchIngredientImage,
  type PublicIngredient,
} from "@repo/schemas/catalog";
import { mapCatalogError, type CatalogServiceError } from "../../Catalog.service.error";
export const listIngredientsMethod = (): ResultAsync<PublicIngredient[], CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const rows = await catalogDao.listIngredients();

      return rows.map((row) =>
        PublicIngredientSchema.parse({
          id: row.id,
          name: row.name,
          sourceName: row.sourceName ?? row.name,
          categoryId: row.categoryId,
          description: row.description,
          aliases: row.aliases,
          imageKey: row.imageKey,
          updatedAt: row.updatedAt.toISOString(),
        }),
      );
    })(),
    mapCatalogError,
  );
export const assignIngredientImagesMethod = (): ResultAsync<
  { updated: number },
  CatalogServiceError
> =>
  ResultAsync.fromPromise(
    (async () => {
      const rows = await catalogDao.listIngredients();

      return catalogDao.assignIngredientImages(
        rows
          .filter((row) => row.imageKey === null)
          .map((row) => ({
            id: row.id,
            imageKey: matchIngredientImage(row.name),
          })),
      );
    })(),
    mapCatalogError,
  );
