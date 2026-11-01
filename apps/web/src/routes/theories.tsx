import { createFileRoute } from "@tanstack/react-router";
import { TheoryLibraryPage } from "@/pages/TheoryLibraryPage";

export const Route = createFileRoute("/theories")({
  component: TheoryLibraryPage,
});
