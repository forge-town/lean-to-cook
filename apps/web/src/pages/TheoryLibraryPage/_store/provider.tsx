import { useState, type PropsWithChildren } from "react";

import {
  createTheoryLibraryPageStore,
  TheoryLibraryPageStoreContext,
} from "./theoryLibraryPageStore";
import type { TheoryLibraryPageStoreOptions } from "./theoryLibraryPageSlice";

export const TheoryLibraryPageStoreProvider = ({
  children,
  initialTheoryId,
  lastStageByTheoryId,
}: PropsWithChildren<TheoryLibraryPageStoreOptions>) => {
  const [store] = useState(() =>
    createTheoryLibraryPageStore({ initialTheoryId, lastStageByTheoryId })
  );

  return (
    <TheoryLibraryPageStoreContext.Provider value={store}>
      {children}
    </TheoryLibraryPageStoreContext.Provider>
  );
};
