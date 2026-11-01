import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
import { cn } from "@repo/ui/lib/utils";
export type FinishedDishProps = { scene: KitchenSceneModel };
export const FinishedDish = ({ scene }: FinishedDishProps) => {
  const edible = scene.allIngredients.filter(
    ({ kind, name }) =>
      !["liquid", "oil", "sauce", "seasoning", "sugar", "butter", "tea"].includes(kind) &&
      !/淀粉|面粉|泡打粉|酵母|面包糠/u.test(name)
  );
  const mains = edible.filter(({ kind }) => !["allium", "ginger"].includes(kind));
  const ingredients = mains.length > 0 ? mains : edible;
  const pastry = scene.dishForm === "cake";
  const brown =
    scene.category === "condiment" ||
    scene.allIngredients.some(({ name }) => /酱油|生抽|老抽|可乐/u.test(name));
  const stylized = ["cake", "dumplings", "rice", "noodles", "flatbread", "wholeFish"].includes(
    scene.dishForm
  );

  return (
    <div className="flex h-64 items-center justify-center p-8 sm:h-72" data-form={scene.dishForm}>
      <div
        aria-label={`${scene.recipeTitle}成品构成`}
        className={cn(
          "relative flex h-40 w-64 items-center justify-center border-[12px] border-white bg-[#f5f0de] shadow-[0_12px_0_#ded4bd,0_18px_20px_#745b2520] motion-safe:animate-kitchen-pop",
          ["bowl", "noodles", "rice"].includes(scene.dishForm)
            ? "rounded-[45%_45%_40%_40%]"
            : scene.dishForm === "cup"
              ? "h-44 w-32 rounded-[15%_15%_30%_30%] border-8"
              : "rounded-[50%]"
        )}
        role="img"
      >
        {scene.dishForm === "bowl" && (
          <span
            aria-hidden="true"
            className={cn(
              "absolute inset-1 rounded-[45%]",
              brown ? "bg-[#ac7139]" : "bg-[#e4cc8c]"
            )}
            data-testid="finished-broth"
          />
        )}
        {scene.dishForm === "cup" && (
          <span
            aria-hidden="true"
            className="absolute inset-x-1 bottom-1 h-24 rounded-b-3xl bg-[#d4b386]"
          />
        )}
        {scene.dishForm === "dumplings" && (
          <div
            aria-hidden="true"
            className="flex w-40 flex-wrap justify-center gap-2"
            data-testid="finished-dumplings"
          >
            {[0, 1, 2, 3, 4].map((index) => (
              <span
                key={index}
                className="h-8 w-10 rounded-[60%_60%_30%_30%] border-t-4 border-[#e7d5ab] bg-[#fff0ce] shadow-sm"
              />
            ))}
          </div>
        )}
        {scene.dishForm === "rice" && (
          <div
            aria-hidden="true"
            className="h-24 w-40 rounded-[60%_60%_35%_35%] bg-[#e9d590] bg-[radial-gradient(ellipse,#fff7d0_1px,transparent_2px)] bg-size-[7px_5px] shadow-[inset_-9px_-9px_0_#d8ba6c]"
            data-testid="finished-rice"
          />
        )}
        {scene.dishForm === "noodles" && (
          <div
            aria-hidden="true"
            className="relative flex h-24 w-40 items-center justify-center rounded-[50%] bg-[#e8c36d]"
            data-testid="finished-noodles"
          >
            {[
              "-translate-y-1.5",
              "-translate-y-0.5 translate-x-0.5 scale-90",
              "translate-y-0.5 translate-x-1 scale-80",
              "translate-y-1.5 translate-x-1.5 scale-70",
            ].map((position) => (
              <span
                key={position}
                className={cn(
                  "absolute h-16 w-32 rounded-[50%] border-[3px] border-[#f8e4a1]",
                  position
                )}
              />
            ))}
            <span className="absolute left-6 top-2 h-10 w-24 rounded-[50%] bg-[#87512d]" />
          </div>
        )}
        {scene.dishForm === "flatbread" && (
          <span
            aria-hidden="true"
            className="h-24 w-40 rounded-[50%] border-8 border-[#ce9b50] bg-[#edc46e] bg-[radial-gradient(#a75d27_2px,transparent_3px)] bg-size-[18px_15px]"
          />
        )}
        {scene.dishForm === "wholeFish" && (
          <div
            aria-hidden="true"
            className="relative h-14 w-40 rounded-[50%] bg-[#b89452] shadow-[inset_0_-7px_0_#90713d]"
            data-testid="finished-fish"
          >
            <span className="absolute -left-5 top-2 h-10 w-9 rounded-l-[70%] bg-[#ac8a4a]" />
            <span className="absolute right-5 top-3 size-2 rounded-full bg-ink" />
            <span className="absolute inset-x-10 top-3 h-6 bg-[repeating-linear-gradient(110deg,transparent_0_13px,#f5deb3_14px_17px)]" />
            <span className="absolute left-7 top-6 h-1 w-24 rotate-[-12deg] rounded-full bg-[#87a263]" />
          </div>
        )}
        {pastry &&
          (/蛋挞/u.test(scene.recipeTitle) ? (
            <div
              aria-hidden="true"
              className="grid grid-cols-2 gap-2"
              data-testid="finished-pastry"
            >
              {[0, 1, 2, 3].map((index) => (
                <span
                  key={index}
                  className="h-10 w-12 rounded-[50%] border-[5px] border-[#c79453] bg-[#f3d473] shadow-sm"
                />
              ))}
            </div>
          ) : (
            <div
              aria-hidden="true"
              className={cn(
                "h-20 w-32 rounded-[20%] border-t-[10px] shadow-[0_8px_0_#b8a484]",
                /奶冻|布丁|椰/u.test(scene.recipeTitle)
                  ? "border-[#b99a79] bg-[#f7efdc]"
                  : "border-[#c99350] bg-[#e4bf7e]"
              )}
              data-testid="finished-pastry"
            />
          ))}
        {!stylized && (
          <div className="relative z-10 flex max-w-44 flex-wrap justify-center gap-1">
            {ingredients.slice(0, 6).map((ingredient) => (
              <IngredientIllustration
                key={ingredient.name}
                compact
                ingredient={{
                  ...ingredient,
                  state: scene.method === "plate" ? "cooked" : ingredient.state,
                }}
              />
            ))}
          </div>
        )}
        {scene.method === "plate" && (
          <span
            aria-hidden="true"
            className="absolute -right-3 -top-3 flex size-10 items-center justify-center rounded-full bg-leaf text-xl text-white"
          >
            ✓
          </span>
        )}
      </div>
    </div>
  );
};
