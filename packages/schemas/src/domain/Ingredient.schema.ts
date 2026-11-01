import { z } from "zod";
import { quantitySchema } from "./Quantity.schema";

export const ingredientSchema = z
  .object({
    id: z.string().regex(/^[a-z][A-Za-z0-9]*$/),
    name: z.string().min(1),
    note: z.string().min(1).optional(),
    optional: z.boolean(),
    quantity: quantitySchema,
  })
  .strict();

export type Ingredient = z.infer<typeof ingredientSchema>;
