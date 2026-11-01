import { recipeCatalog } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../../SimulatorPage/simulatorModel";
import { buildKitchenSceneModel } from "../kitchenSceneModel";
const recipe = recipeCatalog.find((item) => item.id === "lemon-water")!;
export const lemonSceneAt = (step: number) =>
  buildKitchenSceneModel(buildSimulatorSceneModel(recipe), recipe.title, recipe.category, step);
