import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type DeepFryingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const DeepFryingVessel = ({ scene, className, ...props }: DeepFryingVesselProps) => (
  <div
    {...props}
    aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
    className={cn(
      "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
      className
    )}
    data-testid="deep-frying-vessel"
    role="img"
  >
    <div
      aria-hidden="true"
      className="absolute bottom-7 left-1/2 flex -translate-x-1/2 gap-2"
      data-testid="cooking-heat"
    >
      {[0, 1, 2].map((index) => (
        <span
          key={index}
          className="h-10 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
        />
      ))}
    </div>
    <div className="relative flex h-36 w-60 items-center justify-center rounded-[45%] border-[9px] border-[#293f37] bg-[#d6a639] shadow-[0_12px_0_#21342c]">
      <span
        aria-hidden="true"
        className="absolute -right-14 top-12 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]"
      />
      <div className="relative z-10 flex gap-1 motion-safe:animate-fry-settle">
        {scene.activeIngredients
          .filter(({ kind }) => !["oil", "liquid", "sauce", "sugar", "seasoning"].includes(kind))
          .slice(0, 4)
          .map((ingredient) => (
            <div key={ingredient.name} className="motion-safe:animate-fry-bob">
              <IngredientIllustration compact ingredient={ingredient} />
            </div>
          ))}
      </div>
      <div
        aria-hidden="true"
        className="absolute inset-4 rounded-[50%] border-2 border-yellow-100/30"
        data-testid="frying-bubbles"
      >
        {["top-2 left-4", "top-5 right-4", "bottom-2 left-12", "bottom-4 right-12"].map(
          (position) => (
            <span
              key={position}
              className={cn(
                "absolute size-3 rounded-full border-2 border-yellow-100/70 motion-safe:animate-cooking-bubble",
                position
              )}
            />
          )
        )}
      </div>
    </div>
  </div>
);
