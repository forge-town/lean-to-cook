import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type BlendingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const BlendingVessel = ({ scene, className, ...props }: BlendingVesselProps) => {
  const running = /启动|打成|打碎|打至|搅打|高速/u.test(scene.instruction ?? "");
  const green = scene.allIngredients.some(({ kind }) => kind === "leaf");

  return (
    <div
      {...props}
      aria-label={running ? "启动搅拌机，将食材打成均匀液体" : "将食材装入搅拌机杯"}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-running={running}
      data-testid="blending-vessel"
      role="img"
    >
      <div className="relative -mt-8 h-36 w-32 rounded-b-3xl border-4 border-[#b8d4d0] bg-[#ecf6ed]/40">
        <span className="absolute -right-7 top-4 h-20 w-6 rounded-r-2xl border-[5px] border-[#abc6bf]" />
        <span className="absolute -top-4 -inset-x-2 h-4 rounded-t-xl bg-[#506f5e]" />
        {running && (
          <span
            className={cn(
              "absolute inset-x-1 bottom-1 h-24 origin-bottom rounded-b-2xl motion-safe:animate-blender-liquid",
              green ? "bg-[#92b46b]" : "bg-[#d8be92]"
            )}
            data-testid="blender-liquid"
          />
        )}
        <div
          className={cn(
            "absolute inset-x-0 bottom-5 flex justify-center",
            running && "motion-safe:animate-blender-pieces"
          )}
        >
          {scene.activeIngredients
            .filter(
              ({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning", "tea"].includes(kind)
            )
            .slice(0, 2)
            .map((ingredient) => (
              <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
            ))}
        </div>
        <span
          aria-hidden="true"
          className={cn(
            "absolute bottom-2 left-8 h-1 w-14 bg-[#cbd8cf] before:absolute before:left-6 before:-top-5 before:h-11 before:w-1 before:bg-[#cbd8cf]",
            running && "motion-safe:animate-blender-blade"
          )}
          data-testid="blender-blade"
        />
        <span className="absolute -bottom-11 -inset-x-3 h-10 rounded-b-xl bg-[#547665] after:absolute after:left-16 after:top-3 after:size-3 after:rounded-full after:bg-egg" />
      </div>
    </div>
  );
};
