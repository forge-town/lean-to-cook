import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type ReductionVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const ReductionVessel = ({ scene, className, ...props }: ReductionVesselProps) => {
  const gentle = /小火|微火|低火/u.test(scene.instruction ?? "");

  return (
    <div
      {...props}
      aria-label="翻动食材并将酱汁收浓"
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="reduction-vessel"
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
            className={cn(
              "w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame",
              gentle ? "h-5" : "h-10"
            )}
          />
        ))}
      </div>
      <div className="relative flex h-32 w-60 items-center justify-center gap-1 rounded-[50%] border-[9px] border-[#293f37] bg-[#40564b] shadow-[0_12px_0_#21342c]">
        <span
          aria-hidden="true"
          className="absolute -right-14 top-10 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]"
        />
        <span
          aria-hidden="true"
          className="absolute inset-2 origin-center rounded-[50%] bg-[#a5672c] motion-safe:animate-sauce-reduce"
          data-testid="reducing-sauce"
        />
        <div className="relative z-10 flex">
          {scene.activeIngredients
            .filter(({ kind }) => !["oil", "liquid", "sauce", "seasoning", "sugar"].includes(kind))
            .slice(0, 4)
            .map((ingredient) => (
              <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
            ))}
        </div>
        {scene.actions?.includes("mix") && (
          <span
            aria-hidden="true"
            className="absolute -right-1 -top-10 z-20 h-24 w-2 origin-bottom rounded-full bg-[#ab8356] motion-safe:animate-mix-stir"
            data-testid="reduction-stirrer"
          />
        )}
        <div aria-hidden="true" className="absolute -top-9 inset-x-5 flex justify-around">
          {[0, 1, 2].map((index) => (
            <span
              key={index}
              className="h-14 w-4 rounded-full border-l-2 border-leaf/30 motion-safe:animate-cooking-steam"
            />
          ))}
        </div>
      </div>
    </div>
  );
};
