import { z } from "zod/v4";

/** UnitInput 的跨边界数据契约。 */
export const UnitInputSchema = z.strictObject({
  /** 稳定单位代码，例如 g。 */ code: z
    .string()
    .trim()
    .min(1)
    .max(30)
    .regex(/^[a-zA-Z][a-zA-Z0-9_-]*$/, "使用英文字母、数字、下划线或短横线"),
  /** 展示名称，例如 克。 */ name: z.string().trim().min(1).max(100),
  /** 度量维度；不隐含换算关系。 */ dimension: z.enum(["mass", "volume", "count", "other"]),
});
export type UnitInput = z.infer<typeof UnitInputSchema>;
