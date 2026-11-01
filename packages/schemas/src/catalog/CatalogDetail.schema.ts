import { z } from "zod/v4";
import { CatalogResourceSchema } from "./CatalogResource.schema";
import { CatalogValuesSchema } from "./CatalogValues.schema";
/** CatalogDetail 的跨边界数据契约。 */
export const CatalogDetailSchema = z.object({
  /** 记录身份。 */ id: z.uuid(),
  /** 资源类型。 */ resource: CatalogResourceSchema,
  /** 乐观锁时间。 */ updatedAt: z.iso.datetime(),
  /** 对应资源的数据。 */ values: CatalogValuesSchema,
  /** 菜谱来源信息，其余为空。 */ source: z
    .object({
      /** 上游地址。 */ url: z.httpUrl(),
      /** 锁定的上游 commit。 */ commit: z.string(),
      /** 源文相对路径。 */ path: z.string(),
      /** 许可证。 */ license: z.string(),
      /** 原始 Markdown，保持导入时文本。 */ markdown: z.string(),
    })
    .nullable(),
  /** 当前记录关联对象的显示名称；食材包含实际引用它的菜谱。 */ references: z.array(
    z.object({
      /** 对象类型。 */ kind: z.enum(["ingredient", "unit", "category", "recipe"]),
      /** 对象身份。 */ id: z.uuid(),
      /** 当前显示名称。 */ name: z.string(),
      /** 单位代码；其他为空。 */ code: z.string().nullable(),
    }),
  ),
  /** 当前发布状态。 */ publication: z.enum(["draft", "published", "changed"]).nullable(),
  /** Corresponding public route; null for an unpublished record without a source. */ publicPath: z
    .string()
    .regex(/^\/(?:source-recipe\/[a-f0-9]{12}|catalog\/recipes\/[a-f0-9-]{36})$/)
    .nullable()
    .optional(),
  /** 后台编辑不能冒用源码证书。 */ verification: z.literal("not_verified"),
});
export type CatalogDetail = z.infer<typeof CatalogDetailSchema>;
