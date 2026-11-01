import type { SourceRecipe } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import { Button } from "@repo/ui/button";
import { WorkspaceHeader } from "@/components/WorkspaceHeader";
import { Workspace } from "@/components/Workspace";
import {
  codeClass,
  listButtonClass,
  panelTitleClass,
} from "@/components/Workspace/workspaceClasses";
import { KitchenScene } from "./KitchenScene";
import { useSourceRecipeWorkbenchPageStore } from "./_store";
import {
  getSourceRecipeStepLabel,
  type SourceRecipeWorkbenchModel,
} from "./sourceRecipeWorkbenchModel";
import { sourceProofExcerpt } from "./sourceProofExcerpt";
interface SourceRecipeWorkbenchPageContentProperties {
  model: SourceRecipeWorkbenchModel;
  sourceRecipe: SourceRecipe;
}
export const SourceRecipeWorkbenchPageContent = ({
  model,
  sourceRecipe,
}: SourceRecipeWorkbenchPageContentProperties) => {
  const index = useSourceRecipeWorkbenchPageStore((s) => s.currentStepIndex);
  const handleStepButtonClick = useSourceRecipeWorkbenchPageStore((s) => s.handleStepButtonClick);
  const handlePreviousButtonClick = useSourceRecipeWorkbenchPageStore(
    (s) => s.handlePreviousButtonClick
  );
  const handleNextButtonClick = useSourceRecipeWorkbenchPageStore((s) => s.handleNextButtonClick);
  const handleResetButtonClick = useSourceRecipeWorkbenchPageStore((s) => s.handleResetButtonClick);
  const step = model.steps[index - 1];

  return (
    <Workspace
      left={
        <>
          <h2 className={panelTitleClass}>做法</h2>
          <Button
            aria-current={index === 0 ? "step" : undefined}
            className={listButtonClass}
            data-step={0}
            onClick={handleStepButtonClick}
          >
            准备食材
          </Button>
          {model.steps.map((item) => (
            <Button
              key={item.id}
              aria-current={index === item.sequence ? "step" : undefined}
              className={listButtonClass + " whitespace-normal leading-6"}
              data-step={item.sequence}
              title={item.instruction}
              onClick={handleStepButtonClick}
            >
              <span className="line-clamp-2 min-w-0">
                {item.sequence}. {getSourceRecipeStepLabel(item.instruction)}
              </span>
            </Button>
          ))}
        </>
      }
      right={
        <>
          <h2 className={panelTitleClass}>结构证明</h2>
          <div className="p-4">
            <pre className={codeClass}>{sourceProofExcerpt(sourceRecipe.id)}</pre>
          </div>
        </>
      }
    >
      <WorkspaceHeader
        nextDisabled={index === model.steps.length}
        previousDisabled={index === 0}
        title={sourceRecipe.title}
        onNextButtonClick={handleNextButtonClick}
        onPreviousButtonClick={handlePreviousButtonClick}
        onResetButtonClick={handleResetButtonClick}
      />
      <div className="min-h-0 flex-1 overflow-y-auto">
        <KitchenScene
          category={sourceRecipe.category}
          currentStepIndex={index}
          model={model}
          recipeTitle={sourceRecipe.title}
        />
        <div className="p-6 sm:p-8">
          <div
            key={index}
            aria-live="polite"
            className="mt-7 rounded-3xl border border-egg bg-egg/15 p-7 motion-safe:animate-kitchen-arrive"
          >
            <div className="mb-4 text-sm text-muted">{index === 0 ? "准备" : `第 ${index} 步`}</div>
            <h2 className="font-display text-2xl leading-relaxed">
              {step?.instruction ?? "备好食材与工具"}
            </h2>
            {index === model.steps.length && index > 0 && (
              <p className="mt-4 font-medium text-leaf">步骤已完成</p>
            )}
          </div>
          <h2 className="mb-4 mt-8 font-display text-2xl">食材与用量</h2>
          <ul className="space-y-3 text-sm leading-7">
            {(model.amounts.length > 0 ? model.amounts : model.ingredients).map((item, i) => (
              <li key={i}>{item}</li>
            ))}
          </ul>
          <Link
            className="mt-8 inline-block text-sm text-leaf underline underline-offset-4"
            params={{ sourceRecipeId: sourceRecipe.id }}
            to="/source-recipe/$sourceRecipeId"
          >
            查看完整菜谱
          </Link>
        </div>
      </div>
    </Workspace>
  );
};
