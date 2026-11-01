import { createFileRoute } from "@tanstack/react-router";
import { SourceRecipeLibraryPage } from "@/pages/SourceRecipeLibraryPage";

export const Route = createFileRoute("/source-recipes")({
  component: SourceRecipeLibraryPage,
});
