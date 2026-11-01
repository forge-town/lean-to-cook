import { z } from "zod/v4";
import { RecipeInputSchema } from "./RecipeInput.schema";
import { IngredientInputSchema } from "./IngredientInput.schema";
import { UnitInputSchema } from "./UnitInput.schema";
import { CategoryInputSchema } from "./CategoryInput.schema";
/** CatalogValues 的跨边界数据契约。 */
export const CatalogValuesSchema = z.union([
  RecipeInputSchema,
  IngredientInputSchema,
  UnitInputSchema,
  CategoryInputSchema,
]);
export type CatalogValues = z.infer<typeof CatalogValuesSchema>;
