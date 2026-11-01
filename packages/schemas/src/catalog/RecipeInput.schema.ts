import { z } from "zod/v4";
import { RecipeRequirementInputSchema } from "./RecipeRequirementInput.schema";
/** RecipeInput 的跨边界数据契约。 */
export const RecipeInputSchema = z.strictObject({
  /** 菜谱标题。 */ title: z.string().trim().min(1, "请填写标题").max(200),
  /** 未分类时为空。 */ categoryId: z.uuid().nullable(),
  /** 简短介绍。 */ description: z.string().trim().max(2000),
  /** 原文没有说明时为空。 */ servings: z
    .int({ error: "份数需要填写整数" })
    .min(1, "份数至少为 1")
    .max(10_000, "份数不能超过 10000")
    .nullable(),
  /** 其他做法提示。 */ notes: z.string().trim().max(20_000),
  /** 保持顺序的原料、工具清单。 */ requirements: z
    .array(RecipeRequirementInputSchema)
    .min(1, "至少填写一项")
    .max(200, "最多填写 200 项"),
  /** 按数组顺序执行的步骤。 */ steps: z
    .array(z.string().trim().min(1, "步骤不能为空").max(20_000))
    .min(1, "至少填写一项")
    .max(200, "最多填写 200 项"),
});
export type RecipeInput = z.infer<typeof RecipeInputSchema>;
