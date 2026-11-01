import { createContext, useContext } from "react";
import { createStore, useStore, type StoreApi } from "zustand";

import {
  createRecipeLibraryPageSlice,
  type RecipeLibraryPageSlice,
} from "./recipeLibraryPageSlice";

export type RecipeLibraryPageStore = RecipeLibraryPageSlice;
export type RecipeLibraryPageStoreApi = StoreApi<RecipeLibraryPageStore>;

export const createRecipeLibraryPageStore = () =>
  createStore<RecipeLibraryPageStore>()((...arguments_) => ({
    ...createRecipeLibraryPageSlice(...arguments_),
  }));

export const RecipeLibraryPageStoreContext = createContext<RecipeLibraryPageStoreApi | null>(null);

export const useRecipeLibraryPageStore = <Selected>(
  selector: (store: RecipeLibraryPageStore) => Selected
) => {
  const store = useContext(RecipeLibraryPageStoreContext);

  if (!store) {
    throw new Error("useRecipeLibraryPageStore must be used inside RecipeLibraryPageStoreProvider");
  }

  return useStore(store, selector);
};
