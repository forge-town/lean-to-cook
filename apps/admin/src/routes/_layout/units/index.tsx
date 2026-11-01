import { createFileRoute, stripSearchParams } from "@tanstack/react-router";
import { ListPage } from "../../../pages/ListPage";
import { readLocation } from "../../../lib/resources";
import { CatalogSearchSchema } from "../../../lib/_schemas/CatalogSearch.schema";
const ResourceListRoute = () => (
  <ListPage
    location={readLocation(
      new URLSearchParams(
        Object.entries(Route.useSearch()).map(([key, value]) => [key, String(value)]),
      ).toString(),
      "units",
    )}
  />
);

export const Route = createFileRoute("/_layout/units/")({
  staticData: { resource: "units" },
  search: {
    middlewares: [stripSearchParams({ page: 1, pageSize: 25, q: "", categoryId: "", notice: "" })],
  },
  validateSearch: CatalogSearchSchema,
  component: ResourceListRoute,
});
