import { z } from "zod/v4";
import { CatalogDeleteSchema } from "./CatalogDelete.schema";
/** 对当前读到的菜谱版本发布或撤下。 */
export const RecipePublicationInputSchema = CatalogDeleteSchema.extend({
  /** 仅菜谱可发布。 */ resource: z.literal("recipes"),
});
export type RecipePublicationInput = z.infer<typeof RecipePublicationInputSchema>;
