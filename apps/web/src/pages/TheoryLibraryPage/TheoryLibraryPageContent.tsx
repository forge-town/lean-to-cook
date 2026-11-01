import kitchenTheoryLeanSource from "@repo/lean-proofs/Theories/KitchenTheory.lean?raw";
import { kitchenTheoryCatalog } from "@repo/schemas";
import { Button } from "@repo/ui/button";
import { Workspace } from "@/components/Workspace";
import {
  actionButtonClass,
  codeClass,
  listButtonClass,
  panelTitleClass,
} from "@/components/Workspace/workspaceClasses";
import { useTheoryLibraryPageStore } from "./_store";
export const TheoryLibraryPageContent = () => {
  const selectedId = useTheoryLibraryPageStore((s) => s.selectedTheoryId);
  const stage = useTheoryLibraryPageStore((s) => s.currentStage);
  const handleTheoryButtonClick = useTheoryLibraryPageStore((s) => s.handleTheoryButtonClick);
  const handleStageButtonClick = useTheoryLibraryPageStore((s) => s.handleStageButtonClick);
  const handlePreviousButtonClick = useTheoryLibraryPageStore((s) => s.handlePreviousButtonClick);
  const handleNextButtonClick = useTheoryLibraryPageStore((s) => s.handleNextButtonClick);
  const theory = kitchenTheoryCatalog.find((t) => t.id === selectedId) ?? kitchenTheoryCatalog[0];
  const stages = [
    { label: "前提", expression: theory.assumptions.join(" ∧ "), reason: "载入前提。" },
    ...theory.reductions.map((r) => ({ ...r, label: "归约" })),
    { label: "结论", expression: theory.conclusion, reason: "归约完成。" },
  ];
  const namespaceStart = kitchenTheoryLeanSource.indexOf(`namespace ${theory.lean.namespace}\n`);
  const namespaceEnd = kitchenTheoryLeanSource.indexOf(
    `end ${theory.lean.namespace}`,
    namespaceStart
  );
  const source =
    namespaceStart >= 0 && namespaceEnd >= 0
      ? kitchenTheoryLeanSource.slice(
          namespaceStart,
          namespaceEnd + `end ${theory.lean.namespace}`.length
        )
      : theory.lean.statement;

  return (
    <Workspace
      left={
        <>
          <h2 className={panelTitleClass}>基础理论</h2>
          {kitchenTheoryCatalog.map((item) => (
            <Button
              key={item.id}
              aria-current={item.id === theory.id ? "true" : undefined}
              className={listButtonClass}
              data-theory-id={item.id}
              variant="ghost"
              onClick={handleTheoryButtonClick}
            >
              {item.title}
            </Button>
          ))}
        </>
      }
      right={
        <>
          <h2 className={panelTitleClass}>Lean 代码</h2>
          <div className="p-4">
            <pre className={codeClass}>{source}</pre>
          </div>
        </>
      }
    >
      <div className="flex shrink-0 items-center justify-between gap-4 border-b border-border bg-surface px-6 py-4">
        <h1 className="text-base font-semibold">{theory.title}</h1>
        <div className="flex gap-2">
          <Button
            className={actionButtonClass}
            disabled={stage === 0}
            onClick={handlePreviousButtonClick}
          >
            上一步
          </Button>
          <Button
            className={actionButtonClass}
            disabled={stage >= stages.length - 1}
            onClick={handleNextButtonClick}
          >
            下一步
          </Button>
        </div>
      </div>
      <div className="min-h-0 flex-1 overflow-y-auto p-6 sm:p-8">
        <p className="mt-4 leading-8 text-muted">{theory.summary}</p>
        <pre className={codeClass + " mt-7"}>⊢ {theory.lean.statement}</pre>
        <div className="my-8 flex flex-wrap gap-2">
          {stages.map((item, index) => (
            <Button
              key={index}
              aria-current={stage === index ? "step" : undefined}
              className={actionButtonClass + " aria-current:bg-leaf aria-current:text-white"}
              data-stage={index}
              data-theory-id={theory.id}
              onClick={handleStageButtonClick}
            >
              {item.label} {index + 1}
            </Button>
          ))}
        </div>
        <section
          key={`${theory.id}-${stage}`}
          className="rounded-3xl border border-egg bg-egg/15 p-7 motion-safe:animate-kitchen-arrive"
        >
          <h3 className="mb-4 text-sm text-muted">{stages[stage].label}</h3>
          <pre className="whitespace-pre-wrap break-words font-mono text-xl leading-9 text-leaf">
            {stages[stage].expression}
          </pre>
          <p className="mt-5 leading-8 text-muted">{stages[stage].reason}</p>
        </section>
      </div>
    </Workspace>
  );
};
