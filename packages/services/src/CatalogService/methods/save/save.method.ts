import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import type { CatalogDetail, CatalogWrite } from "@repo/schemas/catalog";
import { mapCatalogError, type CatalogServiceError } from "../../Catalog.service.error";
import { getMethod } from "../get/get.method";
export const saveMethod = (input: CatalogWrite): ResultAsync<CatalogDetail, CatalogServiceError> =>
  ResultAsync.fromPromise(CatalogRepository.save(input), mapCatalogError).andThen(({ id }) =>
    getMethod({ resource: input.resource, id }),
  );
