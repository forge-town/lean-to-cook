import type { CookingAction } from "@repo/schemas";
import type { CookingMethod } from "./kitchenSceneModel";
import type { SourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";
const actionsByMethod: Partial<Record<CookingMethod, CookingAction[]>> = {
  wash: ["wash"],
  cut: ["cut"],
  crush: ["cut"],
  score: ["score"],
  peel: ["peel"],
  heat: ["heat", "add"],
  stirFry: ["stirFry", "add"],
  panFry: ["fry", "add"],
  deepFry: ["fry", "add"],
  boil: ["boil", "add"],
  simmer: ["simmer", "add"],
  braise: ["simmer", "add"],
  reduce: ["reduce"],
  thicken: ["thicken"],
  rest: ["reserve"],
  plate: ["plate", "turnOffHeat"],
  mix: ["mix"],
  coldMix: ["mix"],
  marinate: ["marinate"],
  steam: ["steam"],
  bake: ["bake"],
  airFry: ["airFry"],
  microwave: ["microwave"],
  chill: ["chill"],
  caramelize: ["heat", "mix"],
  warmMix: ["heat", "mix"],
  blend: ["mix"],
  brew: ["brew"],
};
const hotMethods = new Set<CookingMethod>([
  "heat",
  "stirFry",
  "panFry",
  "deepFry",
  "boil",
  "simmer",
  "braise",
  "reduce",
  "thicken",
  "caramelize",
  "warmMix",
  "steam",
  "steamerHeat",
]);
export const buildSourceAnimationContext = (
  model: SourceRecipeWorkbenchModel,
  methods: CookingMethod[],
  ingredientNames: string[],
  matches: (name: string, instruction: string) => boolean
): SourceRecipeWorkbenchModel => {
  if (model.steps.every((step) => step.actions !== undefined)) return model;
  const result = model.steps.reduce<{
    heatOn: boolean;
    steps: SourceRecipeWorkbenchModel["steps"];
  }>(
    (state, step, index) => {
      if (step.actions)
        return { heatOn: step.heatOn ?? state.heatOn, steps: [...state.steps, step] };
      const method = methods[index] ?? "rest";
      const awayFromStove = /碗中|碗里|杯中|杯里|盆中|冷藏|冰箱/u.test(step.instruction);
      const heatOn =
        !/关火|熄火|离火/u.test(step.instruction) &&
        (hotMethods.has(method) || (!awayFromStove && state.heatOn));
      const names =
        method === "blend"
          ? ingredientNames
          : ingredientNames.filter((name) => matches(name, step.instruction));
      const actions = actionsByMethod[method] ?? [];

      return {
        heatOn,
        steps: [...state.steps, { ...step, actions, heatOn, ingredientNames: names }],
      };
    },
    { heatOn: false, steps: [] }
  );

  return { ...model, steps: result.steps };
};
