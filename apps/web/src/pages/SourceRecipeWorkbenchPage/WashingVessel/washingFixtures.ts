import { getRecipeById } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../../SimulatorPage/simulatorModel";
import { buildKitchenSceneModel } from "../kitchenSceneModel";
export const washingSceneFor = (id = "three-fresh") => {
  const recipe = getRecipeById(id)!;

  return buildKitchenSceneModel(buildSimulatorSceneModel(recipe), recipe.title, recipe.category, 1);
};
