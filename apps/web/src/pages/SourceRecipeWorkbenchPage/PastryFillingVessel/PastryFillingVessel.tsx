import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type PastryFillingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const PastryFillingVessel = ({ scene, className, ...props }: PastryFillingVesselProps) => (
  <div
    {...props}
    aria-label="将调好的挞液倒入挞皮"
    className={cn(
      "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
      className
    )}
    data-method={scene.method}
    data-testid="pastry-filling"
    role="img"
  >
    <span
      aria-hidden="true"
      className="absolute left-[calc(50%-65px)] top-8 h-12 w-20 -rotate-25 rounded-b-[50%] border-[5px] border-white bg-[#f6d46e] shadow-sm"
    />
    <span
      aria-hidden="true"
      className="absolute left-[calc(50%-10px)] top-16 h-16 w-2 origin-top rounded-full bg-[#f0cc66] motion-safe:animate-slurry-pour motion-reduce:hidden"
    />
    <div className="mt-14 grid grid-cols-2 gap-3 rounded-[35%] border-b-[6px] border-[#a9b4a4] bg-[#d3dacb] px-6 py-4">
      {[0, 1, 2, 3].map((i) => (
        <span
          key={i}
          className="relative h-9 w-12 overflow-hidden rounded-[50%] border-[5px] border-[#cfa669] bg-[#f4e1ba]"
        >
          <span className="absolute inset-0 origin-bottom rounded-[50%] bg-[#f4d472] motion-safe:animate-custard-fill" />
        </span>
      ))}
    </div>
  </div>
);
