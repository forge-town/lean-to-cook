import { createPortal } from "react-dom";
import type { ReactNode } from "react";
import { useAdminShellStore } from "../AdminShell/_store";
export const HeaderActions = ({ children }: { children: ReactNode }) => {
  const target = useAdminShellStore((s) => s.headerActionsElement);

  return <>{target ? createPortal(children, target) : null}</>;
};
