import type { ComponentProps } from "react";
import { SourceRecipePageContent } from "./_components/SourceRecipePageContent";
export type SourceRecipePageProps = ComponentProps<typeof SourceRecipePageContent>;
export const SourceRecipePage = (props: SourceRecipePageProps) => (
  <SourceRecipePageContent {...props} />
);
