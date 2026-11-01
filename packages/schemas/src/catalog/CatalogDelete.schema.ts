import { z } from "zod/v4";
import { CatalogIdentitySchema } from "./CatalogIdentity.schema";
/** CatalogDelete 的跨边界数据契约。 */
export const CatalogDeleteSchema = CatalogIdentitySchema.extend({
  /** 删除前读到的更新时间。 */ expectedUpdatedAt: z.iso.datetime(),
});
export type CatalogDelete = z.infer<typeof CatalogDeleteSchema>;
