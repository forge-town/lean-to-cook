import type { RecipeCategory } from "@repo/schemas";
import { getKitchenActionRenderer } from "../kitchenActionRenderers";
import { IngredientIllustration } from "../IngredientIllustration";
import { buildKitchenSceneModel } from "../kitchenSceneModel";
import type { SourceRecipeWorkbenchModel } from "../sourceRecipeWorkbenchModel";
export type KitchenSceneProps = {
  category: RecipeCategory;
  currentStepIndex: number;
  model: SourceRecipeWorkbenchModel;
  recipeTitle: string;
};
export const KitchenScene = ({
  category,
  currentStepIndex,
  model,
  recipeTitle,
}: KitchenSceneProps) => {
  const scene = buildKitchenSceneModel(model, recipeTitle, category, currentStepIndex);
  const ActionRenderer = getKitchenActionRenderer(scene);

  return (
    <section
      aria-label={`${recipeTitle}烹饪演示`}
      className="overflow-hidden border-b border-border bg-egg/10"
      data-atmosphere={scene.atmosphere}
      data-category={category}
      data-method={scene.method}
      data-step={currentStepIndex}
      data-testid="kitchen-scene"
    >
      <div className="flex items-center justify-between gap-3 px-5 pt-4 text-sm font-semibold text-leaf">
        <span>{scene.methodLabel}</span>
        <span className="font-normal text-muted">{scene.vesselLabel}</span>
      </div>
      <ActionRenderer key={`${recipeTitle}-${currentStepIndex}`} scene={scene} />
      <div
        aria-label="食材状态"
        className="flex gap-3 overflow-x-auto border-t border-egg/30 bg-surface/70 px-4 py-4"
      >
        {scene.allIngredients.map((ingredient) => (
          <IngredientIllustration key={ingredient.name} ingredient={ingredient} />
        ))}
      </div>
    </section>
  );
};
