import { IngredientImageKeySchema } from "@repo/schemas/catalog";
import { z } from "zod/v4";
/** DOM-friendly sandbox; the shared API schema validates the submitted domain values. */
export const EditorValuesSchema = z.object({
  /** Selected bundled image, null when not assigned. */ imageKey:
    IngredientImageKeySchema.nullable(),
  /** Dictionary display name. */ name: z.string(),
  /** Recipe title. */ title: z.string(),
  /** Optional category choice. */ categoryId: z.string(),
  /** Description. */ description: z.string(),
  /** Portions, empty means unknown. */ servings: z.string(),
  /** Cooking notes. */ notes: z.string(),
  /** Unit identity. */ code: z.string(),
  /** Unit dimension. */ dimension: z.enum(["mass", "volume", "count", "other"]),
  /** One alias per line. */ aliasesText: z.string(),
  /** Ordered requirements; keys only identify editor rows. */ requirements: z.array(
    z.object({
      key: z.string(),
      label: z.string(),
      kind: z.enum(["unclassified", "ingredient", "tool"]),
      ingredientId: z.string(),
      quantityText: z.string(),
      amount: z.string(),
      unitId: z.string(),
      optional: z.enum(["required", "optional"]),
    }),
  ),
  /** Ordered instructions. */ steps: z.array(
    z.object({ key: z.string(), instruction: z.string() }),
  ),
});
export type EditorValues = z.infer<typeof EditorValuesSchema>;
