import potatoMarkdown from "../../../../../content/how-to-cook/dishes/vegetable_dish/拔丝土豆/拔丝土豆.md?raw";
import { buildSourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";
import { buildKitchenSceneModel } from "./kitchenSceneModel";
export const potatoSceneModel = buildSourceRecipeWorkbenchModel(potatoMarkdown);
export const potatoSceneAt = (step: number) =>
  buildKitchenSceneModel(potatoSceneModel, "拔丝土豆", "vegetable", step);
