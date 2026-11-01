import { z } from "zod/v4";
import { QuantityAmountSchema } from "./QuantityAmount.schema";

/** RecipeRequirementInput 的跨边界数据契约。 */
export const RecipeRequirementInputSchema = z
  .strictObject({
    /** 原清单文字，不丢失未归类内容。 */ label: z
      .string()
      .trim()
      .min(1, "请填写原料或工具")
      .max(2000, "条目文字过长，请缩短到 2000 字以内"),
    /** 食材必须关联规范食材；工具不关联。 */ kind: z.enum(["unclassified", "ingredient", "tool"]),
    /** 尚未确认时为空。 */ ingredientId: z.uuid().nullable(),
    /** 保留适量、范围和原始表达。 */ quantityText: z.string().trim().max(500),
    /** 明确数量；不从原文自动猜测。 */ amount: QuantityAmountSchema.nullable(),
    /** 明确数量对应的单位。 */ unitId: z.uuid().nullable(),
    /** 是否可省略。 */ optional: z.boolean(),
  })
  .superRefine((value, ctx) => {
    if ((value.amount === null) !== (value.unitId === null))
      ctx.addIssue({ code: "custom", path: ["amount"], message: "数量和单位需要一起填写" });
    if ((value.kind === "ingredient") !== (value.ingredientId !== null))
      ctx.addIssue({
        code: "custom",
        path: ["ingredientId"],
        message: "食材条目需要选择食材，其他条目请留空",
      });
  });
export type RecipeRequirementInput = z.infer<typeof RecipeRequirementInputSchema>;
