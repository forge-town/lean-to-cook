import type { Recipe } from "../domain/Recipe.schema";
import { recipeCatalog } from "./recipeCatalog";

export const getRecipeById = (recipeId: string): Recipe | undefined =>
  recipeCatalog.find((recipe) => recipe.id === recipeId);
