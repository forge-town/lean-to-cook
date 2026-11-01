import { findRecipeOperation } from "./_operations/findRecipe/findRecipe.operation";
import { findIngredientOperation } from "./_operations/findIngredient/findIngredient.operation";
export const leanCertificateDao = {
  findRecipe: findRecipeOperation,
  findIngredient: findIngredientOperation,
};
export type LeanCertificateDao = typeof leanCertificateDao;
