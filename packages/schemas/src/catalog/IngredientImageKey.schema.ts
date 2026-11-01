import { z } from "zod/v4";
import { ingredientImageKeys } from "./ingredientImageKeys";
/** A bundled, allowlisted Fluent image identifier, never an arbitrary URL. */
export const IngredientImageKeySchema = z.enum(ingredientImageKeys);
export type IngredientImageKey = z.infer<typeof IngredientImageKeySchema>;
