import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type PeelingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const PeelingVessel = ({ scene, className, ...props }: PeelingVesselProps) => {
  const ingredient = scene.activeIngredients.find(
    ({ kind }) => !["liquid", "oil", "sauce", "seasoning", "sugar"].includes(kind)
  );
  const scald = scene.actions?.includes("blanch") || /开水|烫/u.test(scene.instruction ?? "");

  return (
    <div
      {...props}
      aria-label={scald ? "烫皮、冷却后剥去表皮" : "剥去食材表皮"}
      className={cn(
        "relative h-64 overflow-hidden [--peel-lift:-100px] sm:h-72 sm:[--peel-lift:-132px]",
        className
      )}
      data-testid="peeling-vessel"
      role="img"
    >
      {scald && (
        <div
          aria-hidden="true"
          className="absolute inset-x-0 top-12 flex justify-center gap-12 motion-safe:animate-peel-bowls"
        >
          <div className="relative h-14 w-24 rounded-[50%] border-[7px] border-[#ddd4c0] bg-[#c9e3de]">
            <span className="absolute -top-7 left-7 h-10 w-5 rounded-full border-l-2 border-leaf/30 motion-safe:animate-cooking-steam" />
            <span className="absolute -bottom-7 inset-x-0 text-center text-xs text-muted">
              热水
            </span>
          </div>
          <div className="relative h-14 w-24 rounded-[50%] border-[7px] border-[#d1e1de] bg-sky-100">
            <span className="absolute -bottom-7 inset-x-0 text-center text-xs text-muted">
              冷水
            </span>
          </div>
        </div>
      )}
      <div
        aria-hidden="true"
        className="absolute bottom-8 left-1/2 h-20 w-48 -translate-x-1/2 rounded-[50%] border-8 border-white bg-[#f4e8cc] shadow-[0_8px_0_#d8ceb6]"
      />
      {ingredient && (
        <>
          <div
            className={cn(
              "absolute bottom-14 left-1/2 -translate-x-1/2 motion-reduce:hidden",
              scald ? "motion-safe:animate-peel-transfer" : "motion-safe:animate-cut-whole"
            )}
          >
            <IngredientIllustration
              compact
              ingredient={{ ...ingredient, form: undefined, state: "raw" }}
            />
          </div>
          <div className="absolute bottom-14 left-1/2 -translate-x-1/2 motion-safe:animate-peel-reveal">
            <IngredientIllustration compact ingredient={{ ...ingredient, form: "peeled" }} />
          </div>
          <span
            aria-hidden="true"
            className={cn(
              "absolute bottom-12 left-[calc(50%+25px)] h-12 w-6 origin-top rounded-[50%] border-l-[7px] motion-safe:animate-peel-strip motion-reduce:hidden",
              ingredient.kind === "corn"
                ? "border-[#84a35c]"
                : ingredient.kind === "tomato"
                  ? "border-tomato"
                  : "border-[#bf9e6c]"
            )}
          />
        </>
      )}
    </div>
  );
};
