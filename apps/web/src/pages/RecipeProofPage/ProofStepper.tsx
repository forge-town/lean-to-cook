import { buildProofTrace, type Recipe } from "@repo/schemas";

import { useRecipeProofPageStore } from "./_store";
import { getProofJudgement, getStateSymbol } from "./proofNotation";

interface ProofStepperProperties {
  recipe: Recipe;
}

export const ProofStepper = ({ recipe }: ProofStepperProperties) => {
  const proofTrace = buildProofTrace(recipe);
  const currentStep = useRecipeProofPageStore((state) => state.currentStep);
  const handleNextButtonClick = useRecipeProofPageStore((state) => state.handleNextButtonClick);
  const handlePreviousButtonClick = useRecipeProofPageStore(
    (state) => state.handlePreviousButtonClick
  );
  const handleResetButtonClick = useRecipeProofPageStore((state) => state.handleResetButtonClick);
  const handleStepButtonClick = useRecipeProofPageStore((state) => state.handleStepButtonClick);
  const handleTheoremButtonClick = useRecipeProofPageStore(
    (state) => state.handleTheoremButtonClick
  );
  const selectedTheoremName = useRecipeProofPageStore((state) => state.selectedTheoremName);
  const currentTraceStep = proofTrace.steps[currentStep - 1];
  const currentState = currentTraceStep?.stateAfter ?? proofTrace.initial;
  const selectedTheorem = recipe.proof.theorems.find(
    (theorem) => theorem.name === selectedTheoremName
  );

  return (
    <div className="proof-stepper">
      <div className="proof-stepper-header">
        <div>
          <p className="proof-kicker">Formal trace</p>
          <h3>逐步归约</h3>
        </div>
        <output aria-live="polite" className="proof-step-counter">
          {String(currentStep).padStart(2, "0")}
          <span>/ {recipe.steps.length}</span>
        </output>
      </div>

      <div aria-live="polite" className="proof-derivation-card">
        <div className="proof-derivation-heading">
          <span>{currentStep === 0 ? "base state" : `reduction ${currentStep}`}</span>
          <code>{getProofJudgement(proofTrace, currentStep)}</code>
        </div>

        {currentTraceStep ? (
          <div className="proof-inference-rule">
            <code>
              ready {getStateSymbol(currentTraceStep.stateBefore.index)} .
              {currentTraceStep.formalAction} = true
            </code>
            <span aria-hidden="true" />
            <code>
              {getStateSymbol(currentTraceStep.stateAfter.index)} ≔ applyStep{" "}
              {getStateSymbol(currentTraceStep.stateBefore.index)} .{currentTraceStep.formalAction}
            </code>
          </div>
        ) : (
          <p className="proof-base-definition">run initialKitchen [] = some initialKitchen</p>
        )}

        <div className="proof-state-snapshot">
          <span>π({getStateSymbol(currentState.index)}) =</span>
          <code>{`{ ${currentState.predicates.join(", ")} }`}</code>
        </div>

        <div className="proof-numeric-reduction">
          <div className="proof-numeric-heading">
            <span>Numeric reduction</span>
            <strong>{currentTraceStep?.numericDerivations.length ?? 0} equations</strong>
          </div>
          {currentTraceStep && currentTraceStep.numericDerivations.length > 0 ? (
            <div className="proof-numeric-equations">
              {currentTraceStep.numericDerivations.map((derivation) => (
                <article key={derivation.label}>
                  <div>
                    <span>{derivation.label}</span>
                    <strong>{derivation.result}</strong>
                  </div>
                  <code>{derivation.expression}</code>
                  <small>{derivation.reason}</small>
                  <button
                    data-theorem={derivation.theorem}
                    type="button"
                    onClick={handleTheoremButtonClick}
                  >
                    inspect {derivation.theorem} →
                  </button>
                </article>
              ))}
            </div>
          ) : (
            <div className="proof-numeric-empty">
              <code>
                {currentStep === 0
                  ? `${recipe.presentation.contextLabel} := ${recipe.presentation.defaultContextValue}`
                  : "Δ quantity = ∅"}
              </code>
              <span>
                {currentStep === 0
                  ? "该数量上下文是后续全部数量函数的输入。"
                  : "此步只改写厨房状态，没有引入新的数量等式。"}
              </span>
            </div>
          )}
        </div>
      </div>

      <ol aria-label="证明步骤" className="proof-step-list">
        <li>
          <button
            aria-current={currentStep === 0 ? "step" : undefined}
            className="proof-step-button"
            data-status={currentStep === 0 ? "current" : "complete"}
            data-step="0"
            data-theorem-related={selectedTheorem?.derivation.relatedSteps.includes(0)}
            type="button"
            onClick={handleStepButtonClick}
          >
            <span className="proof-step-number">00</span>
            <span className="proof-step-copy">
              <code>{getProofJudgement(proofTrace, 0)}</code>
              <small className="proof-step-translation">初始厨房状态：食材就位，火源关闭。</small>
            </span>
            <span aria-hidden="true" className="proof-step-mark">
              {currentStep === 0 ? "→" : "✓"}
            </span>
          </button>
        </li>

        {proofTrace.steps.map((traceStep) => {
          const status =
            traceStep.sequence === currentStep
              ? "current"
              : traceStep.sequence < currentStep
                ? "complete"
                : "pending";

          return (
            <li key={traceStep.stepId}>
              <button
                aria-current={status === "current" ? "step" : undefined}
                className="proof-step-button"
                data-has-numeric={traceStep.numericDerivations.length > 0}
                data-status={status}
                data-step={traceStep.sequence}
                data-theorem-related={selectedTheorem?.derivation.relatedSteps.includes(
                  traceStep.sequence
                )}
                type="button"
                onClick={handleStepButtonClick}
              >
                <span className="proof-step-number">
                  {String(traceStep.sequence).padStart(2, "0")}
                </span>
                <span className="proof-step-copy">
                  <code>{getProofJudgement(proofTrace, traceStep.sequence)}</code>
                  <small className="proof-step-translation">{traceStep.instruction}</small>
                  {traceStep.numericDerivations.length > 0 ? (
                    <small className="proof-step-numeric-summary">
                      {traceStep.numericDerivations
                        .map((derivation) => derivation.result)
                        .join(" · ")}
                    </small>
                  ) : null}
                </span>
                <span aria-hidden="true" className="proof-step-mark">
                  {status === "complete" ? "✓" : status === "current" ? "→" : "·"}
                </span>
              </button>
            </li>
          );
        })}
      </ol>

      <div className="proof-player-actions">
        <button
          className="proof-action proof-action-secondary"
          disabled={currentStep === 0}
          type="button"
          onClick={handlePreviousButtonClick}
        >
          ← 上一步
        </button>
        <button
          aria-label="重置证明"
          className="proof-reset"
          disabled={currentStep === 0}
          type="button"
          onClick={handleResetButtonClick}
        >
          ↺
        </button>
        <button
          className="proof-action proof-action-primary"
          disabled={currentStep === recipe.steps.length}
          type="button"
          onClick={handleNextButtonClick}
        >
          下一步 →
        </button>
      </div>
    </div>
  );
};
