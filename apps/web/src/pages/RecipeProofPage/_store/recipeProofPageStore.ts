import { createContext, useContext } from "react";
import { createStore, useStore, type StoreApi } from "zustand";

import {
  createRecipeProofPageSlice,
  type RecipeProofPageSlice,
  type RecipeProofPageStoreOptions,
} from "./recipeProofPageSlice";

export type RecipeProofPageStore = RecipeProofPageSlice;
export type RecipeProofPageStoreApi = StoreApi<RecipeProofPageStore>;

export const createRecipeProofPageStore = (options: RecipeProofPageStoreOptions) =>
  createStore<RecipeProofPageStore>()((...arguments_) => ({
    ...createRecipeProofPageSlice(options)(...arguments_),
  }));

export const RecipeProofPageStoreContext = createContext<RecipeProofPageStoreApi | null>(null);

export const useRecipeProofPageStore = <Selected>(
  selector: (store: RecipeProofPageStore) => Selected
) => {
  const store = useContext(RecipeProofPageStoreContext);

  if (!store) {
    throw new Error("useRecipeProofPageStore must be used inside RecipeProofPageStoreProvider");
  }

  return useStore(store, selector);
};
