import { createFileRoute } from "@tanstack/react-router";
import { EditorPage } from "../../../pages/EditorPage";
const ResourceCreateRoute = () => <EditorPage id="new" resource="recipes" />;

export const Route = createFileRoute("/_layout/recipes/new")({
  staticData: { resource: "recipes", creation: true },
  component: ResourceCreateRoute,
});
