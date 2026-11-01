import { getSourceRecipeById } from "@repo/schemas";
import { createFileRoute, notFound } from "@tanstack/react-router";

import { SourceRecipeWorkbenchPage } from "@/pages/SourceRecipeWorkbenchPage";
import { loadSourceRecipeDocument } from "@/sourceRecipeDocuments";

export const Route = createFileRoute("/source-workbench/$sourceRecipeId")({
  component: () => {
    const { markdown, sourceRecipe } = Route.useLoaderData();

    return <SourceRecipeWorkbenchPage markdown={markdown} sourceRecipe={sourceRecipe} />;
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
