import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type SteamingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const SteamingVessel = ({ scene, className, ...props }: SteamingVesselProps) => {
  const racking = scene.method === "rack";
  const preheating = scene.method === "steamerHeat";
  const fish = scene.activeIngredients.some(({ kind }) => kind === "fish");

  return (
    <div
      {...props}
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="steaming-vessel"
      role="img"
    >
      {!racking && (
        <>
          <div className="absolute bottom-7 flex gap-2" data-testid="cooking-heat">
            {[0, 1, 2].map((i) => (
              <span
                key={i}
                className="h-8 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
              />
            ))}
          </div>
          <div className="absolute bottom-12 h-24 w-60 rounded-b-3xl border-[7px] border-[#355348] bg-[#6d897a]">
            <span
              className="absolute inset-x-2 top-1 h-8 rounded-[50%] bg-sky-100/70"
              data-testid="steamer-water"
            />
          </div>
          <div
            aria-hidden="true"
            className="absolute top-9 flex gap-10"
            data-testid="cooking-steam"
          >
            {[0, 1, 2].map((i) => (
              <span
                key={i}
                className="h-20 w-4 rounded-full border-l-2 border-leaf/30 motion-safe:animate-cooking-steam"
              />
            ))}
          </div>
        </>
      )}
      {!preheating && (
        <div
          className={cn(
            "relative z-10 flex h-24 w-64 items-center justify-center rounded-[50%] border-[8px] border-white bg-[#f4ecd6] shadow-[0_9px_0_#d9ccb0]",
            !racking && "-translate-y-6"
          )}
        >
          <span
            className="absolute inset-x-4 top-9 h-2 -rotate-6 rounded-full bg-[#ad824b] shadow-[0_18px_0_#ad824b]"
            data-testid="steamer-rack"
          />
          <div className="relative flex gap-1" data-testid="steamer-food">
            {fish ? (
              <span
                aria-label="整条鲈鱼"
                className="relative h-10 w-32 rounded-[50%] bg-[#c3cbbb] shadow-[inset_0_-5px_0_#a5b09b]"
              >
                <span className="absolute -left-4 top-2 h-7 w-7 rotate-45 rounded-sm bg-[#b3bda7]" />
                <span className="absolute right-3 top-3 size-1.5 rounded-full bg-ink" />
                <span className="absolute left-6 top-3 h-1 w-14 -rotate-12 bg-leaf/50 shadow-[0_8px_0_#63865380]" />
              </span>
            ) : (
              scene.activeIngredients
                .filter(
                  ({ kind }) => !["liquid", "oil", "sauce", "seasoning", "sugar"].includes(kind)
                )
                .slice(0, 3)
                .map((ingredient) => (
                  <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
                ))
            )}
          </div>
        </div>
      )}
    </div>
  );
};
