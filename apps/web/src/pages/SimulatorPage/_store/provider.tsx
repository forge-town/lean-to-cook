import { useState, type PropsWithChildren } from "react";

import { createSimulatorPageStore, SimulatorPageStoreContext } from "./simulatorPageStore";
import type { SimulatorPageStoreOptions } from "./simulatorPageSlice";

export const SimulatorPageStoreProvider = ({
  children,
  recipe,
}: PropsWithChildren<SimulatorPageStoreOptions>) => {
  const [store] = useState(() => createSimulatorPageStore({ recipe }));

  return (
    <SimulatorPageStoreContext.Provider value={store}>
      {children}
    </SimulatorPageStoreContext.Provider>
  );
};
