import type { ComponentProps } from "react";
import { cn } from "@repo/ui/lib/utils";
import { IngredientIllustration } from "../IngredientIllustration";
import type { KitchenSceneModel } from "../kitchenSceneModel";
export type ApplianceVesselProps = ComponentProps<"div"> & { scene: KitchenSceneModel };
export const ApplianceVessel = ({ scene, className, ...props }: ApplianceVesselProps) => (
  <div
    {...props}
    aria-label={`${scene.methodLabel}，使用${scene.vesselLabel}`}
    className={cn("flex h-64 items-center justify-center overflow-hidden sm:h-72", className)}
    data-testid="appliance-vessel"
    role="img"
  >
    <div className="relative flex h-44 w-72 items-center justify-center rounded-3xl border-[10px] border-[#6f8278] bg-[#263b35] shadow-[0_9px_0_#4c5e54]">
      <span className="absolute -right-2 inset-y-5 w-3 rounded-full bg-[#a9b5a7]" />
      <div
        className={cn(
          "relative flex h-20 w-48 items-center justify-center gap-2 rounded-[45%] border-b-[7px] border-[#d9cfb7] bg-[#faf0d5]",
          scene.method === "microwave" && "motion-safe:animate-microwave-tray",
          scene.method === "airFry" &&
            "rounded-xl border-[#8d9f8b] bg-[#4c6556] bg-[repeating-linear-gradient(0deg,transparent_0_7px,#273c32_8px_9px)]"
        )}
        data-testid="appliance-tray"
      >
        {scene.method === "airFry" && (
          <span
            className="absolute -top-9 inset-x-3 h-6 rounded-[50%] border-t-2 border-dashed border-egg/60 motion-safe:animate-cooking-waves"
            data-testid="air-fryer-basket"
          />
        )}
        {scene.activeIngredients
          .filter(
            ({ kind }) => !["liquid", "oil", "sauce", "sugar", "seasoning", "butter"].includes(kind)
          )
          .slice(0, 4)
          .map((ingredient) => (
            <span
              key={ingredient.name}
              className={cn(
                scene.method === "airFry" &&
                  scene.actions?.includes("transfer") &&
                  "motion-safe:animate-pan-flip"
              )}
              data-flip={scene.actions?.includes("transfer") ?? false}
              data-testid="appliance-food"
            >
              <IngredientIllustration compact ingredient={ingredient} />
            </span>
          ))}
      </div>
      <span
        aria-hidden="true"
        className={cn(
          "pointer-events-none absolute inset-2 rounded-xl border-2 motion-safe:animate-cooking-waves",
          scene.method === "microwave" ? "border-egg/50" : "border-orange-300/60 bg-orange-300/5"
        )}
      />
    </div>
  </div>
);
