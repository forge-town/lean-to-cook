import { useIsAuthenticated } from "@refinedev/core";
import { Outlet, useLocation, useMatches, useParams } from "@tanstack/react-router";
import { readLocation } from "../../lib/resources";
import { AdminShell } from "../AdminShell";
import { LoginPage } from "../../pages/LoginPage";
export const AdminGate = () => {
  const authentication = useIsAuthenticated({ queryOptions: { retry: false } });
  const match = useMatches({ select: (matches) => matches.at(-1) });
  const search = useLocation({ select: (location) => location.searchStr });
  const params = useParams({ strict: false });
  const location = readLocation(
    search,
    match?.staticData.resource ?? "recipes",
    match?.staticData.creation ? "new" : (params.id ?? null),
  );
  if (authentication.isLoading)
    return (
      <div className="loading-state" role="status">
        正在打开后台…
      </div>
    );
  if (!authentication.data?.authenticated) return <LoginPage />;

  return (
    <AdminShell location={location}>
      <Outlet />
    </AdminShell>
  );
};
