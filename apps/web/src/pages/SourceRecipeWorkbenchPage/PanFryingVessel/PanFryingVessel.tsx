import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type PanFryingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const PanFryingVessel = ({ scene, className, ...props }: PanFryingVesselProps) => (
  <div
    {...props}
    aria-label="在平底锅中煎制并翻面"
    className={cn(
      "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
      className
    )}
    data-testid="pan-frying-vessel"
    role="img"
  >
    <div
      aria-hidden="true"
      className="absolute bottom-8 left-1/2 flex -translate-x-1/2 gap-2"
      data-testid="cooking-heat"
    >
      {[0, 1, 2].map((index) => (
        <span
          key={index}
          className="h-7 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
        />
      ))}
    </div>
    <div className="relative flex h-32 w-60 items-center justify-center gap-1 rounded-[50%] border-[9px] border-[#293f37] bg-[#40564b] shadow-[0_12px_0_#21342c]">
      <span
        aria-hidden="true"
        className="absolute -right-14 top-10 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]"
      />
      <span aria-hidden="true" className="absolute inset-4 rounded-[50%] bg-[#d1b65a]/30" />
      {scene.activeIngredients
        .filter(({ kind }) => !["oil", "liquid", "sauce", "seasoning", "sugar"].includes(kind))
        .slice(0, 4)
        .map((ingredient) => (
          <div key={ingredient.name} className="relative z-10 motion-safe:animate-pan-flip">
            <IngredientIllustration compact ingredient={ingredient} />
          </div>
        ))}
    </div>
  </div>
);
