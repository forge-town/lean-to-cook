import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import type { CatalogDetail, CatalogIdentity } from "@repo/schemas/catalog";
import { CatalogServiceError, mapCatalogError } from "../../Catalog.service.error";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
export const getMethod = (
  input: CatalogIdentity,
): ResultAsync<CatalogDetail, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const raw = await CatalogRepository.get(input);
      if (!raw) throw new CatalogServiceError("NOT_FOUND", "这条记录不存在，可能已经被删除");

      return describeRecord(raw).detail;
    })(),
    mapCatalogError,
  );
export const getPublicMethod = (input: {
  id: string;
}): ResultAsync<CatalogDetail, CatalogServiceError> =>
  getMethod({ resource: "recipes", id: input.id }).andThen((detail) => {
    if (detail.publication !== "published")
      return ResultAsync.fromPromise(
        Promise.reject(new CatalogServiceError("NOT_FOUND", "这道菜谱尚未发布")),
        mapCatalogError,
      );

    return ResultAsync.fromSafePromise(Promise.resolve(detail));
  });
