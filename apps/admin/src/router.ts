import { createRouter } from "@tanstack/react-router";
import type { CatalogResource } from "@repo/schemas/catalog";
import { routeTree } from "./routeTree.gen";
export const router = createRouter({ routeTree, scrollRestoration: true, defaultPreload: false });
declare module "@tanstack/react-router" {
  interface StaticDataRouteOption {
    resource?: CatalogResource;
    creation?: boolean;
  }
}
