import type { CatalogResource } from "@repo/schemas/catalog";
import { CatalogSearchSchema } from "./_schemas/CatalogSearch.schema";
export const resources = [
  { name: "recipes", label: "菜谱" },
  { name: "ingredients", label: "食材" },
  { name: "ingredient-categories", label: "食材分类" },
  { name: "recipe-categories", label: "菜谱分类" },
  { name: "units", label: "计量单位" },
] as const;
export const readLocation = (
  search: string,
  resource: CatalogResource = "recipes",
  id: string | null = null,
) => {
  const state = CatalogSearchSchema.parse(Object.fromEntries(new URLSearchParams(search)));

  return {
    resource,
    id,
    pageSize: state.pageSize,
    page: state.page,
    search: state.q,
    categoryId: state.categoryId,
    notice: state.notice,
  };
};
export type AdminLocation = ReturnType<typeof readLocation>;
export const publicationLabel = { draft: "草稿", published: "已发布", changed: "修改后未发布" };
export const dimensionLabel: Record<string, string> = {
  mass: "质量",
  volume: "体积",
  count: "计数",
  other: "其他",
};
