import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
import { IngredientIllustration } from "../IngredientIllustration";
export type DrinkVesselProps = { scene: KitchenSceneModel };
const slicePositions = [
  "bottom-4 left-4 [animation-delay:0ms]",
  "bottom-8 left-14 [animation-delay:150ms]",
  "bottom-3 right-4 [animation-delay:300ms]",
];
export const DrinkVessel = ({ scene }: DrinkVesselProps) => {
  const loading = scene.method === "cupAdd";
  const muddling = scene.method === "muddle";
  const mixing = ["mix", "coldMix"].includes(scene.method);
  const brewing = scene.method === "brew";
  const lemon = scene.allIngredients.find((ingredient) => /柠檬/u.test(ingredient.name));
  const solids = scene.allIngredients.filter(
    ({ kind }) => !["liquid", "oil", "sauce", "seasoning", "sugar"].includes(kind)
  );
  const milky = scene.allIngredients.some(
    ({ name, state }) => /奶|乳/u.test(name) && state !== "raw"
  );
  const tea = scene.allIngredients.some(({ kind }) => kind === "tea");

  return (
    <div
      aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
      className="relative flex h-64 items-center justify-center overflow-hidden pt-6 sm:h-72"
      data-fill={scene.cupFill}
      data-method={scene.method}
      data-testid="drink-vessel"
      role="img"
    >
      <div
        aria-hidden="true"
        className="absolute bottom-5 h-5 w-44 rounded-[50%] bg-ink/10 blur-sm"
      />
      <div className="relative h-44 w-36 rounded-b-[28px] sm:h-48 sm:w-40">
        <div className="absolute inset-x-1 bottom-1 top-1 overflow-hidden rounded-b-[26px] bg-sky-100/20">
          {scene.cupFill > 0 && (
            <div
              aria-hidden="true"
              className={cn(
                "absolute inset-x-0 bottom-0 origin-bottom overflow-hidden rounded-b-[25px] border-t border-sky-200/70 motion-safe:animate-drink-fill",
                scene.cupFill < 0.5
                  ? "h-[12%] bg-yellow-200/55"
                  : milky
                    ? "h-[72%] bg-[#e7cfa6]/80"
                    : tea
                      ? "h-[72%] bg-amber-600/65"
                      : "h-[72%] bg-sky-200/50"
              )}
              data-liquid={milky ? "milk" : tea ? "tea" : "water"}
              data-testid="drink-liquid"
            >
              <span className="absolute inset-x-0 top-0 h-3 rounded-[50%] bg-white/25" />
            </div>
          )}
        </div>
        {lemon ? (
          slicePositions.map((position) => (
            <span
              key={position}
              aria-label={`${lemon.name}片`}
              className={cn(
                "absolute z-20 size-10 rounded-full bg-yellow-400 p-1 shadow-sm",
                position,
                loading && "motion-safe:animate-drink-drop",
                muddling && "motion-safe:animate-drink-squash"
              )}
              data-testid="drink-slice"
            >
              <span className="block size-full rounded-full border-2 border-yellow-100 bg-[repeating-conic-gradient(#ffe58c_0deg_55deg,#fff7d6_55deg_60deg)]" />
              <span aria-hidden="true" className="absolute inset-4 rounded-full bg-yellow-100" />
            </span>
          ))
        ) : (
          <div className="absolute inset-x-2 bottom-4 z-20 flex flex-wrap justify-center">
            {solids.slice(0, 3).map((ingredient) => (
              <div
                key={ingredient.name}
                className={loading ? "motion-safe:animate-drink-drop" : undefined}
              >
                <IngredientIllustration compact ingredient={ingredient} />
              </div>
            ))}
          </div>
        )}
        {brewing && (
          <div
            aria-hidden="true"
            className="absolute -top-6 inset-x-6 z-30 flex justify-around"
            data-testid="drink-steam"
          >
            {[0, 1, 2].map((index) => (
              <span
                key={index}
                className="h-12 w-3 rounded-[50%] border-l-2 border-leaf/25 motion-safe:animate-cooking-steam"
              />
            ))}
          </div>
        )}
        {muddling && (
          <div
            aria-hidden="true"
            className="absolute -top-7 left-[43%] z-30 h-40 w-5 rounded-full bg-[#91653e] shadow-sm motion-safe:animate-drink-muddle"
            data-testid="drink-muddler"
          >
            <span className="absolute -bottom-1 -left-1 h-9 w-7 rounded-b-2xl bg-[#795234]" />
          </div>
        )}
        {mixing && (
          <div
            aria-hidden="true"
            className="absolute -top-7 left-[55%] z-30 h-40 w-2 origin-top rounded-full bg-slate-400 motion-safe:animate-cooking-stir"
            data-testid="drink-spoon"
          >
            <span className="absolute -bottom-1 -left-1 h-7 w-4 rounded-[50%] bg-slate-300" />
          </div>
        )}
        {mixing && scene.cupFill > 0.5 && (
          <div
            aria-hidden="true"
            className="absolute -top-6 right-5 z-10 h-24 w-1.5 origin-top rounded-full bg-sky-300/80 opacity-0 motion-safe:animate-drink-pour"
            data-testid="drink-pour"
          />
        )}
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-0 z-40 rounded-b-[28px] border-x-4 border-b-8 border-sky-100 bg-linear-to-r from-white/30 via-transparent to-white/10 shadow-[2px_5px_0_#cbded8]"
        >
          <span className="absolute left-2 top-4 h-24 w-1 rounded-full bg-white/65" />
        </div>
        <span
          aria-hidden="true"
          className="pointer-events-none absolute -inset-x-0.5 -top-1 z-40 h-3 rounded-[50%] border-[3px] border-sky-100 bg-white/15"
        />
        {scene.method === "plate" && (
          <span
            aria-hidden="true"
            className="absolute -right-5 -top-5 z-50 flex size-9 items-center justify-center rounded-full bg-leaf text-xl text-white"
          >
            ✓
          </span>
        )}
      </div>
    </div>
  );
};
