import { useLogout, useOne } from "@refinedev/core";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { recordQueryKey } from "../../integrations/refine/recordCache";
import type { ReactNode } from "react";
import type { AdminLocation } from "../../lib/resources";
import { AdminShellStoreProvider } from "./_store";
import { AdminShellContent } from "./_components/AdminShellContent";
export const AdminShell = ({
  location,
  children,
}: {
  location: AdminLocation;
  children: ReactNode;
}) => {
  const logout = useLogout();
  const record = useOne<CatalogDetail>({
    resource: location.resource,
    id: location.id ?? undefined,
    queryOptions: {
      queryKey: recordQueryKey(location.resource, location.id ?? ""),
      enabled: !!location.id && location.id !== "new",
      refetchOnWindowFocus: false,
      retry: false,
    },
  });
  const values = record.result?.values;
  const recordName = values && ("title" in values ? values.title : values.name);

  return (
    <AdminShellStoreProvider logout={logout.mutateAsync}>
      <AdminShellContent
        location={location}
        logoutFailed={logout.isError}
        recordFailed={record.query.isError}
        recordName={recordName}
      >
        {children}
      </AdminShellContent>
    </AdminShellStoreProvider>
  );
};
