import { createFileRoute } from "@tanstack/react-router";
import { EditorPage } from "../../../pages/EditorPage";
const ResourceCreateRoute = () => <EditorPage id="new" resource="units" />;

export const Route = createFileRoute("/_layout/units/new")({
  staticData: { resource: "units", creation: true },
  component: ResourceCreateRoute,
});
