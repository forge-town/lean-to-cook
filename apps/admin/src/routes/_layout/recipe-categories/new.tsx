import { createFileRoute } from "@tanstack/react-router";
import { EditorPage } from "../../../pages/EditorPage";
const ResourceCreateRoute = () => <EditorPage id="new" resource="recipe-categories" />;

export const Route = createFileRoute("/_layout/recipe-categories/new")({
  staticData: { resource: "recipe-categories", creation: true },
  component: ResourceCreateRoute,
});
