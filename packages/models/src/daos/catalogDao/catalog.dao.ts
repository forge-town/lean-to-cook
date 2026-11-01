import { listIngredientsOperation } from "./_operations/listIngredients/listIngredients.operation";
import { assignIngredientImagesOperation } from "./_operations/assignIngredientImages/assignIngredientImages.operation";
import { saveDictionaryOperation } from "./_operations/saveDictionary/saveDictionary.operation";
export const catalogDao = {
  saveDictionary: saveDictionaryOperation,
  listIngredients: listIngredientsOperation,
  assignIngredientImages: assignIngredientImagesOperation,
};
export type CatalogDao = typeof catalogDao;
