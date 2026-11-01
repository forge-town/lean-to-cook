import { proofTraceSchema } from "./domain/ProofTrace.schema";
import type { ProofTraceStep } from "./domain/ProofTraceStep.schema";
import type { Recipe } from "./domain/Recipe.schema";

export const buildProofTrace = (recipe: Recipe) => {
  const predicates = new Set(recipe.initialState);
  const steps: ProofTraceStep[] = [];

  for (const step of recipe.steps) {
    const stateBefore = {
      index: step.sequence - 1,
      predicates: [...predicates],
    };

    for (const effect of step.effects) {
      if (effect.value) {
        predicates.add(effect.predicate);
      } else {
        predicates.delete(effect.predicate);
      }
    }

    steps.push({
      effects: step.effects,
      formalAction: step.formalAction,
      instruction: step.instruction,
      numericDerivations: step.numericDerivations ?? [],
      requires: step.requires,
      sequence: step.sequence,
      stateAfter: {
        index: step.sequence,
        predicates: [...predicates],
      },
      stateBefore,
      stepId: step.id,
    });
  }

  return proofTraceSchema.parse({
    initial: {
      index: 0,
      predicates: recipe.initialState,
    },
    steps,
  });
};
