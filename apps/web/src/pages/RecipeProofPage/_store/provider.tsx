import { useState, type PropsWithChildren } from "react";

import { createRecipeProofPageStore, RecipeProofPageStoreContext } from "./recipeProofPageStore";
import type { RecipeProofPageStoreOptions } from "./recipeProofPageSlice";

export const RecipeProofPageStoreProvider = ({
  children,
  initialTheoremName,
  lastStep,
}: PropsWithChildren<RecipeProofPageStoreOptions>) => {
  const [store] = useState(() => createRecipeProofPageStore({ initialTheoremName, lastStep }));

  return (
    <RecipeProofPageStoreContext.Provider value={store}>
      {children}
    </RecipeProofPageStoreContext.Provider>
  );
};
