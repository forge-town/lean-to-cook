import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type ThickeningVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const ThickeningVessel = ({ className, ...props }: ThickeningVesselProps) => {
  const { scene, ...attributes } = props;

  return (
    <div
      {...attributes}
      aria-label="将料汁倒入锅中并搅拌勾芡"
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-method={scene.method}
      data-testid="thickening-vessel"
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
            className="h-8 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
          />
        ))}
      </div>
      <div
        aria-hidden="true"
        className="relative h-32 w-60 rounded-[50%] border-[9px] border-[#293f37] bg-[#40564b] shadow-[0_12px_0_#21342c]"
      >
        <span className="absolute -right-14 top-10 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]" />
        <span
          className="absolute inset-3 rounded-[50%] bg-[#af7138] motion-safe:animate-thicken-sauce"
          data-testid="thickening-liquid"
        >
          <span className="absolute inset-5 rounded-[50%] border-t-2 border-white/45 motion-safe:animate-mix-swirl" />
        </span>
        <span className="absolute left-16 -top-8 h-20 w-1.5 origin-top rounded-full bg-[#f1dec0] motion-safe:animate-pan-pour motion-reduce:hidden" />
        <span className="absolute right-7 -top-10 h-32 w-3 origin-bottom rounded-full bg-[#ad8053] motion-safe:animate-mix-stir" />
      </div>
    </div>
  );
};
