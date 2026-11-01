import { createContext, useContext } from "react";
import { createStore, useStore, type StoreApi } from "zustand";

import {
  createSourceRecipeWorkbenchPageSlice,
  type SourceRecipeWorkbenchPageSlice,
  type SourceRecipeWorkbenchPageStoreOptions,
} from "./sourceRecipeWorkbenchPageSlice";

export type SourceRecipeWorkbenchPageStore = SourceRecipeWorkbenchPageSlice;
export type SourceRecipeWorkbenchPageStoreApi = StoreApi<SourceRecipeWorkbenchPageStore>;

export const createSourceRecipeWorkbenchPageStore = (
  options: SourceRecipeWorkbenchPageStoreOptions
) =>
  createStore<SourceRecipeWorkbenchPageStore>()((...arguments_) => ({
    ...createSourceRecipeWorkbenchPageSlice(options)(...arguments_),
  }));

export const SourceRecipeWorkbenchPageStoreContext =
  createContext<SourceRecipeWorkbenchPageStoreApi | null>(null);

export const useSourceRecipeWorkbenchPageStore = <Selected>(
  selector: (store: SourceRecipeWorkbenchPageStore) => Selected
) => {
  const store = useContext(SourceRecipeWorkbenchPageStoreContext);

  if (!store) {
    throw new Error(
      "useSourceRecipeWorkbenchPageStore must be used inside SourceRecipeWorkbenchPageStoreProvider"
    );
  }

  return useStore(store, selector);
};
