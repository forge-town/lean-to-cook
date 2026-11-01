import { z } from "zod/v4";
import { CatalogRowSchema } from "./CatalogRow.schema";
/** CatalogList 的跨边界数据契约。 */
export const CatalogListSchema = z.object({
  /** 当前页。 */ data: z.array(CatalogRowSchema),
  /** 匹配总条数。 */ total: z.int().nonnegative(),
});
export type CatalogList = z.infer<typeof CatalogListSchema>;
