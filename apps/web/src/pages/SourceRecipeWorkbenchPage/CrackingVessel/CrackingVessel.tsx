import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { FinishedDish } from "../FinishedDish";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type CrackingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const CrackingVessel = ({ scene, className, ...props }: CrackingVesselProps) => (
  <div
    {...props}
    className={cn("relative h-64 overflow-hidden sm:h-72", className)}
    data-testid="egg-cracking"
  >
    <FinishedDish scene={scene} />
    <span
      aria-hidden="true"
      className="absolute left-[calc(50%-25px)] top-10 h-7 w-5 -rotate-25 rounded-l-full border-r-2 border-dashed border-white bg-[#dfbc84] motion-safe:animate-egg-shell-left motion-reduce:hidden"
    />
    <span
      aria-hidden="true"
      className="absolute left-[calc(50%+5px)] top-10 h-7 w-5 rotate-25 rounded-r-full border-l-2 border-dashed border-white bg-[#dfbc84] motion-safe:animate-egg-shell-right motion-reduce:hidden"
    />
  </div>
);
