import type { Recipe, SourceRecipe } from "@repo/schemas";

import { RecipeProofPageContent } from "./RecipeProofPageContent";
import { RecipeProofPageStoreProvider } from "./_store";

interface RecipeProofPageProperties {
  markdown: string | undefined;
  recipe: Recipe;
  sourceRecipe: SourceRecipe | undefined;
}

export const RecipeProofPage = ({ markdown, recipe, sourceRecipe }: RecipeProofPageProperties) => {
  const initialTheoremName = recipe.proof.theorems.find((theorem) =>
    theorem.name.includes("amounts")
  )?.name;

  return (
    <RecipeProofPageStoreProvider
      key={recipe.id}
      initialTheoremName={initialTheoremName ?? recipe.proof.theorems[0]?.name ?? ""}
      lastStep={recipe.steps.length}
    >
      <RecipeProofPageContent markdown={markdown} recipe={recipe} sourceRecipe={sourceRecipe} />
    </RecipeProofPageStoreProvider>
  );
};
