import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type RestingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const RestingVessel = ({ scene, className, ...props }: RestingVesselProps) => (
  <div
    {...props}
    aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
    className={cn("flex h-64 items-center justify-center overflow-hidden sm:h-72", className)}
    data-testid="resting-vessel"
    role="img"
  >
    <div className="flex h-32 w-60 items-center justify-center gap-1 rounded-[50%] border-[10px] border-white bg-[#f2e9d2] shadow-[0_10px_0_#d5c9ae] motion-safe:animate-rest-food">
      {scene.activeIngredients
        .filter(({ kind }) => !["oil", "sauce", "seasoning", "sugar", "liquid"].includes(kind))
        .slice(0, 4)
        .map((ingredient) => (
          <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
        ))}
    </div>
  </div>
);
