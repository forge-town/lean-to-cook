import { getRecipeById } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../SimulatorPage/simulatorModel";
import { buildKitchenSceneModel } from "./kitchenSceneModel";
export const actionSceneAt = (id: string, step: number) => {
  const recipe = getRecipeById(id)!;

  return buildKitchenSceneModel(
    buildSimulatorSceneModel(recipe),
    recipe.title,
    recipe.category,
    step
  );
};

export const potatoPeelingScene = buildKitchenSceneModel(
  {
    amounts: [],
    ingredients: ["土豆"],
    introduction: [],
    tips: [],
    steps: [
      {
        id: "peel-potato",
        sequence: 1,
        phase: "去皮",
        instruction: "用削皮刀削去土豆外皮。",
        actions: ["peel"],
        ingredientNames: ["土豆"],
      },
    ],
  },
  "土豆备料",
  "vegetable",
  1
);
