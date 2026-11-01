import { getRecipeById } from "@repo/schemas";
import { createFileRoute, notFound } from "@tanstack/react-router";
import { RecipeProofPage } from "@/pages/RecipeProofPage";
import { loadSourceRecipeDocument } from "@/sourceRecipeDocuments";
import { getSourceRecipeForRecipe } from "@/sourceRecipePresentation";

export const Route = createFileRoute("/recipes/$recipeId")({
  component: () => {
    const { markdown, recipe, sourceRecipe } = Route.useLoaderData();

    return <RecipeProofPage markdown={markdown} recipe={recipe} sourceRecipe={sourceRecipe} />;
  },
  loader: async ({ params }) => {
    const recipe = getRecipeById(params.recipeId);

    if (!recipe) {
      throw notFound();
    }

    const sourceRecipe = getSourceRecipeForRecipe(recipe);
    const markdown = sourceRecipe
      ? await loadSourceRecipeDocument(sourceRecipe.sourcePath)
      : undefined;

    return { markdown, recipe, sourceRecipe };
  },
});
