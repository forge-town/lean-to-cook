import { createFileRoute } from "@tanstack/react-router";
import { EditorPage } from "../../../pages/EditorPage";
const ResourceCreateRoute = () => <EditorPage id="new" resource="ingredient-categories" />;

export const Route = createFileRoute("/_layout/ingredient-categories/new")({
  staticData: { resource: "ingredient-categories", creation: true },
  component: ResourceCreateRoute,
});
