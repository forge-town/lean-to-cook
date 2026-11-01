import { useState, type PropsWithChildren } from "react";

import {
  createSourceRecipeWorkbenchPageStore,
  SourceRecipeWorkbenchPageStoreContext,
} from "./sourceRecipeWorkbenchPageStore";
import type { SourceRecipeWorkbenchPageStoreOptions } from "./sourceRecipeWorkbenchPageSlice";

export const SourceRecipeWorkbenchPageStoreProvider = ({
  children,
  lastStep,
}: PropsWithChildren<SourceRecipeWorkbenchPageStoreOptions>) => {
  const [store] = useState(() => createSourceRecipeWorkbenchPageStore({ lastStep }));

  return (
    <SourceRecipeWorkbenchPageStoreContext.Provider value={store}>
      {children}
    </SourceRecipeWorkbenchPageStoreContext.Provider>
  );
};
