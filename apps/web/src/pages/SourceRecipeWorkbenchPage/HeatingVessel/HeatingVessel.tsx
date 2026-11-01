import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type HeatingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const HeatingVessel = ({ scene, className, ...props }: HeatingVesselProps) => (
  <div
    {...props}
    aria-label="热锅后加入食用油"
    className={cn(
      "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
      className
    )}
    data-testid="heating-vessel"
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
          className="h-9 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
        />
      ))}
    </div>
    <div
      aria-hidden="true"
      className="relative h-32 w-60 rounded-[50%] border-[9px] border-[#293f37] bg-[#40564b] shadow-[0_12px_0_#21342c]"
    >
      <span className="absolute -right-14 top-10 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]" />
      <span
        className="absolute inset-5 rounded-[50%] bg-[#d6b449]/70 motion-safe:animate-pan-oil"
        data-testid="heating-oil"
      />
      {scene.activeIngredients.some(({ kind }) => kind === "oil") && (
        <span className="absolute right-8 -top-8 h-16 w-1.5 origin-top rounded-full bg-[#edc85e]/80 motion-safe:animate-pan-pour motion-reduce:hidden" />
      )}
    </div>
  </div>
);
