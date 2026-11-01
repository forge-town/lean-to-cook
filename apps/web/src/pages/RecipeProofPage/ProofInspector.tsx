import {
  buildProofTrace,
  resolveRecipeQuantities,
  type MeasurementUnit,
  type Recipe,
} from "@repo/schemas";

import { useRecipeProofPageStore } from "./_store";
import { getProofJudgement, getStateSymbol } from "./proofNotation";

const unitLabels = {
  centimeter: "cm",
  gram: "g",
  milliliter: "ml",
  piece: "个",
  second: "s",
} as const satisfies Record<MeasurementUnit, string>;

const formatQuantity = (
  ingredientId: string,
  quantities: ReturnType<typeof resolveRecipeQuantities>
) => {
  const quantity = quantities[ingredientId];

  if (!quantity) {
    return "—";
  }

  const value = quantity.min === quantity.max ? quantity.min : `${quantity.min}–${quantity.max}`;

  return `${value}${unitLabels[quantity.unit]}`;
};

interface ProofInspectorProperties {
  recipe: Recipe;
}

export const ProofInspector = ({ recipe }: ProofInspectorProperties) => {
  const proofTrace = buildProofTrace(recipe);
  const quantities = resolveRecipeQuantities(recipe, recipe.presentation.defaultContextValue);
  const currentStep = useRecipeProofPageStore((state) => state.currentStep);
  const handleStepButtonClick = useRecipeProofPageStore((state) => state.handleStepButtonClick);
  const handleTheoremButtonClick = useRecipeProofPageStore(
    (state) => state.handleTheoremButtonClick
  );
  const selectedTheoremName = useRecipeProofPageStore((state) => state.selectedTheoremName);
  const currentTraceStep = proofTrace.steps[currentStep - 1];
  const currentState = currentTraceStep?.stateAfter ?? proofTrace.initial;
  const selectedTheoremIndex = Math.max(
    0,
    recipe.proof.theorems.findIndex((theorem) => theorem.name === selectedTheoremName)
  );
  const selectedTheorem = recipe.proof.theorems[selectedTheoremIndex];

  if (!selectedTheorem) {
    return null;
  }

  return (
    <aside aria-label="证明检查器" className="workbench-inspector">
      <div className="inspector-titlebar">
        <strong>Inspector</strong>
        <span>{getStateSymbol(currentState.index)}</span>
      </div>

      <section className="inspector-section inspector-current">
        <p className="inspector-label">Selected transition</p>
        <code className="inspector-judgement">{getProofJudgement(proofTrace, currentStep)}</code>
        <p className="inspector-instruction">
          {currentTraceStep?.instruction ?? "初始厨房状态：食材存在，热源关闭。"}
        </p>
      </section>

      <section className="inspector-section inspector-theorem-playground">
        <div className="inspector-section-heading">
          <p className="inspector-label">Theorem playground</p>
          <span>
            theorem {selectedTheoremIndex + 1}/{recipe.proof.theorems.length}
          </span>
        </div>

        <div aria-label="选择一个定理" className="inspector-theorem-selector" role="group">
          {recipe.proof.theorems.map((theorem, index) => (
            <button
              key={theorem.name}
              aria-pressed={theorem.name === selectedTheorem.name}
              data-theorem={theorem.name}
              type="button"
              onClick={handleTheoremButtonClick}
            >
              <span>{String(index + 1).padStart(2, "0")}</span>
              <code>{theorem.name}</code>
              <i aria-hidden="true">✓</i>
            </button>
          ))}
        </div>

        <article className="inspector-theorem-detail">
          <div className="inspector-theorem-name">
            <span>Selected theorem</span>
            <code>{selectedTheorem.name}</code>
          </div>
          <p>{selectedTheorem.description}</p>
          <code className="inspector-theorem-statement">⊢ {selectedTheorem.statement}</code>

          <div className="inspector-proof-block">
            <span>Premises</span>
            <div className="inspector-proof-premises">
              {selectedTheorem.derivation.premises.map((premise) => (
                <code key={premise}>{premise}</code>
              ))}
            </div>
          </div>

          <div className="inspector-proof-block">
            <span>Reduction / why</span>
            <ol className="inspector-proof-reductions">
              {selectedTheorem.derivation.reductions.map((reduction, index) => (
                <li key={`${reduction.expression}-${index}`}>
                  <span>{index + 1}</span>
                  <div>
                    <code>{reduction.expression}</code>
                    <small>{reduction.reason}</small>
                  </div>
                </li>
              ))}
            </ol>
          </div>

          <div className="inspector-proof-block inspector-proof-conclusion">
            <span>Conclusion</span>
            <code>{selectedTheorem.derivation.conclusion}</code>
          </div>

          <div className="inspector-related-steps">
            <span>Jump to trace</span>
            <div>
              {selectedTheorem.derivation.relatedSteps.map((step) => (
                <button
                  key={step}
                  aria-label={`跳到证明步骤 ${step}`}
                  data-current={step === currentStep}
                  data-step={step}
                  type="button"
                  onClick={handleStepButtonClick}
                >
                  {String(step).padStart(2, "0")}
                </button>
              ))}
            </div>
          </div>
        </article>
      </section>

      <section className="inspector-section">
        <p className="inspector-label">Transition premises</p>
        <div className="inspector-facts">
          {(currentTraceStep?.requires ?? ["true"]).map((predicate) => (
            <code key={predicate}>{predicate}</code>
          ))}
        </div>
      </section>

      <section className="inspector-section">
        <p className="inspector-label">State delta</p>
        <div className="inspector-delta-list">
          {currentTraceStep ? (
            currentTraceStep.effects.map((effect) => (
              <div key={effect.predicate} data-value={effect.value}>
                <span>{effect.value ? "+" : "−"}</span>
                <code>{effect.predicate}</code>
              </div>
            ))
          ) : (
            <div data-value="true">
              <span>≔</span>
              <code>initialKitchen</code>
            </div>
          )}
        </div>
      </section>

      <section className="inspector-section">
        <div className="inspector-section-heading">
          <p className="inspector-label">State projection</p>
          <span>{currentState.predicates.length} facts</span>
        </div>
        <div className="inspector-projection">
          {currentState.predicates.map((predicate) => (
            <code key={predicate}>{predicate}</code>
          ))}
        </div>
      </section>

      <section className="inspector-section">
        <div className="inspector-section-heading">
          <p className="inspector-label">Context</p>
          <span>
            {recipe.presentation.defaultContextValue} {recipe.presentation.contextLabel}
          </span>
        </div>
        <table className="inspector-table">
          <tbody>
            {recipe.ingredients.map((ingredient) => (
              <tr key={ingredient.id}>
                <th scope="row">{ingredient.name}</th>
                <td>{formatQuantity(ingredient.id, quantities)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section className="inspector-section inspector-model">
        <div className="inspector-section-heading">
          <p className="inspector-label">Model</p>
          <span>{recipe.source.commit.slice(0, 8)}</span>
        </div>
        <p>{recipe.proof.modelScope}</p>
      </section>
    </aside>
  );
};
