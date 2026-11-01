import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type GrillingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const GrillingVessel = ({ scene, className, ...props }: GrillingVesselProps) => {
  const torch = scene.method === "torch";

  return (
    <div
      {...props}
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="grilling-vessel"
      role="img"
    >
      <div className="relative flex h-24 w-60 items-center justify-center gap-2 rounded-[40%] border-[7px] border-[#8e9c8d] bg-[#b1bbaa] shadow-[0_10px_0_#687d6b]">
        {!torch && (
          <span className="absolute inset-2 rounded-[40%] bg-[repeating-linear-gradient(0deg,transparent_0_9px,#395045_10px_13px)]" />
        )}
        <div className="relative flex">
          {scene.activeIngredients
            .filter(({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning"].includes(kind))
            .slice(0, 3)
            .map((ingredient) => (
              <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
            ))}
        </div>
      </div>
      {torch ? (
        <div
          aria-hidden="true"
          className="absolute left-[calc(50%+40px)] top-10 h-10 w-24 -rotate-25 motion-safe:animate-torch-sweep"
          data-testid="cooking-torch"
        >
          <span className="absolute right-0 h-8 w-14 rounded bg-[#67867d]" />
          <span className="absolute left-5 top-2 h-4 w-9 rounded-l bg-[#a4b9b2]" />
          <span className="absolute -left-9 top-0 h-8 w-16 rounded-l-[70%] bg-linear-to-l from-sky-200 via-sky-300 to-transparent" />
        </div>
      ) : (
        <span
          className="absolute bottom-10 h-10 w-40 rounded-[50%] bg-linear-to-t from-tomato/60 to-egg/50 motion-safe:animate-cooking-flame"
          data-testid="cooking-heat"
        />
      )}
    </div>
  );
};
