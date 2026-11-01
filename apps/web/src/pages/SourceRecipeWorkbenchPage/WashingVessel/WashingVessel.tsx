import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import type { KitchenSceneModel } from "../kitchenSceneModel";
import { IngredientIllustration } from "../IngredientIllustration";
export type WashingVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const WashingVessel = ({ scene, className, ...props }: WashingVesselProps) => {
  const ingredients = scene.activeIngredients.filter(
    ({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning"].includes(kind)
  );

  return (
    <div
      {...props}
      aria-label="清水冲洗食材，使用水槽和沥水篮"
      className={cn("relative isolate h-64 overflow-hidden sm:h-72", className)}
      data-testid="washing-vessel"
      role="img"
    >
      <div
        aria-hidden="true"
        className="absolute bottom-7 left-1/2 h-6 w-64 -translate-x-1/2 rounded-[50%] bg-ink/10 blur-md"
      />
      <div
        aria-hidden="true"
        className="absolute left-[calc(50%-90px)] top-5 h-14 w-20 rounded-tr-[24px] border-r-[10px] border-t-[10px] border-[#9bafae] shadow-[3px_-2px_0_#d9e4dd]"
        data-testid="wash-tap"
      >
        <span className="absolute -right-3 bottom-0 h-2 w-4 rounded-sm bg-[#d1ded8]" />
      </div>
      <div
        aria-hidden="true"
        className="absolute bottom-9 left-1/2 h-32 w-64 -translate-x-1/2 rounded-[45%] border-[10px] border-[#c6d5ce] bg-[#c6e7e8] shadow-[0_10px_0_#9eb5ac,0_14px_20px_#3f726420]"
        data-testid="wash-basin"
      >
        <span className="absolute inset-2 rounded-[45%] border-2 border-white/45" />
        <span
          className="absolute inset-5 rounded-[50%] border-2 border-white/65 motion-safe:animate-wash-ripple"
          data-testid="wash-ripple"
        />
        <span className="absolute inset-x-6 bottom-4 h-6 rounded-[50%] border-2 border-white/50 motion-safe:animate-wash-ripple [animation-delay:350ms]" />
      </div>
      <div
        className="absolute bottom-[72px] left-1/2 z-20 flex -translate-x-1/2 items-center justify-center gap-1 motion-safe:animate-wash-rinse"
        data-testid="wash-ingredients"
      >
        {ingredients.slice(0, 4).map((ingredient) => (
          <IngredientIllustration key={ingredient.name} compact ingredient={ingredient} />
        ))}
      </div>
      <div
        aria-hidden="true"
        className="absolute left-[calc(50%-20px)] top-[74px] z-30 h-24 w-5 origin-top rounded-b-full bg-[repeating-linear-gradient(0deg,#e7ffffcc_0_8px,#80c9d180_9px_16px)] shadow-[0_0_8px_#fff9] motion-safe:animate-wash-flow motion-reduce:hidden"
        data-testid="wash-water"
      />
      <div
        aria-hidden="true"
        className="absolute left-1/2 top-40 z-30 flex -translate-x-1/2 gap-8 motion-safe:animate-wash-splash motion-reduce:hidden"
        data-testid="wash-splash"
      >
        <span className="h-3 w-1.5 -rotate-35 rounded-full bg-sky-200" />
        <span className="h-2 w-1 rounded-full bg-sky-100" />
        <span className="h-3 w-1.5 rotate-35 rounded-full bg-sky-200" />
      </div>
    </div>
  );
};
