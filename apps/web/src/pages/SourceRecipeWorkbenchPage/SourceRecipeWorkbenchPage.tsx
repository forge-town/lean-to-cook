import type { SourceRecipe } from "@repo/schemas";

import { SourceRecipeWorkbenchPageStoreProvider } from "./_store";
import { SourceRecipeWorkbenchPageContent } from "./SourceRecipeWorkbenchPageContent";
import { buildSourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";

interface SourceRecipeWorkbenchPageProperties {
  markdown: string;
  sourceRecipe: SourceRecipe;
}

export const SourceRecipeWorkbenchPage = ({
  markdown,
  sourceRecipe,
}: SourceRecipeWorkbenchPageProperties) => {
  const model = buildSourceRecipeWorkbenchModel(markdown);

  return (
    <SourceRecipeWorkbenchPageStoreProvider lastStep={model.steps.length}>
      <SourceRecipeWorkbenchPageContent model={model} sourceRecipe={sourceRecipe} />
    </SourceRecipeWorkbenchPageStoreProvider>
  );
};
