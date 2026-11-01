import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import type { CatalogList, CatalogListInput, CatalogRow } from "@repo/schemas/catalog";
import { mapCatalogError, type CatalogServiceError } from "../../Catalog.service.error";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
export const listPublicMethod = (
  input: CatalogListInput,
): ResultAsync<CatalogList, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const candidates = await CatalogRepository.findPublicationCandidates(input);
      const rows = await Promise.all(
        candidates.map(async ({ id }): Promise<CatalogRow | null> => {
          const raw = await CatalogRepository.get({ resource: "recipes", id });
          if (!raw || raw.resource !== "recipes") return null;
          const { detail } = describeRecord(raw);
          if (detail.publication !== "published") return null;

          return {
            id,
            name: raw.record.title,
            detail: raw.record.category?.name ?? "未分类",
            publication: "published",
            updatedAt: detail.updatedAt,
            usageCount: 0,
          };
        }),
      );
      const visible = rows.filter((row) => row !== null);

      return {
        data: visible.slice((input.page - 1) * input.pageSize, input.page * input.pageSize),
        total: visible.length,
      };
    })(),
    mapCatalogError,
  );
