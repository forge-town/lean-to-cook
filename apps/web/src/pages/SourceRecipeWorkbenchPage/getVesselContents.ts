import type { SourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";
export const getVesselContents = (model: SourceRecipeWorkbenchModel, currentStepIndex: number) => {
  const contents = new Set<string>();
  for (const step of model.steps.slice(0, currentStepIndex - 1)) {
    const actions = step.actions ?? [];
    if (actions.some((action) => ["remove", "reserve", "transfer", "drain"].includes(action))) {
      for (const name of step.ingredientNames ?? []) contents.delete(name);
      if (
        actions.includes("drain") ||
        (actions.includes("reserve") && step.ingredientNames?.length === 0)
      )
        contents.clear();
    }
    if (
      step.heatOn &&
      actions.some((action) =>
        ["add", "stirFry", "fry", "boil", "simmer", "reduce", "season", "thicken", "mix"].includes(
          action
        )
      ) &&
      !actions.some((action) => ["remove", "reserve", "transfer", "drain"].includes(action))
    ) {
      for (const name of step.ingredientNames ?? []) contents.add(name);
    }
  }

  return contents;
};
