import { useContext } from "react";
import { ingredientImagePaths } from "@repo/schemas/catalog";
import { cn } from "@repo/ui/lib/utils";
import { IngredientContext } from "../../../integrations/catalog/ingredientContext";
import { findIngredientPresentation } from "../../../integrations/catalog/ingredientLookup";
import { getIngredientIconAsset } from "../ingredientIconCatalog";
import type { KitchenIngredientVisual } from "../kitchenSceneModel";
import { IngredientPieces } from "../IngredientPieces";
export type IngredientIllustrationProps = {
  compact?: boolean;
  ingredient: KitchenIngredientVisual;
};
export const IngredientIllustration = ({
  compact = false,
  ingredient,
}: IngredientIllustrationProps) => {
  const rows = useContext(IngredientContext);
  const configured = findIngredientPresentation(rows, ingredient.name);
  const name = configured?.name ?? ingredient.name;
  const powder = /辣椒面|辣椒粉/u.test(ingredient.name);
  const sesame = /芝麻/u.test(ingredient.name);
  const icon = configured?.imageKey
    ? { key: configured.imageKey, src: ingredientImagePaths[configured.imageKey] }
    : getIngredientIconAsset(ingredient);
  const stateLabel = {
    raw: "原始",
    washed: "已洗净",
    prepped:
      ingredient.form === "peeled"
        ? "已去皮"
        : ingredient.form === "beaten"
          ? "已打散"
          : ["liquid", "oil", "sauce", "sugar", "seasoning", "tea"].includes(ingredient.kind)
            ? "已备好"
            : "已切配",
    cooking: "受热中",
    cooked: "已熟成",
  }[ingredient.state];

  return (
    <figure
      aria-label={`${name}，${stateLabel}`}
      className={cn(
        "group/ingredient flex shrink-0 flex-col items-center gap-2",
        compact ? "w-12" : "w-20"
      )}
      data-compact={compact}
      data-icon={icon.key}
      data-kind={ingredient.kind}
      data-state={ingredient.state}
    >
      <div
        aria-hidden="true"
        className={cn(
          "relative flex items-center justify-center rounded-2xl",
          compact
            ? "size-12"
            : "size-14 bg-paper group-data-[state=washed]/ingredient:bg-sky-100/60 group-data-[state=prepped]/ingredient:bg-egg/30 group-data-[state=cooking]/ingredient:bg-tomato/15 group-data-[state=cooked]/ingredient:bg-leaf/10"
        )}
      >
        {ingredient.form === "tart" ? (
          <span
            className={cn(
              "h-8 w-10 rounded-[50%] border-[5px] border-[#cda665] bg-[#f9dc7d] shadow-sm",
              ingredient.state === "cooked" && "border-[#b6813b] bg-[#ecc15c]"
            )}
            data-testid="custard-tart"
          />
        ) : /茶包|袋泡/u.test(ingredient.name) ? (
          <span
            className="relative mt-2 h-7 w-6 rounded-b border border-[#9f987f] bg-[#c4ad7d] shadow-sm"
            data-testid="tea-packet"
          >
            <span className="absolute -top-4 left-3 h-6 w-px bg-[#ece0bd]" />
            <span className="absolute -top-4 left-4 h-2 w-2 bg-leaf/70" />
            <span className="absolute inset-1 bg-[radial-gradient(#746c4e_1px,transparent_1px)] bg-size-[4px_4px]" />
          </span>
        ) : /饺|馄饨|汤圆/u.test(ingredient.name) ? (
          <span
            className="h-7 w-10 rounded-[60%_60%_30%_30%] border-t-4 border-[#dfcba5] bg-[#fff0ce] shadow-sm"
            data-testid="dumpling-food"
          />
        ) : ingredient.kind === "meat" && /末|碎/u.test(ingredient.name) ? (
          <span className="flex w-10 flex-wrap gap-0.5" data-testid="minced-meat">
            {[0, 1, 2, 3, 4, 5, 6, 7].map((i) => (
              <span key={i} className="size-2 rounded-[35%] bg-[#bd8b75] shadow-sm" />
            ))}
          </span>
        ) : compact && ingredient.kind === "rice" ? (
          <span className="flex w-10 flex-wrap gap-0.5" data-testid="loose-rice">
            {[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map((i) => (
              <span key={i} className="h-1.5 w-2 -rotate-12 rounded-full bg-[#f5e6b7] shadow-sm" />
            ))}
          </span>
        ) : compact && ingredient.kind === "noodle" ? (
          <span className="flex w-10 flex-col gap-0.5" data-testid="loose-noodles">
            {[0, 1, 2, 3].map((i) => (
              <span key={i} className="h-2 w-9 rounded-[50%] border-t-2 border-[#e0bd6d]" />
            ))}
          </span>
        ) : ingredient.form === "sunny" ? (
          <span
            className="relative flex h-8 w-11 items-center justify-center rounded-[45%_55%_40%_50%] bg-[#fff5dc] shadow-sm"
            data-testid="sunny-egg"
          >
            <span className="size-5 rounded-full bg-[#f3ba32] shadow-[inset_-2px_-2px_0_#dca128]" />
          </span>
        ) : /紫菜|海带/u.test(ingredient.name) ? (
          <span className="flex w-10 flex-wrap gap-1" data-testid="seaweed-strips">
            {[0, 1, 2, 3].map((i) => (
              <span key={i} className="h-2 w-4 -rotate-12 rounded-[30%] bg-[#42594a] shadow-sm" />
            ))}
          </span>
        ) : ingredient.form === "ribbons" ? (
          <span
            className="flex w-10 flex-wrap gap-1 motion-safe:animate-kitchen-pop"
            data-testid="egg-ribbons"
          >
            {[0, 1, 2, 3].map((i) => (
              <span key={i} className="h-1.5 w-4 rotate-12 rounded-[50%] bg-[#ffe6a2]" />
            ))}
          </span>
        ) : ingredient.form === "melted" ? (
          <span
            className="relative flex h-8 w-10 items-center justify-center"
            data-testid="melted-fat"
          >
            <span className="absolute inset-0 rounded-[50%] bg-[#ecc442]/70 motion-safe:animate-fat-pool" />
            <span className="h-4 w-5 rounded bg-yellow-200 shadow-[inset_-3px_-3px_0_#e8b92d] motion-safe:animate-fat-melt motion-reduce:hidden" />
          </span>
        ) : ingredient.form === "curds" ? (
          <span className="flex w-10 flex-wrap justify-center gap-0.5" data-testid="egg-curds">
            {[0, 1, 2, 3, 4].map((index) => (
              <span
                key={index}
                className="h-3 w-3 rounded-[45%_30%_40%_25%] bg-[#f1c33d] shadow-[inset_-2px_-2px_0_#dda42e]"
              />
            ))}
          </span>
        ) : ingredient.form === "pieces" ? (
          <IngredientPieces ingredient={ingredient} />
        ) : ingredient.form === "beaten" ? (
          <span
            className="h-7 w-10 rounded-[50%] bg-yellow-300 shadow-[inset_0_0_6px_#e8a52b]"
            data-testid="beaten-egg-icon"
          />
        ) : ingredient.form === "peeled" ? (
          <span
            className={cn(
              "size-9 rounded-full shadow-[inset_-4px_-3px_0_#0001]",
              ingredient.kind === "tomato"
                ? "bg-[#f6a071]"
                : ingredient.kind === "corn"
                  ? "h-10 w-6 rounded-[40%] bg-[#f4d36e] bg-[radial-gradient(#d8ad39_1px,transparent_2px)] bg-size-[5px_5px]"
                  : ingredient.kind === "allium"
                    ? "h-9 w-6 rounded-[65%_30%_50%_30%] bg-[#f6edcf]"
                    : ingredient.kind === "carrot"
                      ? "h-10 w-5 rounded-[30%_30%_70%_70%] bg-[#eea153]"
                      : "h-10 w-8 rounded-[45%] bg-[#eed59d]"
            )}
            data-testid="peeled-ingredient"
          />
        ) : powder || sesame ? (
          <span
            className={cn(
              "h-8 w-10 rounded-[50%] shadow-[0_3px_0_#c6ae85]",
              powder
                ? "bg-[#b83e1f] bg-[radial-gradient(ellipse,#ee8747_1px,transparent_1.5px)] bg-size-[5px_4px]"
                : "bg-[#dcc38a] bg-[radial-gradient(ellipse,#fff5cf_1.5px,transparent_2px)] bg-size-[6px_5px]"
            )}
            data-testid={powder ? "ingredient-powder" : "ingredient-sesame"}
          />
        ) : (
          <img
            alt=""
            className="size-[85%] object-contain drop-shadow-sm group-data-[state=prepped]/ingredient:rotate-[-10deg] group-data-[state=prepped]/ingredient:scale-90 group-data-[state=cooking]/ingredient:saturate-150 group-data-[state=cooking]/ingredient:motion-safe:animate-cooking-sizzle group-data-[state=cooked]/ingredient:sepia-20"
            height={48}
            src={icon.src}
            width={48}
          />
        )}
        <span className="absolute bottom-0 right-0 hidden size-2.5 rounded-full border-2 border-surface bg-leaf group-data-[state=cooked]/ingredient:block" />
      </div>
      {!compact && (
        <figcaption
          className="max-w-full truncate text-center text-xs font-medium"
          title={`${name}，${stateLabel}`}
        >
          {name}
        </figcaption>
      )}
    </figure>
  );
};
