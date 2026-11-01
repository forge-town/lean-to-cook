import { useState, type ReactNode } from "react";
import { LoginPageContext, createLoginPageStore } from "../loginPageStore";
export const LoginPageStoreProvider = ({
  login,
  children,
}: {
  login: Parameters<typeof createLoginPageStore>[0];
  children: ReactNode;
}) => {
  const [store] = useState(() => createLoginPageStore(login));

  return <LoginPageContext.Provider value={store}>{children}</LoginPageContext.Provider>;
};
