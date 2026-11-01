import { AppShellStoreProvider } from "../components/AppShell/_store/AppShellStoreProvider";
import {
  createMemoryHistory,
  createRootRoute,
  createRouter,
  RouterProvider,
} from "@tanstack/react-router";
import { useMemo, type PropsWithChildren } from "react";

export const StorybookRouter = ({ children }: PropsWithChildren) => {
  const router = useMemo(() => {
    const rootRoute = createRootRoute({
      component: () => <AppShellStoreProvider>{children}</AppShellStoreProvider>,
    });

    return createRouter({
      history: createMemoryHistory({ initialEntries: ["/"] }),
      routeTree: rootRoute,
    });
  }, [children]);

  return <RouterProvider router={router} />;
};
