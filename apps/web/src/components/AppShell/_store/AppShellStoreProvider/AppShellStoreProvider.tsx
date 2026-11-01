import { useState, type PropsWithChildren } from "react";
import { AppShellStoreContext, createAppShellStore } from "../appShellStore";
export type AppShellStoreProviderProps = PropsWithChildren;
export const AppShellStoreProvider = ({ children }: AppShellStoreProviderProps) => {
  const [store] = useState(createAppShellStore);

  return <AppShellStoreContext.Provider value={store}>{children}</AppShellStoreContext.Provider>;
};
