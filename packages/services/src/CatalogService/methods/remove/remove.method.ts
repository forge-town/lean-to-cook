import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import type { CatalogDelete } from "@repo/schemas/catalog";
import { mapCatalogError, type CatalogServiceError } from "../../Catalog.service.error";
export const removeMethod = (
  input: CatalogDelete,
): ResultAsync<{ id: string }, CatalogServiceError> =>
  ResultAsync.fromPromise(CatalogRepository.remove(input), mapCatalogError);
