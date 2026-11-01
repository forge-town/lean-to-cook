import { recipeCatalog, type Recipe } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import { Button } from "@repo/ui/button";
import { Select, SelectTrigger, SelectContent, SelectItem, SelectValue } from "@repo/ui/select";
import { KitchenScene } from "../SourceRecipeWorkbenchPage/KitchenScene";
import { WorkspaceHeader } from "@/components/WorkspaceHeader";
import { Workspace } from "@/components/Workspace";
import {
  codeClass,
  listButtonClass,
  panelTitleClass,
} from "@/components/Workspace/workspaceClasses";
import { useSimulatorPageStore } from "./_store";
import { buildSimulatorSceneModel, getSimulatorTheorem } from "./simulatorModel";
interface SimulatorPageContentProperties {
  recipe: Recipe;
}
export const SimulatorPageContent = ({ recipe }: SimulatorPageContentProperties) => {
  const blocked = useSimulatorPageStore((s) => s.blockedTransition);
  const snapshot = useSimulatorPageStore((s) => s.currentSnapshot);
  const completedStep = useSimulatorPageStore((s) => s.history.at(-1)?.stepIndex ?? 0);
  const handleActionButtonClick = useSimulatorPageStore((s) => s.handleActionButtonClick);
  const handleNextButtonClick = useSimulatorPageStore((s) => s.handleNextButtonClick);
  const handlePreviousButtonClick = useSimulatorPageStore((s) => s.handlePreviousButtonClick);
  const handleResetButtonClick = useSimulatorPageStore((s) => s.handleResetButtonClick);
  const handleRecipeValueChange = useSimulatorPageStore((s) => s.handleRecipeValueChange);
  const model = buildSimulatorSceneModel(recipe);
  const theorem = getSimulatorTheorem(
    recipe,
    blocked?.targetStepIndex ?? snapshot.stepIndex,
    !!blocked
  );
  const step = recipe.steps[snapshot.stepIndex - 1];

  return (
    <div className="h-full min-h-0" data-testid="simulator-page">
      <Workspace
        left={
          <>
            <h2 className={panelTitleClass}>菜谱</h2>
            <div className="p-4">
              <Select value={recipe.id} onValueChange={handleRecipeValueChange}>
                <SelectTrigger
                  aria-label="选择菜谱"
                  className="w-full border-border bg-paper text-ink"
                  data-testid="recipe-selector"
                >
                  <SelectValue>{recipe.title}</SelectValue>
                </SelectTrigger>
                <SelectContent className="border-border bg-surface text-ink">
                  {recipeCatalog.map((item) => (
                    <SelectItem key={item.id} value={item.id}>
                      {item.title}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            <h2 className={panelTitleClass}>操作步骤</h2>
            {recipe.steps.map((item) => (
              <Button
                key={item.id}
                aria-current={snapshot.stepIndex === item.sequence ? "step" : undefined}
                aria-label={`${item.sequence <= completedStep ? "查看" : "执行"}第 ${String(item.sequence).padStart(2, "0")} 步：${item.stageTitle}`}
                className={listButtonClass + " whitespace-normal leading-6"}
                data-step={item.sequence}
                onClick={handleActionButtonClick}
              >
                {item.sequence}. {item.stageTitle}
              </Button>
            ))}
          </>
        }
        right={
          <div data-testid="conclusion-panel">
            <h2 className={panelTitleClass}>当前状态</h2>
            <div className="space-y-6 p-5">
              <div className="flex flex-wrap gap-2">
                {snapshot.predicates.map((predicate) => (
                  <code key={predicate} className="rounded bg-leaf/8 px-2 py-1 text-xs text-leaf">
                    {predicate}
                  </code>
                ))}
              </div>
              {blocked && (
                <div
                  className="rounded border border-tomato/30 bg-tomato/5 p-4 text-sm leading-7 text-tomato"
                  data-testid="block-reason"
                  role="alert"
                >
                  {blocked.message}
                </div>
              )}
              {theorem && (
                <>
                  <h3 className="text-sm font-semibold">{theorem.name}</h3>
                  <pre className={codeClass}>{theorem.statement}</pre>
                </>
              )}
              <details className="text-sm">
                <summary className="cursor-pointer">模型范围</summary>
                <p className="mt-3 leading-7 text-muted">{recipe.proof.modelScope}</p>
              </details>
            </div>
          </div>
        }
      >
        <WorkspaceHeader
          nextDisabled={snapshot.stepIndex === recipe.steps.length}
          previousDisabled={snapshot.stepIndex === 0}
          title={recipe.title}
          onNextButtonClick={handleNextButtonClick}
          onPreviousButtonClick={handlePreviousButtonClick}
          onResetButtonClick={handleResetButtonClick}
        />
        <div className="min-h-0 flex-1 overflow-y-auto">
          <KitchenScene
            category={recipe.category}
            currentStepIndex={snapshot.stepIndex}
            model={model}
            recipeTitle={recipe.title}
          />
          <div className="p-6 sm:p-8">
            <div className="mb-8 mt-6 flex items-center justify-between">
              <span className="text-sm text-muted">当前步骤</span>
              <output className="font-mono text-sm">
                <span data-testid="current-step-index">{snapshot.stepIndex}</span> /{" "}
                {recipe.steps.length}
              </output>
            </div>
            <div
              key={snapshot.stepIndex}
              aria-live="polite"
              className="rounded-3xl border border-egg bg-egg/15 p-7 motion-safe:animate-kitchen-arrive"
            >
              <h2 className="font-display text-3xl leading-relaxed">
                {step?.instruction ?? "准备开始"}
              </h2>
              {snapshot.stepIndex === recipe.steps.length && (
                <p className="mt-4 text-leaf">步骤已完成</p>
              )}
            </div>
            <h2 className="mb-4 mt-9 font-display text-2xl">食材与用量</h2>
            <ul className="space-y-3 text-sm leading-7">
              {model.amounts.map((amount, index) => (
                <li key={index}>{amount}</li>
              ))}
            </ul>
            <Link
              className="mt-8 inline-block text-sm text-leaf underline underline-offset-4"
              params={{ recipeId: recipe.id }}
              to="/recipes/$recipeId"
            >
              查看完整证明
            </Link>
          </div>
        </div>
      </Workspace>
    </div>
  );
};
