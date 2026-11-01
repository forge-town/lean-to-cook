import { createContext, useContext } from "react";
import { createStore, useStore } from "zustand";
import { createAdminShellSlice, type AdminShellSlice } from "./adminShellSlice";
export const createAdminShellStore = (logout: Parameters<typeof createAdminShellSlice>[0]) =>
  createStore<AdminShellSlice>()(createAdminShellSlice(logout));
export const AdminShellContext = createContext<ReturnType<typeof createAdminShellStore> | null>(
  null,
);
export const useAdminShellStore = <T>(selector: (state: AdminShellSlice) => T): T => {
  const store = useContext(AdminShellContext);
  if (!store) throw new Error("AdminShellStoreProvider is required");

  return useStore(store, selector);
};
