import { getRecipeById } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../../SimulatorPage/simulatorModel";
import { buildKitchenSceneModel } from "../kitchenSceneModel";
const recipe = getRecipeById("chili-oil")!;
export const oilSceneAt = (step: number) =>
  buildKitchenSceneModel(buildSimulatorSceneModel(recipe), recipe.title, recipe.category, step);
