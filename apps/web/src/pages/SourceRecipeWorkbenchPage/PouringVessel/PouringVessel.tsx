import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { FinishedDish } from "../FinishedDish";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type PouringVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const PouringVessel = ({ scene, className, ...props }: PouringVesselProps) => (
  <div
    {...props}
    className={cn("relative h-64 overflow-hidden sm:h-72", className)}
    data-testid="pouring-vessel"
  >
    <FinishedDish scene={scene} />
    <div
      aria-hidden="true"
      className="absolute left-[calc(50%-60px)] top-9 h-11 w-14 rotate-[-25deg] rounded-b-2xl border-4 border-[#587565] bg-[#d4dcd0]"
    />
    <span
      aria-hidden="true"
      className={cn(
        "absolute left-[calc(50%-15px)] top-20 h-14 w-1.5 origin-top rounded-full motion-safe:animate-slurry-pour motion-reduce:hidden",
        /热油/u.test(scene.instruction ?? "") ? "bg-[#e2bb48]/80" : "bg-[#976232]/80"
      )}
      data-testid="pouring-stream"
    />
  </div>
);
