import {
  recipeCatalog,
  sourceRecipeCatalog,
  type Recipe,
  type RecipeCategory,
  type SourceRecipe,
} from "@repo/schemas";

export const sourceRecipeCategoryOrder: RecipeCategory[] = [
  "vegetable",
  "meat",
  "aquatic",
  "breakfast",
  "staple",
  "semiFinished",
  "soup",
  "drink",
  "condiment",
  "dessert",
];

export const sourceRecipeCategoryLabels = {
  aquatic: "水产",
  breakfast: "早餐",
  condiment: "调味料",
  dessert: "甜品",
  drink: "饮料",
  meat: "荤菜",
  semiFinished: "半成品",
  soup: "汤粥",
  staple: "主食",
  vegetable: "素菜",
} as const satisfies Record<RecipeCategory, string>;

const getSourcePath = (recipe: Recipe) => {
  const marker = `/blob/${recipe.source.commit}/`;
  const sourcePath = recipe.source.url.split(marker)[1];

  return sourcePath ? decodeURI(sourcePath) : undefined;
};

const formalizedRecipeBySourcePath = new Map(
  recipeCatalog.flatMap((recipe) => {
    const sourcePath = getSourcePath(recipe);

    return sourcePath ? [[sourcePath, recipe] as const] : [];
  })
);

const sourceRecipeBySourcePath = new Map(
  sourceRecipeCatalog.map((sourceRecipe) => [sourceRecipe.sourcePath, sourceRecipe] as const)
);

export const getFormalizedRecipe = (sourceRecipe: SourceRecipe) =>
  formalizedRecipeBySourcePath.get(sourceRecipe.sourcePath);

export const getSourceRecipeCertificateTier = (sourceRecipe: SourceRecipe) =>
  getFormalizedRecipe(sourceRecipe) ? "deep" : "structural";

export const getSourceRecipeLeanDeclaration = (sourceRecipe: SourceRecipe) =>
  `recipe_${sourceRecipe.id}`;

export const getSourceRecipeKernelTheorem = (sourceRecipe: SourceRecipe) =>
  `${getSourceRecipeLeanDeclaration(sourceRecipe)}_kernel_certificate`;

export const getSourceRecipeForRecipe = (recipe: Recipe) => {
  const sourcePath = getSourcePath(recipe);

  return sourcePath ? sourceRecipeBySourcePath.get(sourcePath) : undefined;
};
