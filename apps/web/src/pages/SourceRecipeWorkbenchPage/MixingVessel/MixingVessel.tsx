import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type MixingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const MixingVessel = ({ scene, className, ...props }: MixingVesselProps) => {
  const egg = scene.activeIngredients.some(({ kind }) => kind === "egg");
  const wet =
    egg || scene.activeIngredients.some(({ kind }) => ["sauce", "liquid", "oil"].includes(kind));
  const solids = scene.activeIngredients.filter(
    ({ kind }) => !["egg", "liquid", "oil", "sauce", "sugar", "seasoning"].includes(kind)
  );

  return (
    <div
      {...props}
      aria-label={egg ? "在碗中打散鸡蛋" : "在碗中混合食材"}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="mixing-vessel"
      role="img"
    >
      <div className="relative flex h-32 w-60 items-center justify-center rounded-[50%] border-[10px] border-white bg-[#eadfc7] shadow-[0_12px_0_#cfc4aa,0_22px_20px_#745b2518]">
        {wet && (
          <div
            className={cn(
              "absolute inset-1 overflow-hidden rounded-[50%] shadow-[inset_0_0_14px_#ae742630]",
              egg ? "bg-yellow-300" : "bg-[#ae7950]"
            )}
            data-testid={egg ? "beaten-egg" : "mixed-liquid"}
          >
            <span className="absolute inset-4 rounded-[50%] border-t-2 border-white/60 motion-safe:animate-mix-swirl" />
          </div>
        )}
        <div className="relative flex gap-1">
          {solids.slice(0, 3).map((ingredient) => (
            <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
          ))}
        </div>
        {egg && (
          <div
            aria-hidden="true"
            className="absolute -left-1 -top-5 flex gap-2 text-3xl text-[#d9b482] motion-safe:animate-egg-shell motion-reduce:hidden"
          >
            <span>◖</span>
            <span>◗</span>
          </div>
        )}
        <div
          aria-hidden="true"
          className="absolute -right-1 -top-10 z-30 h-32 w-2 origin-bottom rounded-full bg-[#a8b8b6] motion-safe:animate-mix-stir"
          data-testid="mixing-utensil"
        >
          <span
            className={cn(
              "absolute -bottom-1 -left-2 h-10 w-6 rounded-[50%] border-2 border-[#9eafad]",
              egg
                ? "bg-transparent shadow-[inset_3px_0_0_#b5c3c1,inset_-3px_0_0_#b5c3c1]"
                : "bg-[#b9c7c0]"
            )}
          />
        </div>
      </div>
    </div>
  );
};
