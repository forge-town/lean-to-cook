import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { SimmeringVessel } from "../SimmeringVessel";
import { MixingVessel } from "../MixingVessel";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type BoilMixVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const BoilMixVessel = ({ scene, className, ...props }: BoilMixVesselProps) => (
  <div
    {...props}
    aria-label="先煮面沥水，再拌入炸酱"
    className={cn("relative h-64 overflow-hidden sm:h-72", className)}
    data-testid="boil-mix-sequence"
    role="img"
  >
    <div className="absolute inset-0 motion-safe:animate-boil-phase motion-reduce:hidden">
      <SimmeringVessel
        scene={{
          ...scene,
          method: "boil",
          methodLabel: "煮面沥水",
          vesselLabel: "深汤锅",
          activeIngredients: scene.activeIngredients.filter(({ kind }) => kind === "noodle"),
        }}
      />
    </div>
    <div className="absolute inset-0 motion-safe:animate-mix-phase">
      <MixingVessel scene={{ ...scene, method: "coldMix", atmosphere: "cool" }} />
    </div>
  </div>
);
