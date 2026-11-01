import { createFileRoute } from "@tanstack/react-router";

import { RecipeLibraryPage } from "@/pages/RecipeLibraryPage/RecipeLibraryPage";

export const Route = createFileRoute("/library")({ component: RecipeLibraryPage });
