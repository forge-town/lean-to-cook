import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type SimmeringVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const SimmeringVessel = ({ scene, className, ...props }: SimmeringVesselProps) => {
  const cold = scene.method === "soak";
  const warm = scene.method === "warmMix";
  const gentle = warm || ["simmer", "braise"].includes(scene.method);
  const brown = scene.activeIngredients.some(({ name }) =>
    /咖啡|可乐|酱油|生抽|老抽|豆瓣|黄酱/u.test(name)
  );
  const solids = scene.activeIngredients.filter(
    ({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning"].includes(kind)
  );

  return (
    <div
      {...props}
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className={cn(
        "relative flex h-64 items-center justify-center overflow-hidden sm:h-72",
        className
      )}
      data-testid="simmering-vessel"
      role="img"
    >
      {!cold && (
        <div
          aria-hidden="true"
          className="absolute bottom-6 left-1/2 flex -translate-x-1/2 gap-3"
          data-testid="cooking-heat"
        >
          {[0, 1, 2].map((index) => (
            <span
              key={index}
              className={cn(
                "w-5 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame",
                gentle ? "h-5" : "h-9"
              )}
            />
          ))}
        </div>
      )}
      <div className="relative mt-8 h-36 w-56 rounded-b-[38px] rounded-t-[25%] border-x-[9px] border-b-[12px] border-[#2c473c] bg-[#6d897a] shadow-[0_10px_0_#273e33]">
        <span
          aria-hidden="true"
          className="absolute -left-9 top-9 h-7 w-8 rounded-l-xl border-[7px] border-[#2c473c]"
        />
        <span
          aria-hidden="true"
          className="absolute -right-9 top-9 h-7 w-8 rounded-r-xl border-[7px] border-[#2c473c]"
        />
        <div
          className={cn(
            "absolute -top-2 inset-x-0 h-24 rounded-[50%] border-[6px] border-[#355348]",
            brown ? "bg-[#9a603b]" : "bg-[#c8dcca]"
          )}
          data-testid="cooking-liquid"
        >
          <div className="absolute inset-1 flex items-center justify-center">
            {solids.slice(0, 4).map((ingredient) => (
              <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
            ))}
          </div>
          {!cold && !warm && (
            <div aria-hidden="true" className="absolute inset-3" data-testid="pot-bubbles">
              {["left-2 top-5", "left-14 top-2", "right-4 top-8", "right-12 top-1"].map(
                (position) => (
                  <span
                    key={position}
                    className={cn(
                      "absolute size-3 rounded-full border-2 border-white/55 motion-safe:animate-cooking-bubble",
                      position,
                      gentle && "size-2 [animation-duration:2400ms]"
                    )}
                  />
                )
              )}
            </div>
          )}
        </div>
        {!cold &&
          (scene.actions?.includes("mix") || /搅动|搅拌/u.test(scene.instruction ?? "")) && (
            <span
              aria-hidden="true"
              className="absolute -right-1 -top-12 z-20 h-24 w-2 origin-bottom rounded-full bg-[#ab8356] motion-safe:animate-mix-stir"
              data-testid="pot-stirrer"
            />
          )}
        {!cold &&
          scene.actions?.includes("add") &&
          /补水|加入.*水/u.test(scene.instruction ?? "") && (
            <span
              aria-hidden="true"
              className="absolute left-10 -top-10 z-20 h-16 w-1.5 origin-top rounded-full bg-sky-200/80 motion-safe:animate-water-topup motion-reduce:hidden"
              data-testid="pot-water-pour"
            />
          )}
        {!cold && (
          <div
            aria-hidden="true"
            className="absolute -top-14 inset-x-5 flex justify-around"
            data-testid="cooking-steam"
          >
            {[0, 1, 2].map((index) => (
              <span
                key={index}
                className="h-16 w-5 rounded-[50%] border-l-2 border-leaf/25 motion-safe:animate-cooking-steam"
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
};
