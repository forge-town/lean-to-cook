import { cn } from "@repo/ui/lib/utils";
import type { KitchenIngredientVisual } from "../kitchenSceneModel";
export type IngredientPiecesProps = { ingredient: KitchenIngredientVisual };
export const IngredientPieces = ({ ingredient }: IngredientPiecesProps) => {
  const red = ["tomato", "chili", "meat", "fish", "shrimp"].includes(ingredient.kind);
  const green = ["leaf", "allium", "cucumber"].includes(ingredient.kind);

  if (/柠檬|橙|柚/u.test(ingredient.name))
    return (
      <span className="flex w-10 flex-wrap justify-center gap-0.5" data-testid="citrus-rounds">
        {[0, 1, 2].map((i) => (
          <span
            key={i}
            className="size-4 rounded-full border-2 border-[#edc032] bg-[#fff3b0] bg-[conic-gradient(from_0deg,#ffe27b_0deg_55deg,#fff9dc_55deg_60deg,#ffe27b_60deg_115deg,#fff9dc_115deg_120deg,#ffe27b_120deg_175deg,#fff9dc_175deg_180deg,#ffe27b_180deg_235deg,#fff9dc_235deg_240deg,#ffe27b_240deg_295deg,#fff9dc_295deg_300deg,#ffe27b_300deg_355deg,#fff9dc_355deg_360deg)]"
          />
        ))}
      </span>
    );

  return (
    <span
      aria-hidden="true"
      className="grid size-10 grid-cols-3 content-center gap-0.5"
      data-kind={ingredient.kind}
      data-testid="ingredient-pieces"
    >
      {[0, 1, 2, 3, 4, 5].map((piece) => (
        <span
          key={piece}
          className={cn(
            "h-3 w-3 rounded-[3px] border-b-2 border-black/10 shadow-sm",
            red
              ? "bg-[#e8754d]"
              : green
                ? "bg-[#91b56c]"
                : ingredient.kind === "eggplant"
                  ? "bg-[#b092bb]"
                  : "bg-[#e9c47d]",
            ingredient.kind === "allium" &&
              /蒜/u.test(ingredient.name) &&
              "rounded-[40%_15%] bg-[#ece0bd]",
            ingredient.kind === "carrot" && "-rotate-12 rounded-[35%_15%] bg-[#ed9b46]",
            ingredient.kind === "corn" &&
              "rounded-full border-2 border-[#e9b640] bg-[#ffd665] bg-[radial-gradient(#d8a42e_1px,transparent_1px)] bg-size-[4px_4px]",
            ingredient.kind === "ginger" && "h-2 w-4 rounded-[50%] bg-[#e7ce8e]",
            ingredient.kind === "meat" &&
              "rounded-[35%] bg-[#c98b78] bg-[radial-gradient(ellipse,#fff0d4_2px,transparent_3px)]",
            ingredient.kind === "eggplant" &&
              "rounded-[40%_15%] border-l-2 border-l-[#7b5d85] bg-[#e3dab1]",
            ingredient.kind === "tomato" &&
              "bg-[radial-gradient(#ffe5a8_1px,transparent_1px)] bg-size-[5px_5px]",
            ingredient.state === "cooked" && "saturate-125 brightness-90"
          )}
        />
      ))}
    </span>
  );
};
