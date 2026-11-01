import { z } from "zod/v4";

/** CategoryInput 的跨边界数据契约。 */
export const CategoryInputSchema = z.strictObject({
  /** 分类名称，整个字典内唯一。 */ name: z.string().trim().min(1, "请填写名称").max(100),
});
export type CategoryInput = z.infer<typeof CategoryInputSchema>;
