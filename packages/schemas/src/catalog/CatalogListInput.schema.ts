import { z } from "zod/v4";
import { CatalogResourceSchema } from "./CatalogResource.schema";
/** CatalogListInput 的跨边界数据契约。 */
export const CatalogListInputSchema = z.strictObject({
  /** 资源类型。 */ resource: CatalogResourceSchema,
  /** 页码从 1 开始。 */ page: z.int().min(1).default(1),
  /** 每页最多 100 条。 */ pageSize: z.int().min(1).max(100).default(25),
  /** 以名称、别名或标题进行字面搜索。 */ search: z.string().trim().max(200).default(""),
  /** 仅菜谱、食材使用分类过滤。 */ categoryId: z.uuid().optional(),
});
export type CatalogListInput = z.infer<typeof CatalogListInputSchema>;
