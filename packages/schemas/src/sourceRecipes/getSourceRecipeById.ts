import type { SourceRecipe } from "../domain/SourceRecipe.schema";
import { sourceRecipeCatalog } from "./sourceRecipeCatalog";

export const getSourceRecipeById = (sourceRecipeId: string): SourceRecipe | undefined =>
  sourceRecipeCatalog.find(({ id }) => id === sourceRecipeId);
