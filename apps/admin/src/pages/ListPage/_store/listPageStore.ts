import { createContext, useContext } from "react";
import { createStore, useStore } from "zustand";
import { createListPageSlice, type ListPageSlice } from "./listPageSlice";
import type { AdminLocation } from "../../../lib/resources";
export const createListPageStore = (
  location: AdminLocation,
  assignImages?: () => Promise<number>,
) => createStore<ListPageSlice>()(createListPageSlice(location, assignImages));
export const ListPageContext = createContext<ReturnType<typeof createListPageStore> | null>(null);
export const useListPageStore = <T>(selector: (state: ListPageSlice) => T): T => {
  const store = useContext(ListPageContext);
  if (!store) throw new Error("ListPageStoreProvider is required");

  return useStore(store, selector);
};
