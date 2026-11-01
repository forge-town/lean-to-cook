import { buildProofTrace, type Recipe } from "@repo/schemas";

import { useRecipeProofPageStore } from "./_store";
import { getProofJudgement } from "./proofNotation";

interface CookingStageProperties {
  recipe: Recipe;
}

export const CookingStage = ({ recipe }: CookingStageProperties) => {
  const proofTrace = buildProofTrace(recipe);
  const currentStep = useRecipeProofPageStore((state) => state.currentStep);
  const currentRecipeStep = recipe.steps[currentStep - 1];
  const currentTraceState = proofTrace.steps[currentStep - 1]?.stateAfter ?? proofTrace.initial;
  const stageTitle = currentRecipeStep?.stageTitle ?? recipe.presentation.initialStageTitle;
  const ensuredPredicates = currentRecipeStep?.effects
    .filter((effect) => effect.value)
    .map((effect) => effect.predicate);

  return (
    <div className="cooking-stage-shell">
      <div className="cooking-stage-toolbar">
        <div aria-hidden="true" className="stage-lights">
          <span />
          <span />
          <span />
        </div>
        <span>KitchenState.eval</span>
        <span>step {String(currentStep).padStart(2, "0")}</span>
      </div>

      <div
        aria-label={`做菜状态动画：${stageTitle}`}
        className="cooking-stage"
        data-action={currentRecipeStep?.formalAction ?? "initial"}
        data-catalog-case={recipe.proof.module === "LeanToCook.CatalogCases.Proofs"}
        data-category={recipe.category}
        data-heating={currentTraceState.predicates.includes("heat.on")}
        data-scene={recipe.presentation.scene}
        data-step={currentStep}
        role="img"
      >
        <div aria-hidden="true" className="stage-window">
          <span />
          <span />
        </div>
        <div aria-hidden="true" className="stage-shelf">
          <span className="stage-jar stage-jar-one" />
          <span className="stage-jar stage-jar-two" />
          <span className="stage-plant" />
        </div>

        <div aria-hidden="true" className="stage-board">
          <span className="stage-tomato-whole" />
          <span className="stage-tomato-shine" />
          <div className="stage-tomato-cubes">
            {Array.from({ length: 7 }, (_, index) => (
              <span key={index} />
            ))}
          </div>
          <span className="stage-knife" />
        </div>

        <div aria-hidden="true" className="stage-wings-board">
          {Array.from({ length: 6 }, (_, index) => (
            <span key={index} />
          ))}
        </div>
        <div aria-hidden="true" className="stage-cola-bottle">
          <span>COLA</span>
        </div>
        <div aria-hidden="true" className="stage-fresh-board">
          <span className="fresh-potato" />
          <span className="fresh-eggplant" />
          <span className="fresh-pepper" />
        </div>
        <div aria-hidden="true" className="stage-fresh-reserve">
          <span className="reserve-potato" />
          <span className="reserve-eggplant" />
          <span className="reserve-pepper" />
        </div>
        <div aria-hidden="true" className="stage-shrimp-board">
          {Array.from({ length: 5 }, (_, index) => (
            <span key={index} />
          ))}
        </div>
        <div aria-hidden="true" className="stage-butter-cube">
          7g
        </div>
        <div aria-hidden="true" className="stage-soup-prep">
          <span className="soup-rib" />
          <span className="soup-corn" />
          <span className="soup-carrot" />
        </div>
        <div aria-hidden="true" className="stage-soup-pot">
          <div className="soup-surface">
            <span />
            <span />
            <span />
          </div>
        </div>
        <div aria-hidden="true" className="stage-fish-board">
          <span className="stage-whole-fish" />
          <span className="stage-fish-score" />
        </div>
        <div aria-hidden="true" className="stage-steamer">
          <span className="stage-steamer-lid" />
          <span className="stage-steamer-fish" />
        </div>

        <div aria-hidden="true" className="stage-catalog-case">
          <div className="stage-catalog-prep">
            <span />
            <span />
            <span />
          </div>
          <div className="stage-catalog-vessel">
            <span className="stage-catalog-food" />
            <span className="stage-catalog-heat" />
            <span className="stage-catalog-steam" />
          </div>
          <div className="stage-catalog-timer">
            <small>{recipe.category}</small>
            <strong>{currentStep === 0 ? "READY" : `0${currentStep} / 04`}</strong>
          </div>
          <div className="stage-catalog-result">
            <span />
            <strong>{recipe.title}</strong>
          </div>
        </div>

        <div aria-hidden="true" className="stage-egg-bowl">
          <span className="stage-egg-liquid" />
          <span className="stage-whisk" />
        </div>

        <div aria-hidden="true" className="stage-egg-shells">
          <span />
          <span />
          <span />
        </div>

        <div aria-hidden="true" className="stage-stove">
          <div className="stage-flame">
            <span />
            <span />
            <span />
          </div>
          <div className="stage-pan">
            <span className="stage-pan-handle" />
            <div className="stage-pan-food stage-pan-egg">
              {Array.from({ length: 5 }, (_, index) => (
                <span key={index} />
              ))}
            </div>
            <div className="stage-pan-food stage-pan-tomato">
              {Array.from({ length: 6 }, (_, index) => (
                <span key={index} />
              ))}
            </div>
            <div className="stage-pan-herbs">
              {Array.from({ length: 5 }, (_, index) => (
                <span key={index} />
              ))}
            </div>
          </div>
          <div className="stage-steam">
            <span />
            <span />
            <span />
          </div>
        </div>

        <div aria-hidden="true" className="stage-reserve-plate">
          <div>
            {Array.from({ length: 4 }, (_, index) => (
              <span key={index} />
            ))}
          </div>
        </div>

        <div aria-hidden="true" className="stage-seasoning">
          <span className="stage-seasoning-lid" />
          <span className="stage-seasoning-grain" />
          <span className="stage-seasoning-grain" />
          <span className="stage-seasoning-grain" />
        </div>

        <div aria-hidden="true" className="stage-final-plate">
          <div className="stage-final-dish">
            {Array.from({ length: 8 }, (_, index) => (
              <span key={index} />
            ))}
          </div>
        </div>

        <span aria-hidden="true" className="stage-counter-edge" />
      </div>

      <div aria-live="polite" className="stage-proof-state">
        <div className="stage-state-heading">
          <span className="stage-state-pulse" />
          <div>
            <p>Current proposition</p>
            <code className="stage-formal-judgement">
              {getProofJudgement(proofTrace, currentStep)}
            </code>
            <h3>{stageTitle}</h3>
          </div>
        </div>

        <p className="stage-instruction">
          {currentRecipeStep?.instruction ?? "所有原始食材存在，热源关闭。选择左侧步骤开始求值。"}
        </p>

        <div className="stage-predicates">
          <div>
            <span>requires</span>
            <code>
              {currentRecipeStep && currentRecipeStep.requires.length > 0
                ? currentRecipeStep.requires.join(" · ")
                : "true"}
            </code>
          </div>
          <div>
            <span>ensures</span>
            <code>{ensuredPredicates?.join(" · ") ?? "initialKitchen"}</code>
          </div>
        </div>
      </div>
    </div>
  );
};
