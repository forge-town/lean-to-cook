import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type CuttingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const CuttingVessel = ({ scene, className, ...props }: CuttingVesselProps) => {
  const crushing = scene.method === "crush";
  const scoring = scene.method === "score";
  const ingredients = scene.activeIngredients
    .filter(({ kind }) => !["liquid", "oil", "sauce", "seasoning", "sugar"].includes(kind))
    .slice(0, 4);

  return (
    <div
      {...props}
      aria-label={crushing ? "用刀背拍碎食材" : scoring ? "在砧板上开背去线" : "在砧板上切配食材"}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="cutting-vessel"
      role="img"
    >
      <div className="relative flex h-36 w-64 items-center justify-center rounded-3xl border-[7px] border-[#b9874a] bg-[#e5bd7b] shadow-[0_9px_0_#a87942,0_20px_20px_#745b2520]">
        <div
          className={cn(
            "absolute flex gap-2",
            !scoring && "motion-safe:animate-cut-whole motion-reduce:hidden"
          )}
        >
          {ingredients.map((ingredient) => (
            <IngredientIllustration
              key={ingredient.name}
              compact
              ingredient={{ ...ingredient, form: undefined, state: "raw" }}
            />
          ))}
        </div>
        {scoring && (
          <span
            className="absolute top-1/2 z-20 h-px w-9 -rotate-12 bg-ink/70 motion-safe:animate-cut-pieces"
            data-testid="scoring-line"
          />
        )}
        {!scoring && (
          <div className="flex gap-2 motion-safe:animate-cut-pieces">
            {ingredients.map((ingredient) => (
              <IngredientIllustration
                key={ingredient.name}
                compact
                ingredient={{ ...ingredient, form: "pieces" }}
              />
            ))}
          </div>
        )}
        <div
          aria-hidden="true"
          className={cn(
            "absolute -top-4 left-[45%] z-30 h-6 w-24 origin-right motion-reduce:hidden",
            crushing ? "motion-safe:animate-crush-knife" : "motion-safe:animate-cut-knife"
          )}
          data-testid="cooking-knife"
        >
          <span className="absolute left-0 h-7 w-16 rounded-[3px_0_6px_16px] border-b-2 border-slate-400 bg-slate-200" />
          <span className="absolute right-0 top-0 h-4 w-9 rounded-r-lg bg-ink" />
        </div>
      </div>
    </div>
  );
};
