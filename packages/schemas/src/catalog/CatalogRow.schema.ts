import { z } from "zod/v4";

/** CatalogRow 的跨边界数据契约。 */
export const CatalogRowSchema = z.object({
  /** 记录身份。 */ id: z.uuid(),
  /** 列表标题。 */ name: z.string(),
  /** 分类名、单位维度等辅助文字。 */ detail: z.string(),
  /** 当前修改时间。 */ updatedAt: z.iso.datetime(),
  /** 可引用次数，用于提示删除限制。 */ usageCount: z.int().nonnegative(),
  /** 菜谱发布状态，其余字典为 null。 */ publication: z
    .enum(["draft", "published", "changed"])
    .nullable(),
});
export type CatalogRow = z.infer<typeof CatalogRowSchema>;
