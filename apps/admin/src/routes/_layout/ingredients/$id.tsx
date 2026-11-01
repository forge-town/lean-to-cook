import { createFileRoute, stripSearchParams } from "@tanstack/react-router";
import { DetailPage } from "../../../pages/DetailPage";
import { CatalogSearchSchema } from "../../../lib/_schemas/CatalogSearch.schema";
const ResourceDetailRoute = () => <DetailPage id={Route.useParams().id} resource="ingredients" />;

export const Route = createFileRoute("/_layout/ingredients/$id")({
  staticData: { resource: "ingredients" },
  search: {
    middlewares: [stripSearchParams({ page: 1, pageSize: 25, q: "", categoryId: "", notice: "" })],
  },
  validateSearch: CatalogSearchSchema,
  component: ResourceDetailRoute,
});
