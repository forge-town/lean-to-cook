import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type ChillingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const ChillingVessel = ({ scene, className, ...props }: ChillingVesselProps) => (
  <div
    {...props}
    aria-label="混合液在容器中冷藏凝固"
    className={cn("flex h-64 items-center justify-center overflow-hidden sm:h-72", className)}
    data-testid="chilling-vessel"
    role="img"
  >
    <div className="relative flex h-44 w-72 items-center justify-center rounded-3xl border-[9px] border-[#9dbbb9] bg-[#d6e9e6] shadow-[0_9px_0_#7d9d9b]">
      <span aria-hidden="true" className="absolute right-3 top-2 text-2xl text-[#719ca4]">
        ❄
      </span>
      <div
        className="relative mt-4 h-20 w-44 overflow-hidden rounded-[30%] border-[7px] border-white/80 bg-[#ede3d1] shadow-[0_7px_0_#b6b9a4]"
        data-testid="chilling-mold"
      >
        <span
          className={cn(
            "absolute inset-1 rounded-[25%] motion-safe:animate-jelly-set",
            /咖啡|巧克力/u.test(scene.recipeTitle) ? "bg-[#c1a184]" : "bg-[#f4eacb]"
          )}
        />
        <span
          aria-hidden="true"
          className="absolute inset-x-5 top-4 h-5 rounded-[50%] border-t-2 border-white/50 motion-safe:animate-jelly-ripple motion-reduce:hidden"
        />
      </div>
    </div>
  </div>
);
