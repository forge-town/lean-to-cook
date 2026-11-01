import { ResultAsync } from "neverthrow";
import { CatalogRepository } from "@repo/models";
import { CatalogListSchema, type CatalogList, type CatalogListInput } from "@repo/schemas/catalog";
import { CatalogServiceError, mapCatalogError } from "../../Catalog.service.error";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
export const listMethod = (
  input: CatalogListInput,
): ResultAsync<CatalogList, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const page = await CatalogRepository.readPage(input);
      if (page.dictionaryRows) {
        const dimensionLabels: Record<string, string> = {
          mass: "质量",
          volume: "体积",
          count: "计数",
          other: "其他",
        };
        const rows = page.dictionaryRows.map((row) => ({
          id: row.id,
          name: row.name,
          updatedAt: row.updatedAt.toISOString(),
          usageCount: row.usageCount,
          publication: null,
          detail:
            input.resource === "ingredients"
              ? [row.categoryName, row.aliases.join("、")].filter(Boolean).join(" · ")
              : input.resource === "units"
                ? `${row.code} · ${dimensionLabels[row.dimension ?? "other"]}`
                : "分类",
        }));

        return CatalogListSchema.parse({ data: rows, total: page.total });
      }
      const data = await Promise.all(
        page.data.map(async ({ id }) => {
          const raw = await CatalogRepository.get({ resource: input.resource, id });
          if (!raw) return null;
          const { detail } = describeRecord(raw);
          const name = "title" in detail.values ? detail.values.title : detail.values.name;
          const extra =
            raw.resource === "ingredients"
              ? [
                  raw.record.category?.name,
                  raw.record.ingredientAliases.map((a) => a.name).join("、"),
                ]
                  .filter(Boolean)
                  .join(" · ")
              : raw.resource === "recipes"
                ? (raw.record.category?.name ?? "未分类")
                : raw.resource === "units"
                  ? `${raw.record.code} · ${raw.record.dimension}`
                  : "分类";

          return {
            id,
            name,
            detail: extra,
            publication: detail.publication,
            updatedAt: detail.updatedAt,
            usageCount:
              input.resource === "recipes"
                ? 0
                : await CatalogRepository.usageCount({ resource: input.resource, id }),
          };
        }),
      );
      const parsed = CatalogListSchema.safeParse({
        data: data.filter((r) => r !== null),
        total: page.total,
      });
      if (!parsed.success)
        throw new CatalogServiceError("INTERNAL", "列表数据格式有误", parsed.error);

      return parsed.data;
    })(),
    mapCatalogError,
  );
