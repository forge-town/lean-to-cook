import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type CookingVesselProps = { scene: KitchenSceneModel };
const motionOffsets = [
  "left-[22%] [animation-delay:-200ms]",
  "left-[36%] [animation-delay:-600ms]",
  "left-[50%] [animation-delay:-1000ms]",
  "left-[64%] [animation-delay:-1400ms]",
];
const foodOffsets = [
  "[animation-delay:0ms]",
  "[animation-delay:-180ms]",
  "[animation-delay:-360ms]",
  "[animation-delay:-540ms]",
  "[animation-delay:-720ms]",
  "[animation-delay:-900ms]",
];
export const CookingVessel = ({ scene }: CookingVesselProps) => {
  const prep = scene.method === "prep";
  const rest = scene.method === "rest";
  const appliance = ["bake", "grill", "microwave", "chill"].includes(scene.method);
  const cup = ["brew", "blend"].includes(scene.method);
  const gentle =
    /小火|微火|低火|蛋液|炒蛋/u.test(scene.instruction ?? "") || scene.heatOn === false;
  const hot = scene.heatOn !== false && ["hot", "warm"].includes(scene.atmosphere);
  const toss = !gentle && ["stirFry", "deepFry"].includes(scene.method);
  const liquid = ["deepFry", "boil", "simmer", "braise", "steam", "brew", "caramelize"].includes(
    scene.method
  );
  const stir = ["stirFry", "caramelize", "mix", "coldMix", "blend"].includes(scene.method);
  const solids = scene.activeIngredients.filter(
    ({ kind }) => !["liquid", "oil", "sauce", "seasoning", "sugar"].includes(kind)
  );

  const pieces = solids.flatMap((ingredient) =>
    Array.from({ length: prep || solids.length >= 3 ? 1 : 3 }, (_, part) => ({
      ingredient,
      key: `${ingredient.name}-${part}`,
    }))
  );

  return (
    <div
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className="relative isolate flex h-64 items-center justify-center overflow-hidden px-8 sm:h-72"
      data-method={scene.method}
      data-testid="cooking-vessel"
      role="img"
    >
      <div
        aria-hidden="true"
        className="absolute bottom-9 left-1/2 h-7 w-56 -translate-x-1/2 rounded-[50%] bg-ink/10 blur-sm"
      />
      {hot && !appliance && !cup && (
        <div
          aria-hidden="true"
          className="absolute bottom-7 left-1/2 flex -translate-x-1/2 gap-2"
          data-testid="cooking-heat"
        >
          {[0, 1, 2].map((index) => (
            <i
              key={index}
              className={cn(
                "w-6 rounded-[70%_30%_60%_40%] bg-linear-to-t from-tomato to-egg motion-safe:animate-cooking-flame",
                gentle ? "h-5" : "h-11",
                foodOffsets[index]
              )}
            />
          ))}
        </div>
      )}
      <div
        className={cn(
          "relative z-10 flex items-center justify-center",
          prep
            ? "h-36 w-64 rounded-[24px] border-[7px] border-[#b9874a] bg-[#e5bd7b] shadow-[0_9px_0_#a87942]"
            : appliance
              ? "h-44 w-64 rounded-3xl border-[10px] border-[#6f8278] bg-[#263b35] shadow-[0_9px_0_#4c5e54]"
              : cup
                ? "h-40 w-32 rounded-[20%_20%_35%_35%] border-8 border-[#d6c9b1] bg-[#faf4de] shadow-[0_9px_0_#b7aa94]"
                : rest
                  ? "h-36 w-60 rounded-[50%_50%_42%_42%] border-[10px] border-white bg-[#e9e1c9] shadow-[0_12px_0_#d4c9af]"
                  : "h-36 w-60 rounded-[50%_50%_42%_42%] border-[9px] border-[#293f37] bg-[#40564b] shadow-[0_12px_0_#21342c]"
        )}
      >
        {!prep && !rest && !appliance && (
          <span
            aria-hidden="true"
            className={cn(
              "absolute -right-14 top-12 h-5 w-16 rounded-r-full border-4 border-[#293f37] bg-[#5e6b59]",
              cup && "-right-8 top-5 h-16 w-8 rounded-r-3xl bg-transparent"
            )}
          />
        )}
        {prep && (
          <span
            aria-hidden="true"
            className="absolute -left-3 top-14 size-3 rounded-full bg-[#a87942]"
          />
        )}
        {appliance && (
          <span
            aria-hidden="true"
            className="absolute -right-1 bottom-2 top-2 w-2 rounded-full bg-[#a9b5a7]"
          />
        )}
        {liquid && (
          <div
            aria-hidden="true"
            className={cn(
              "absolute inset-2 overflow-hidden rounded-[50%]",
              scene.method === "caramelize"
                ? "bg-[#c77a21]"
                : scene.method === "deepFry"
                  ? "bg-[#d9ac3c]"
                  : scene.method === "brew"
                    ? "bg-[#9f7549]"
                    : "bg-[#89b5b0]"
            )}
            data-testid="cooking-liquid"
          >
            {Array.from({ length: 8 }, (_, index) => (
              <i
                key={index}
                className={cn(
                  "absolute bottom-3 size-3 rounded-full border-2 border-white/60 motion-safe:animate-cooking-bubble",
                  motionOffsets[index % 4],
                  index > 3 && "bottom-8 size-2 [animation-delay:-350ms]"
                )}
              />
            ))}
          </div>
        )}
        <div
          className={cn(
            "relative z-20 flex max-w-48 flex-wrap items-center justify-center",
            prep ? "gap-1" : "gap-0"
          )}
        >
          {pieces.slice(0, 6).map(({ ingredient, key }, index) => (
            <div
              key={key}
              className={cn(
                toss && "motion-safe:animate-cooking-toss",
                scene.method === "blend" && "motion-safe:animate-cooking-blend",
                foodOffsets[index]
              )}
              data-testid="cooking-food"
            >
              <IngredientIllustration compact ingredient={ingredient} />
            </div>
          ))}
        </div>
        {prep && scene.completion > 0 && (
          <div
            aria-hidden="true"
            className="absolute -top-5 right-7 z-30 h-6 w-24 origin-right motion-safe:animate-cooking-chop"
            data-testid="cooking-knife"
          >
            <span className="absolute left-0 h-7 w-16 rounded-[3px_0_6px_16px] border-b-2 border-slate-400 bg-slate-200" />
            <span className="absolute right-0 top-0 h-4 w-9 rounded-r-lg bg-ink" />
          </div>
        )}
        {stir && (
          <div
            aria-hidden="true"
            className="absolute -right-1 -top-8 z-30 h-32 w-3 origin-top rotate-[-25deg] rounded-full bg-[#ac7942] shadow-sm motion-safe:animate-cooking-stir"
            data-testid="cooking-spatula"
          >
            <span className="absolute -bottom-1 -left-2 h-9 w-7 rounded-b-xl bg-[#b48548]" />
          </div>
        )}
        {scene.method === "caramelize" && (
          <div
            aria-hidden="true"
            className="absolute -top-5 left-9 z-30 h-16 w-28 origin-bottom border-x-2 border-amber-400/90 motion-safe:animate-cooking-syrup"
            data-testid="cooking-syrup"
          />
        )}
        {scene.method === "grill" && (
          <div
            aria-hidden="true"
            className="absolute inset-x-2 bottom-3 h-12 bg-[repeating-linear-gradient(0deg,transparent_0_10px,#a5a68c_11px_13px)]"
          />
        )}
        {scene.method === "microwave" && (
          <div
            aria-hidden="true"
            className="absolute inset-3 rounded-2xl border-4 border-egg/50 motion-safe:animate-cooking-waves"
          />
        )}
        {scene.method === "steam" && (
          <div
            aria-hidden="true"
            className="absolute -top-5 -inset-x-3 h-9 rounded-t-[50%] border-4 border-[#9d7041] bg-[#c79858]/85 before:absolute before:-top-3 before:left-[45%] before:h-3 before:w-8 before:rounded-t-full before:bg-[#9d7041]"
          />
        )}
        {scene.method === "chill" && (
          <span aria-hidden="true" className="absolute right-3 top-2 text-2xl text-sky-200">
            ❄
          </span>
        )}
      </div>
      {hot && !["deepFry", "grill", "microwave", "bake"].includes(scene.method) && (
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-x-10 top-3 z-30 h-32"
          data-testid="cooking-steam"
        >
          {motionOffsets.map((offset) => (
            <i
              key={offset}
              className={cn(
                "absolute bottom-0 h-16 w-5 rounded-[50%] border-l-[3px] border-leaf/25 opacity-0 motion-safe:animate-cooking-steam",
                offset
              )}
            />
          ))}
        </div>
      )}
    </div>
  );
};
