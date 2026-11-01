import type { Recipe } from "./domain/Recipe.schema";

interface RecipeFlowValidation {
  errors: string[];
  valid: boolean;
}

export const validateRecipeFlow = (recipe: Recipe): RecipeFlowValidation => {
  const errors: string[] = [];
  const ingredientIds = new Set<string>();
  const state = new Set(recipe.initialState);

  for (const ingredient of recipe.ingredients) {
    if (ingredientIds.has(ingredient.id)) {
      errors.push(`Duplicate ingredient id: ${ingredient.id}`);
    }

    ingredientIds.add(ingredient.id);
  }

  for (const [index, step] of recipe.steps.entries()) {
    const expectedSequence = index + 1;

    if (step.sequence !== expectedSequence) {
      errors.push(
        `${step.id} has sequence ${step.sequence}; expected ${expectedSequence}`,
      );
    }

    for (const ingredientId of step.inputs) {
      if (!ingredientIds.has(ingredientId)) {
        errors.push(`${step.id} uses undeclared ingredient: ${ingredientId}`);
      }
    }

    for (const predicate of step.requires) {
      if (!state.has(predicate)) {
        errors.push(`${step.id} requires unavailable state: ${predicate}`);
      }
    }

    for (const effect of step.effects) {
      if (effect.value) {
        state.add(effect.predicate);
      } else {
        state.delete(effect.predicate);
      }
    }
  }

  return { errors, valid: errors.length === 0 };
};
