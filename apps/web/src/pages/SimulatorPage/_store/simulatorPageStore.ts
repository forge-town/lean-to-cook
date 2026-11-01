import { createContext, useContext } from "react";
import { createStore, useStore, type StoreApi } from "zustand";

import {
  createSimulatorPageSlice,
  type SimulatorPageSlice,
  type SimulatorPageStoreOptions,
} from "./simulatorPageSlice";

export type SimulatorPageStore = SimulatorPageSlice;
export type SimulatorPageStoreApi = StoreApi<SimulatorPageStore>;

export const createSimulatorPageStore = (options: SimulatorPageStoreOptions) =>
  createStore<SimulatorPageStore>()((...arguments_) => ({
    ...createSimulatorPageSlice(options)(...arguments_),
  }));

export const SimulatorPageStoreContext = createContext<SimulatorPageStoreApi | null>(null);

export const useSimulatorPageStore = <Selected>(
  selector: (store: SimulatorPageStore) => Selected
) => {
  const store = useContext(SimulatorPageStoreContext);

  if (!store) {
    throw new Error("useSimulatorPageStore must be used inside SimulatorPageStoreProvider");
  }

  return useStore(store, selector);
};
