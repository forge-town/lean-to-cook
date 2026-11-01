import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";

export type HotOilInfusionProps = ComponentProps<"div"> & { scene: KitchenSceneModel };

const seedPositions = [
  "left-[22%] top-[35%]",
  "left-[40%] top-[25%]",
  "left-[62%] top-[42%]",
  "left-[32%] top-[62%]",
  "left-[70%] top-[67%]",
  "left-[52%] top-[60%]",
];

export const HotOilInfusion = ({ scene, className, ...props }: HotOilInfusionProps) => {
  const stage = scene.oilStage ?? "ready";
  const pouring = stage === "pour";
  const heating = stage === "heatAndCool";
  const finished = stage === "finish";
  const wet = pouring || finished;

  return (
    <div
      {...props}
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className={cn("relative isolate h-64 overflow-hidden sm:h-72", className)}
      data-stage={stage}
      data-testid="hot-oil-infusion"
      role="img"
    >
      <div
        aria-hidden="true"
        className="absolute bottom-7 left-1/2 h-6 w-64 -translate-x-1/2 rounded-[50%] bg-ink/10 blur-md"
      />
      {(heating || pouring) && (
        <div
          aria-hidden="true"
          className={cn(
            "absolute z-30 h-20 w-32",
            heating
              ? "left-[12%] top-9 motion-safe:animate-oil-pan-cool"
              : "left-[calc(50%-166px)] top-16 origin-right motion-safe:animate-oil-pan-tip motion-reduce:rotate-[18deg]"
          )}
          data-testid="oil-pan"
        >
          <div className="absolute inset-0 rounded-[50%] border-[7px] border-[#273d35] bg-[#e3ae37] shadow-[0_6px_0_#23372f]">
            <span className="absolute inset-2 rounded-[50%] bg-[#f7d96e]/70" />
            {heating && (
              <span className="absolute inset-3 rounded-[50%] bg-[radial-gradient(ellipse,#6c4927_2px,transparent_3px)] bg-size-[18px_12px] motion-safe:animate-oil-aromatics" />
            )}
          </div>
          <span className="absolute -left-12 top-6 h-4 w-14 rounded-l-full bg-[#273d35]" />
        </div>
      )}
      {heating && (
        <>
          <div
            aria-hidden="true"
            className="absolute left-[18%] top-[108px] flex gap-1 motion-safe:animate-oil-heat-off motion-reduce:hidden"
            data-testid="oil-heating-flame"
          >
            {[0, 1, 2].map((index) => (
              <span
                key={index}
                className="h-7 w-4 rounded-[60%_30%] bg-linear-to-t from-tomato to-egg"
              />
            ))}
          </div>
          <span
            className="absolute left-[10%] top-3 rounded-full bg-surface/90 px-3 py-1 text-xs font-semibold text-leaf motion-safe:animate-oil-cooling-label"
            data-testid="oil-cooling"
          >
            关火 · 降至 210°C
          </span>
        </>
      )}
      <div
        aria-hidden="true"
        className={cn(
          "absolute bottom-9 left-1/2 h-32 w-56 -translate-x-1/2 rounded-[50%] border-[10px] border-[#fffdf6] bg-[#efe0c2] shadow-[0_12px_0_#d7c9ae,0_18px_16px_#6b4f2018]",
          heating && "left-[67%] scale-75"
        )}
        data-testid="oil-bowl"
      >
        <div
          className={cn(
            "absolute inset-0 overflow-hidden rounded-[50%]",
            wet
              ? "bg-[#bd401b] shadow-[inset_0_0_18px_#e58418]"
              : "bg-[#aa4226] bg-[radial-gradient(ellipse,#df7141_1.5px,transparent_2px)] bg-size-[6px_5px]",
            stage === "ready" && "opacity-40",
            pouring && "motion-safe:animate-oil-bowl-fill"
          )}
          data-testid="oil-mixture"
        >
          {seedPositions.map((position) => (
            <span
              key={position}
              className={cn(
                "absolute h-1.5 w-1 rounded-[50%] bg-[#ffe7ac] shadow-[7px_3px_0_#f8e6ba,-5px_10px_0_#f8e6ba]",
                position
              )}
            />
          ))}
          {wet && (
            <span className="absolute inset-3 rounded-[50%] border-t-2 border-amber-300/60" />
          )}
          {pouring && (
            <div
              className="absolute inset-2 motion-safe:animate-oil-foam"
              data-testid="oil-bubbles"
            >
              {seedPositions.map((position) => (
                <span
                  key={position}
                  className={cn(
                    "absolute size-4 rounded-full border-2 border-[#ffda7b]/80 motion-safe:animate-cooking-bubble",
                    position
                  )}
                />
              ))}
            </div>
          )}
        </div>
        {(stage === "mix" || pouring || finished) && (
          <div
            className="absolute -right-2 -top-9 z-40 h-24 w-2 origin-bottom motion-reduce:rotate-[22deg] rounded-full bg-[#9a7045] motion-safe:animate-oil-stir"
            data-testid="oil-spoon"
          >
            <span className="absolute -bottom-1 -left-1.5 h-7 w-5 rounded-[50%] bg-[#b58c57]" />
          </div>
        )}
        {finished && (
          <span
            className="absolute -right-1 -top-3 flex size-8 items-center justify-center rounded-full bg-leaf text-white"
            data-testid="oil-finished"
          >
            ✓
          </span>
        )}
      </div>
      {pouring && (
        <>
          <div
            aria-hidden="true"
            className="absolute left-[calc(50%-50px)] top-[105px] z-20 h-24 w-2 origin-top rounded-full bg-linear-to-r from-[#e49b21] to-[#ffe4a1] shadow-[0_0_8px_#f1b63e66] motion-safe:animate-oil-pour motion-reduce:hidden"
            data-testid="oil-stream"
          />
          <div
            aria-hidden="true"
            className="pointer-events-none absolute bottom-32 left-[42%] flex gap-5 motion-safe:animate-oil-foam"
            data-testid="oil-steam"
          >
            {[0, 1, 2].map((index) => (
              <span
                key={index}
                className="h-16 w-4 rounded-[50%] border-l-2 border-leaf/25 motion-safe:animate-cooking-steam"
              />
            ))}
          </div>
        </>
      )}
      {finished && (
        <span
          aria-hidden="true"
          className="absolute right-[28%] top-[46%] h-9 w-8 bg-[radial-gradient(ellipse,#fff3da_1.5px,transparent_2px)] bg-size-[6px_7px] motion-safe:animate-oil-sugar"
          data-testid="oil-sugar"
        />
      )}
    </div>
  );
};
