import { recipeCatalog } from "@repo/schemas";
import { createFileRoute } from "@tanstack/react-router";

import { SimulatorPage } from "@/pages/SimulatorPage";

interface SimulatorSearch {
  recipe?: string;
}

export const Route = createFileRoute("/simulator")({
  component: () => {
    const { recipe } = Route.useLoaderData();

    return <SimulatorPage key={recipe.id} recipe={recipe} />;
  },
  validateSearch: (search): SimulatorSearch => ({
    recipe: typeof search.recipe === "string" ? search.recipe : undefined,
  }),
  loaderDeps: ({ search }) => ({ recipeId: search.recipe }),
  loader: ({ deps }) => ({
    recipe: recipeCatalog.find(({ id }) => id === deps.recipeId) ?? recipeCatalog[0],
  }),
});
