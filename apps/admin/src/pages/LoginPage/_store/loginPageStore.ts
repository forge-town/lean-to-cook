import { createContext, useContext } from "react";
import { createStore, useStore } from "zustand";
import { createLoginPageSlice, type LoginPageSlice } from "./loginPageSlice";
export const createLoginPageStore = (login: Parameters<typeof createLoginPageSlice>[0]) =>
  createStore<LoginPageSlice>()(createLoginPageSlice(login));
export const LoginPageContext = createContext<ReturnType<typeof createLoginPageStore> | null>(null);
export const useLoginPageStore = <T>(selector: (state: LoginPageSlice) => T): T => {
  const store = useContext(LoginPageContext);
  if (!store) throw new Error("LoginPageStoreProvider is required");

  return useStore(store, selector);
};
