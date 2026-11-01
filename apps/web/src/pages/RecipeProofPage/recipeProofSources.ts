const sources = import.meta.glob<string>(
  [
    "../../../../../packages/lean-proofs/LeanToCook/Core/Execution.lean",
    "../../../../../packages/lean-proofs/LeanToCook/Recipes/*/*.lean",
    "../../../../../packages/lean-proofs/LeanToCook/CatalogCases/*.lean",
  ],
  { query: "?raw", import: "default", eager: true }
);
const source = (path: string) =>
  sources[`../../../../../packages/lean-proofs/LeanToCook/${path}.lean`] ?? "";
const recipeSource = (name: string) =>
  [
    source("Core/Execution"),
    ...["Model", "Spec", "Proofs"].map((part) => source(`${name}/${part}`)),
  ]
    .map((part) => part.replaceAll(/^import .+\n/gm, ""))
    .join("\n");
const butterShrimpLeanSource = recipeSource("Recipes/ButterShrimp");
const colaWingsLeanSource = recipeSource("Recipes/ColaWings");
const cornRibSoupLeanSource = recipeSource("Recipes/CornRibSoup");
const steamedSeaBassLeanSource = recipeSource("Recipes/SteamedSeaBass");
const threeFreshLeanSource = recipeSource("Recipes/ThreeFresh");
const tomatoEggLeanSource = recipeSource("Recipes/TomatoEgg");
const catalogCasesLeanSource = recipeSource("CatalogCases");

const recipeProofSources: Readonly<Record<string, string>> = {
  "butter-pan-fried-shrimp": butterShrimpLeanSource,
  "cola-chicken-wings": colaWingsLeanSource,
  "corn-rib-soup": cornRibSoupLeanSource,
  "steamed-sea-bass": steamedSeaBassLeanSource,
  "three-fresh": threeFreshLeanSource,
  "tomato-scrambled-eggs": tomatoEggLeanSource,
  "simple-braised-pork": catalogCasesLeanSource,
  "seaweed-egg-drop-soup": catalogCasesLeanSource,
  "microwave-sunny-side-egg": catalogCasesLeanSource,
  "perfect-boiled-egg": catalogCasesLeanSource,
  "egg-fried-rice": catalogCasesLeanSource,
  "zhajiang-noodles": catalogCasesLeanSource,
  "frozen-dumplings": catalogCasesLeanSource,
  "air-fryer-chicken-wings": catalogCasesLeanSource,
  "lemon-water": catalogCasesLeanSource,
  "milk-tea": catalogCasesLeanSource,
  "chili-oil": catalogCasesLeanSource,
  "sweet-sour-sauce": catalogCasesLeanSource,
  "baked-egg-tarts": catalogCasesLeanSource,
  "coffee-coconut-jelly": catalogCasesLeanSource,
};

export const getRecipeProofSource = (recipeId: string) => recipeProofSources[recipeId] ?? "";
