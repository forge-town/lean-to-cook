import { z } from "zod/v4";
import { RecipeInputSchema } from "./RecipeInput.schema";
import { IngredientInputSchema } from "./IngredientInput.schema";
import { UnitInputSchema } from "./UnitInput.schema";
import { CategoryInputSchema } from "./CategoryInput.schema";
/** CatalogWrite 的跨边界数据契约。 */
export const CatalogWriteSchema = z
  .discriminatedUnion("resource", [
    z.strictObject({
      /** 管理的资源。 */ resource: z.literal("recipes"),
      /** 新建时为空；已有记录使用 UUID。 */ id: z.uuid().nullable(),
      /** 更新时必须携带读到的时间，用于避免覆盖。 */ expectedUpdatedAt: z.iso
        .datetime()
        .nullable(),
      /** 对应领域的完整字段副本。 */ values: RecipeInputSchema,
    }),
    z.strictObject({
      /** 管理的资源。 */ resource: z.literal("ingredients"),
      /** 新建时为空；已有记录使用 UUID。 */ id: z.uuid().nullable(),
      /** 更新时必须携带读到的时间，用于避免覆盖。 */ expectedUpdatedAt: z.iso
        .datetime()
        .nullable(),
      /** 对应领域的完整字段副本。 */ values: IngredientInputSchema,
    }),
    z.strictObject({
      /** 管理的资源。 */ resource: z.literal("units"),
      /** 新建时为空；已有记录使用 UUID。 */ id: z.uuid().nullable(),
      /** 更新时必须携带读到的时间，用于避免覆盖。 */ expectedUpdatedAt: z.iso
        .datetime()
        .nullable(),
      /** 对应领域的完整字段副本。 */ values: UnitInputSchema,
    }),
    z.strictObject({
      /** 管理的资源。 */ resource: z.literal("ingredient-categories"),
      /** 新建时为空；已有记录使用 UUID。 */ id: z.uuid().nullable(),
      /** 更新时必须携带读到的时间，用于避免覆盖。 */ expectedUpdatedAt: z.iso
        .datetime()
        .nullable(),
      /** 对应领域的完整字段副本。 */ values: CategoryInputSchema,
    }),
    z.strictObject({
      /** 管理的资源。 */ resource: z.literal("recipe-categories"),
      /** 新建时为空；已有记录使用 UUID。 */ id: z.uuid().nullable(),
      /** 更新时必须携带读到的时间，用于避免覆盖。 */ expectedUpdatedAt: z.iso
        .datetime()
        .nullable(),
      /** 对应领域的完整字段副本。 */ values: CategoryInputSchema,
    }),
  ])
  .superRefine((value, ctx) => {
    if ((value.id === null) !== (value.expectedUpdatedAt === null))
      ctx.addIssue({
        code: "custom",
        path: ["expectedUpdatedAt"],
        message: "请重新打开记录后再保存",
      });
  });
export type CatalogWrite = z.infer<typeof CatalogWriteSchema>;
