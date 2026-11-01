import { RecipeLibraryPageContent } from "./RecipeLibraryPageContent";
import { RecipeLibraryPageStoreProvider } from "./_store";

export const RecipeLibraryPage = () => (
  <RecipeLibraryPageStoreProvider>
    <RecipeLibraryPageContent />
  </RecipeLibraryPageStoreProvider>
);
