import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type WaterBathVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const WaterBathVessel = ({ scene, className, ...props }: WaterBathVesselProps) => {
  const cooling = /冷水与冰水/u.test(scene.instruction ?? "");
  const preparing = /建立/u.test(scene.instruction ?? "");

  return (
    <div
      {...props}
      aria-label={cooling ? "鸡蛋依次在冷水和冰水中冷却" : "鸡蛋在沸水与温水两锅间交替水浴"}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="water-baths"
      role="img"
    >
      <div className="relative flex w-72 justify-between">
        {[0, 1].map((i) => (
          <div
            key={i}
            className="relative h-24 w-32 rounded-b-3xl rounded-t-[25%] border-x-[6px] border-b-[9px] border-[#668c85] bg-[#a5c1bd]"
          >
            <span className="absolute -top-2 inset-x-0 h-12 rounded-[50%] border-4 border-[#668c85] bg-[#c9e7e4]" />
            <span className="absolute -bottom-8 inset-x-0 text-center text-xs text-ink/60">
              {cooling ? (i === 0 ? "冷水 · 30 秒" : "冰水 · 30 秒") : i === 0 ? "100°C" : "30°C"}
            </span>
            {cooling && i === 1 && (
              <span className="absolute inset-x-4 top-1 flex gap-2" data-testid="ice-bath">
                <i className="size-5 rotate-12 rounded border-2 border-white/80 bg-white/40" />
                <i className="size-5 -rotate-12 rounded border-2 border-white/80 bg-white/40" />
              </span>
            )}
            {!cooling && i === 0 && (
              <span
                className="absolute -bottom-3 left-12 h-7 w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame"
                data-testid="cooking-heat"
              />
            )}
          </div>
        ))}
        {!preparing && (
          <span
            className={cn(
              "absolute left-12 top-0 z-10 h-9 w-7 rounded-[50%] bg-[#eed7ae] shadow-[inset_-3px_-3px_0_#d6ba8b]",
              cooling
                ? "translate-x-40 motion-safe:animate-kitchen-pop"
                : "motion-safe:animate-egg-bath-transfer"
            )}
            data-testid="bath-egg"
            data-transfers={cooling ? undefined : 16}
          />
        )}
      </div>
    </div>
  );
};
