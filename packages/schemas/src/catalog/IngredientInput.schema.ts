import { z } from "zod/v4";
import { IngredientImageKeySchema } from "./IngredientImageKey.schema";

/** IngredientInput 的跨边界数据契约。 */
export const IngredientInputSchema = z
  .strictObject({
    /** 规范名称。 */ name: z.string().trim().min(1, "请填写名称").max(100),
    /** 未分类时为空。 */ categoryId: z.uuid().nullable(),
    /** 食材说明；不包含推测的营养或密度。 */ description: z.string().trim().max(2000),
    /** Bundled image; null clears it, omitted preserves a saved choice. */ imageKey:
      IngredientImageKeySchema.nullable().optional(),
    /** 人工确认的其他名称。 */ aliases: z.array(z.string().trim().min(1).max(100)).max(30),
  })
  .superRefine((value, ctx) => {
    const names = [value.name, ...value.aliases].map((name) =>
      name.normalize("NFKC").toLocaleLowerCase(),
    );
    if (new Set(names).size !== names.length)
      ctx.addIssue({ code: "custom", path: ["aliases"], message: "名称和别名不能重复" });
  });
export type IngredientInput = z.infer<typeof IngredientInputSchema>;
