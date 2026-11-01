import { Refine, type DataProvider, type AuthProvider } from "@refinedev/core";
import { dataProvider } from "../../integrations/refine/dataProvider";
import { authProvider } from "../../integrations/refine/authProvider";
import { resources } from "../../lib/resources";
import { RouterProvider } from "@tanstack/react-router";
import { router } from "../../router";
export const AdminApp = ({
  dataSource = dataProvider,
  authentication = authProvider,
  routerInstance = router,
}: {
  dataSource?: DataProvider;
  authentication?: AuthProvider;
  routerInstance?: typeof router;
}) => (
  <Refine
    authProvider={authentication}
    dataProvider={dataSource}
    options={{
      disableTelemetry: true,
      reactQuery: {
        clientConfig: {
          defaultOptions: { queries: { retry: false, refetchOnWindowFocus: false } },
        },
      },
    }}
    resources={[...resources]}
  >
    <RouterProvider router={routerInstance} />
  </Refine>
);
