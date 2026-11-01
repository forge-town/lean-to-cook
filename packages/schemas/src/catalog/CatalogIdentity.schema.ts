import { z } from "zod/v4";
import { CatalogResourceSchema } from "./CatalogResource.schema";
/** CatalogIdentity 的跨边界数据契约。 */
export const CatalogIdentitySchema = z.strictObject({
  /** 资源类型。 */ resource: CatalogResourceSchema,
  /** 记录身份。 */ id: z.uuid(),
});
export type CatalogIdentity = z.infer<typeof CatalogIdentitySchema>;
