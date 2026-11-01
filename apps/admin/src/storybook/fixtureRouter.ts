import { createRouter, createMemoryHistory } from "@tanstack/react-router";
import { routeTree } from "../routeTree.gen";
export const fixtureRouter = (path = "/recipes") =>
  createRouter({
    routeTree,
    history: createMemoryHistory({ initialEntries: [path] }),
    defaultPreload: false,
  });
