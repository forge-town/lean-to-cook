import { createFileRoute } from "@tanstack/react-router";
import { EditorPage } from "../../../pages/EditorPage";
const ResourceCreateRoute = () => <EditorPage id="new" resource="ingredients" />;

export const Route = createFileRoute("/_layout/ingredients/new")({
  staticData: { resource: "ingredients", creation: true },
  component: ResourceCreateRoute,
});
