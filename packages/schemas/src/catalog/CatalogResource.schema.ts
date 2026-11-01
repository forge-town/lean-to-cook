import { z } from "zod/v4";

/** CatalogResource 的跨边界数据契约。 */
export const CatalogResourceSchema = z.enum([
  "recipes",
  "ingredients",
  "ingredient-categories",
  "recipe-categories",
  "units",
]);
export type CatalogResource = z.infer<typeof CatalogResourceSchema>;
