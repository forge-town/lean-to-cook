import sourceRecipeCatalogData from "./sourceRecipeCatalogData.json";
import { sourceRecipeSchema } from "../domain/SourceRecipe.schema";

export const sourceRecipeCatalog = sourceRecipeSchema.array().parse(sourceRecipeCatalogData);
