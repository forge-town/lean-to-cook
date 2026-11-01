import { getLeanMethod } from "./methods/getLean/getLean.method";
import { checkLeanMethod } from "./methods/checkLean/checkLean.method";
import { reconcileIngredientsMethod } from "./methods/reconcileIngredients/reconcileIngredients.method";
import {
  assignIngredientImagesMethod,
  listIngredientsMethod,
} from "./methods/ingredientImages/ingredientImages.method";
import { listPublicMethod } from "./methods/listPublic/listPublic.method";
import { getMethod, getPublicMethod } from "./methods/get/get.method";
import { saveMethod } from "./methods/save/save.method";
import { listMethod } from "./methods/list/list.method";
import { removeMethod } from "./methods/remove/remove.method";
import { publishMethod, unpublishMethod } from "./methods/publish/publish.method";
export const CatalogService = {
  getLean: getLeanMethod,
  checkLean: checkLeanMethod,
  reconcileIngredients: reconcileIngredientsMethod,
  listIngredients: listIngredientsMethod,
  assignIngredientImages: assignIngredientImagesMethod,
  listPublic: listPublicMethod,
  get: getMethod,
  getPublic: getPublicMethod,
  save: saveMethod,
  list: listMethod,
  remove: removeMethod,
  publish: publishMethod,
  unpublish: unpublishMethod,
};
export type CatalogService = typeof CatalogService;
