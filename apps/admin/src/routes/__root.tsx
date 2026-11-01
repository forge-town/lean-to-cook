import { createRootRoute, Outlet } from "@tanstack/react-router";
import { RouteNotFound } from "../components/RouteNotFound";
export const Route = createRootRoute({ component: Outlet, notFoundComponent: RouteNotFound });
