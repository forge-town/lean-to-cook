import { useState, type PropsWithChildren } from "react";

import {
  createRecipeLibraryPageStore,
  RecipeLibraryPageStoreContext,
} from "./recipeLibraryPageStore";

export const RecipeLibraryPageStoreProvider = ({ children }: PropsWithChildren) => {
  const [store] = useState(createRecipeLibraryPageStore);

  return (
    <RecipeLibraryPageStoreContext.Provider value={store}>
      {children}
    </RecipeLibraryPageStoreContext.Provider>
  );
};
