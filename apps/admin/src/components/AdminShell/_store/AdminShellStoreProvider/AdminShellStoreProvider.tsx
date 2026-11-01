import { useState, type ReactNode } from "react";
import { AdminShellContext, createAdminShellStore } from "../adminShellStore";
export const AdminShellStoreProvider = ({
  logout,
  children,
}: {
  logout: Parameters<typeof createAdminShellStore>[0];
  children: ReactNode;
}) => {
  const [store] = useState(() => createAdminShellStore(logout));

  return <AdminShellContext.Provider value={store}>{children}</AdminShellContext.Provider>;
};
