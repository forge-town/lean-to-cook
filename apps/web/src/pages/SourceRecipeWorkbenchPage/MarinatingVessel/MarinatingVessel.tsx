import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type MarinatingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const MarinatingVessel = ({ scene, className, ...props }: MarinatingVesselProps) => (
  <div
    {...props}
    aria-label="在碗中裹匀调料并静置腌制"
    className={cn(
      "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
      className
    )}
    data-testid="marinating-vessel"
    role="img"
  >
    <div className="relative flex h-32 w-60 items-center justify-center rounded-[50%] border-[10px] border-white bg-[#e0c8a6] shadow-[0_12px_0_#d1c3a9]">
      <span
        aria-hidden="true"
        className="absolute inset-4 rounded-[50%] bg-[#9f693b]/40 motion-safe:animate-marinade-coat"
      />
      <div className="relative z-10 flex gap-2 motion-safe:animate-marinade-turn">
        {scene.activeIngredients
          .filter(({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning"].includes(kind))
          .slice(0, 4)
          .map((ingredient) => (
            <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
          ))}
      </div>
    </div>
  </div>
);
