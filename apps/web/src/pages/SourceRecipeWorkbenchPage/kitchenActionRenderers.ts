import type { ComponentType } from "react";
import { CookingVessel } from "./CookingVessel";
import { DrinkVessel } from "./DrinkVessel";
import { FinishedDish } from "./FinishedDish";
import { HotOilInfusion } from "./HotOilInfusion";
import { WashingVessel } from "./WashingVessel";
import { CuttingVessel } from "./CuttingVessel";
import { PeelingVessel } from "./PeelingVessel";
import { MixingVessel } from "./MixingVessel";
import { HeatingVessel } from "./HeatingVessel";
import { RestingVessel } from "./RestingVessel";
import { SimmeringVessel } from "./SimmeringVessel";
import { MarinatingVessel } from "./MarinatingVessel";
import { PanFryingVessel } from "./PanFryingVessel";
import { ReductionVessel } from "./ReductionVessel";
import { DeepFryingVessel } from "./DeepFryingVessel";
import { BlendingVessel } from "./BlendingVessel";
import { GrillingVessel } from "./GrillingVessel";
import { ChillingVessel } from "./ChillingVessel";
import { PastryFillingVessel } from "./PastryFillingVessel";
import { BoilMixVessel } from "./BoilMixVessel";
import { WaterBathVessel } from "./WaterBathVessel";
import { ApplianceVessel } from "./ApplianceVessel";
import { CrackingVessel } from "./CrackingVessel";
import { PouringVessel } from "./PouringVessel";
import { SteamingVessel } from "./SteamingVessel";
import { ThickeningVessel } from "./ThickeningVessel";
import type { CookingMethod, KitchenSceneModel } from "./kitchenSceneModel";

type ActionRenderer = ComponentType<{ scene: KitchenSceneModel }>;
const actionRenderers: Partial<Record<CookingMethod, ActionRenderer>> = {
  blend: BlendingVessel,
  crush: CuttingVessel,
  torch: GrillingVessel,
  grill: GrillingVessel,
  chill: ChillingVessel,
  warmMix: SimmeringVessel,
  fillPastry: PastryFillingVessel,
  boilMix: BoilMixVessel,
  soak: SimmeringVessel,
  waterBath: WaterBathVessel,
  airFry: ApplianceVessel,
  microwave: ApplianceVessel,
  bake: ApplianceVessel,
  crack: CrackingVessel,
  pour: PouringVessel,
  rack: SteamingVessel,
  steamerHeat: SteamingVessel,
  steam: SteamingVessel,
  wash: WashingVessel,
  cut: CuttingVessel,
  score: CuttingVessel,
  peel: PeelingVessel,
  heat: HeatingVessel,
  rest: RestingVessel,
  boil: SimmeringVessel,
  simmer: SimmeringVessel,
  braise: SimmeringVessel,
  marinate: MarinatingVessel,
  panFry: PanFryingVessel,
  reduce: ReductionVessel,
  deepFry: DeepFryingVessel,
  thicken: ThickeningVessel,
  mix: MixingVessel,
  coldMix: MixingVessel,
  plate: FinishedDish,
};
export const getKitchenActionRenderer = (scene: KitchenSceneModel): ActionRenderer => {
  if (scene.oilStage) return HotOilInfusion;
  if (
    scene.category === "drink" &&
    ["cupAdd", "muddle", "mix", "coldMix", "plate", "brew"].includes(scene.method)
  )
    return DrinkVessel;

  return actionRenderers[scene.method] ?? CookingVessel;
};
