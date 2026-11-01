import { createContext, useContext } from "react";
import { createStore, useStore, type StoreApi } from "zustand";

import {
  createTheoryLibraryPageSlice,
  type TheoryLibraryPageSlice,
  type TheoryLibraryPageStoreOptions,
} from "./theoryLibraryPageSlice";

export type TheoryLibraryPageStore = TheoryLibraryPageSlice;
export type TheoryLibraryPageStoreApi = StoreApi<TheoryLibraryPageStore>;

export const createTheoryLibraryPageStore = (options: TheoryLibraryPageStoreOptions) =>
  createStore<TheoryLibraryPageStore>()((...arguments_) => ({
    ...createTheoryLibraryPageSlice(options)(...arguments_),
  }));

export const TheoryLibraryPageStoreContext = createContext<TheoryLibraryPageStoreApi | null>(null);

export const useTheoryLibraryPageStore = <Selected>(
  selector: (store: TheoryLibraryPageStore) => Selected
) => {
  const store = useContext(TheoryLibraryPageStoreContext);

  if (!store) {
    throw new Error("useTheoryLibraryPageStore must be used inside TheoryLibraryPageStoreProvider");
  }

  return useStore(store, selector);
};
