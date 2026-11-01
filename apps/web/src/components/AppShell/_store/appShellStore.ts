import { createContext, useContext } from "react";
import { createStore, useStore } from "zustand";
import { createAppShellSlice, type AppShellSlice } from "./appShellSlice";
import { createPaneResizeSlice, type PaneResizeSlice } from "./paneResizeSlice";
import { createHeaderToolbarSlice, type HeaderToolbarSlice } from "./headerToolbarSlice";
type AppShellStore = AppShellSlice & PaneResizeSlice & HeaderToolbarSlice;
export const createAppShellStore = () =>
  createStore<AppShellStore>()((...args) => ({
    ...createAppShellSlice(...args),
    ...createPaneResizeSlice(...args),
    ...createHeaderToolbarSlice(...args),
  }));
export const AppShellStoreContext = createContext<ReturnType<typeof createAppShellStore> | null>(
  null
);
export const useAppShellStore = <T>(selector: (state: AppShellStore) => T): T => {
  const store = useContext(AppShellStoreContext);
  if (!store) throw new Error("AppShellStoreProvider is required");

  return useStore(store, selector);
};
