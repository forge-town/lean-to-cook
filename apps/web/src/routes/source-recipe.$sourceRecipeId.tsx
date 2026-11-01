import { getSourceRecipeById } from "@repo/schemas";
import { createFileRoute, notFound } from "@tanstack/react-router";
import { SourceRecipePage } from "@/pages/SourceRecipePage";
import { loadSourceRecipeDocument } from "@/sourceRecipeDocuments";

export const Route = createFileRoute("/source-recipe/$sourceRecipeId")({
  component: () => {
    const { markdown, sourceRecipe } = Route.useLoaderData();

    return <SourceRecipePage markdown={markdown} sourceRecipe={sourceRecipe} />;
  },
  loader: async ({ params }) => {
    const sourceRecipe = getSourceRecipeById(params.sourceRecipeId);

    if (!sourceRecipe) {
      throw notFound();
    }

    const markdown = await loadSourceRecipeDocument(sourceRecipe.sourcePath);

    if (!markdown) {
      throw notFound();
    }

    return { markdown, sourceRecipe };
  },
});
