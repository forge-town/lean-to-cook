import type { CookingAction, RecipePresentation } from "@repo/schemas";
import { parseRecipeSourceDocument } from "../RecipeProofPage/recipeSourceDocument";

export interface SourceRecipeWorkbenchStep {
  actions?: CookingAction[];
  ingredientNames?: string[];
  heatOn?: boolean;
  id: string;
  instruction: string;
  phase: string;
  sequence: number;
}

export interface SourceRecipeWorkbenchModel {
  presentationScene?: RecipePresentation["scene"];
  amounts: string[];
  ingredients: string[];
  introduction: string[];
  steps: SourceRecipeWorkbenchStep[];
  tips: string[];
}

export const buildSourceRecipeWorkbenchModel = (markdown: string): SourceRecipeWorkbenchModel => {
  const document = parseRecipeSourceDocument(markdown);
  const ingredientSection = document.sections.find(
    (section) => section.heading === "必备原料和工具"
  );
  const amountSection = document.sections.find((section) => section.heading === "计算");
  const operationSection = document.sections.find((section) => section.heading === "操作");
  const tipSection = document.sections.find((section) => section.heading === "附加内容");
  const stepState = { phase: "烹饪流程", sequence: 0 };
  const steps =
    operationSection?.lines.flatMap((line) => {
      if (line.kind === "subheading") {
        stepState.phase = line.text;

        return [];
      }

      if (line.kind !== "step") {
        return [];
      }

      stepState.sequence += 1;

      return [
        {
          id: `source-step-${String(stepState.sequence).padStart(2, "0")}`,
          instruction: line.text,
          phase: stepState.phase,
          sequence: stepState.sequence,
        },
      ];
    }) ?? [];

  return {
    amounts: amountSection?.lines.map((line) => line.text) ?? [],
    ingredients:
      ingredientSection?.lines.flatMap((line) => (line.kind === "bullet" ? [line.text] : [])) ?? [],
    introduction: document.introduction,
    steps,
    tips: tipSection?.lines.map((line) => line.text) ?? [],
  };
};

export const getSourceRecipeStepLabel = (instruction: string) =>
  instruction
    .split(/[，,。；;！？!?\n]/u)
    .find((part) => part.trim().length > 0)
    ?.trim() ?? "操作";
