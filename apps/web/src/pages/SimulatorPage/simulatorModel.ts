import { buildProofTrace, type ProofTheorem, type Quantity, type Recipe } from "@repo/schemas";

import type { SourceRecipeWorkbenchModel } from "../SourceRecipeWorkbenchPage/sourceRecipeWorkbenchModel";

const unitLabels = {
  centimeter: "cm",
  gram: "g",
  milliliter: "ml",
  piece: "份",
  second: "s",
} as const;

const countUnits = [
  { pattern: /花椒/u, unit: "粒" },
  { pattern: /香叶|白芷/u, unit: "片" },
  { pattern: /蒜瓣/u, unit: "瓣" },
  { pattern: /茶包/u, unit: "包" },
  { pattern: /葱/u, unit: "根" },
] as const;

const formatQuantity = (quantity: Quantity, name: string) => {
  if (quantity.kind === "derived") {
    return `${quantity.factor} × ${quantity.sourceIngredientId}`;
  }

  const unit =
    quantity.unit === "piece"
      ? (countUnits.find(({ pattern }) => pattern.test(name))?.unit ?? "个")
      : unitLabels[quantity.unit];
  if (quantity.kind === "rangePerServing") {
    return `${quantity.min}–${quantity.max}${unit}`;
  }

  return `${quantity.value}${unit}`;
};

export const buildSimulatorSceneModel = (recipe: Recipe): SourceRecipeWorkbenchModel => {
  const trace = buildProofTrace(recipe);

  return {
    presentationScene: recipe.presentation.scene,
    amounts: recipe.ingredients.map(
      ({ name, quantity, optional }) =>
        `${name}：${formatQuantity(quantity, name)}${optional ? "（可选）" : ""}`
    ),
    ingredients: recipe.ingredients.map(({ name }) => name),
    introduction: [recipe.description],
    steps: recipe.steps.map((step, index) => ({
      actions: step.actions,
      heatOn: trace.steps[index]?.stateAfter.predicates.includes("heat.on"),
      ingredientNames: recipe.ingredients
        .filter(({ id }) => step.inputs.includes(id))
        .map(({ name }) => name),
      id: step.id,
      instruction: step.instruction,
      phase: step.stageTitle,
      sequence: step.sequence,
    })),
    tips: [recipe.proof.modelScope],
  };
};

const isBlockingTheorem = (theorem: ProofTheorem) =>
  theorem.statement.includes("none") ||
  /cannot|reject|premature/u.test(theorem.name.toLocaleLowerCase("en-US"));

export const getSimulatorTheorem = (recipe: Recipe, stepIndex: number, blocked: boolean) => {
  const related = recipe.proof.theorems.filter(({ derivation }) =>
    derivation.relatedSteps.includes(stepIndex)
  );
  const preferred = blocked
    ? (related.find(isBlockingTheorem) ?? recipe.proof.theorems.find(isBlockingTheorem))
    : related.find((theorem) => !isBlockingTheorem(theorem));

  return preferred ?? related[0] ?? recipe.proof.theorems[0];
};
