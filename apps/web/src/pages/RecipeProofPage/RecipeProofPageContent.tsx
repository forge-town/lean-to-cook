import { buildProofTrace, type Recipe, type SourceRecipe } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import { Button } from "@repo/ui/button";
import { KitchenScene } from "../SourceRecipeWorkbenchPage/KitchenScene";
import { buildSimulatorSceneModel } from "../SimulatorPage/simulatorModel";
import { WorkspaceHeader } from "@/components/WorkspaceHeader";
import { Workspace } from "@/components/Workspace";
import {
  codeClass,
  listButtonClass,
  panelTitleClass,
} from "@/components/Workspace/workspaceClasses";
import { useRecipeProofPageStore } from "./_store";
import { getRecipeProofSource } from "./recipeProofSources";
interface RecipeProofPageContentProperties {
  markdown: string | undefined;
  recipe: Recipe;
  sourceRecipe: SourceRecipe | undefined;
}
export const RecipeProofPageContent = ({
  recipe,
  sourceRecipe,
}: RecipeProofPageContentProperties) => {
  const index = useRecipeProofPageStore((s) => s.currentStep);
  const selectedName = useRecipeProofPageStore((s) => s.selectedTheoremName);
  const handleNextButtonClick = useRecipeProofPageStore((s) => s.handleNextButtonClick);
  const handlePreviousButtonClick = useRecipeProofPageStore((s) => s.handlePreviousButtonClick);
  const handleResetButtonClick = useRecipeProofPageStore((s) => s.handleResetButtonClick);
  const handleStepButtonClick = useRecipeProofPageStore((s) => s.handleStepButtonClick);
  const handleTheoremButtonClick = useRecipeProofPageStore((s) => s.handleTheoremButtonClick);
  const trace = buildProofTrace(recipe);
  const step = trace.steps[index - 1];
  const state = step?.stateAfter ?? trace.initial;
  const theorem = recipe.proof.theorems.find((t) => t.name === selectedName);

  return (
    <Workspace
      left={
        <>
          <h2 className={panelTitleClass}>证明步骤</h2>
          <Button
            aria-current={index === 0 ? "step" : undefined}
            className={listButtonClass}
            data-step={0}
            onClick={handleStepButtonClick}
          >
            初始状态
          </Button>
          {recipe.steps.map((item) => (
            <Button
              key={item.id}
              aria-current={index === item.sequence ? "step" : undefined}
              className={listButtonClass + " whitespace-normal leading-6"}
              data-step={item.sequence}
              onClick={handleStepButtonClick}
            >
              {item.sequence}. {item.stageTitle}
            </Button>
          ))}
          <h2 className={panelTitleClass + " mt-4"}>定理</h2>
          {recipe.proof.theorems.map((item) => (
            <Button
              key={item.name}
              aria-current={selectedName === item.name ? "true" : undefined}
              className={listButtonClass + " break-all font-mono text-xs"}
              data-theorem={item.name}
              onClick={handleTheoremButtonClick}
            >
              {item.name}
            </Button>
          ))}
        </>
      }
      right={
        <>
          <h2 className={panelTitleClass}>Lean 代码</h2>
          <div className="p-4">
            <pre className={codeClass}>{getRecipeProofSource(recipe.id)}</pre>
          </div>
        </>
      }
    >
      <WorkspaceHeader
        nextDisabled={index === recipe.steps.length}
        previousDisabled={index === 0}
        title={recipe.title}
        onNextButtonClick={handleNextButtonClick}
        onPreviousButtonClick={handlePreviousButtonClick}
        onResetButtonClick={handleResetButtonClick}
      />
      <div className="min-h-0 flex-1 overflow-y-auto">
        <KitchenScene
          category={recipe.category}
          currentStepIndex={index}
          model={buildSimulatorSceneModel(recipe)}
          recipeTitle={recipe.title}
        />
        <div className="space-y-7 p-6 sm:p-8">
          <h2 className="font-display text-3xl">
            {recipe.steps[index - 1]?.instruction ?? "初始厨房状态"}
          </h2>
          <pre className={codeClass}>{`{ ${state.predicates.join(", ")} }`}</pre>
          {step?.numericDerivations.map((item) => (
            <section key={item.label} className="rounded-lg border border-border bg-surface p-5">
              <h3 className="mb-3 font-medium">{item.label}</h3>
              <code className="block break-words text-sm text-leaf">{item.expression}</code>
              <p className="mt-3 text-sm text-muted">{item.reason}</p>
            </section>
          ))}
          {theorem && (
            <section className="rounded-xl border border-border bg-surface p-6">
              <h2 className="mb-4 font-display text-xl">{theorem.name}</h2>
              <pre className={codeClass}>{theorem.statement}</pre>
            </section>
          )}
          <div className="flex gap-5 text-sm text-leaf">
            <Link search={{ recipe: recipe.id }} to="/simulator">
              在操作台试做
            </Link>
            {sourceRecipe && (
              <Link
                params={{ sourceRecipeId: sourceRecipe.id }}
                to="/source-recipe/$sourceRecipeId"
              >
                查看菜谱
              </Link>
            )}
          </div>
        </div>
      </div>
    </Workspace>
  );
};
