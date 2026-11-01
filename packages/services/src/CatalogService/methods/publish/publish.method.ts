import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import type { CatalogDetail, RecipePublicationInput } from "@repo/schemas/catalog";
import { CatalogServiceError, mapCatalogError } from "../../Catalog.service.error";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
import { getMethod } from "../get/get.method";
export const publishMethod = (
  input: RecipePublicationInput,
): ResultAsync<CatalogDetail, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const raw = await CatalogRepository.get(input);
      if (!raw) throw new CatalogServiceError("NOT_FOUND", "菜谱不存在");
      const { contentDigest } = describeRecord(raw);
      await CatalogRepository.publish({ ...input, contentDigest });

      return input.id;
    })(),
    mapCatalogError,
  ).andThen((id) => getMethod({ resource: "recipes", id }));
export const unpublishMethod = (
  input: RecipePublicationInput,
): ResultAsync<CatalogDetail, CatalogServiceError> =>
  ResultAsync.fromPromise(
    CatalogRepository.publish({ ...input, contentDigest: null }),
    mapCatalogError,
  ).andThen(({ id }) => getMethod({ resource: "recipes", id }));
