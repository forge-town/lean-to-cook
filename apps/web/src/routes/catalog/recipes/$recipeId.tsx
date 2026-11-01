import { ClientOnly, createFileRoute } from "@tanstack/react-router";
import { PublishedRecipePage } from "../../../pages/PublishedRecipePage";
export const Route = createFileRoute("/catalog/recipes/$recipeId")({
  component: () => {
    const { recipeId } = Route.useParams();

    return (
      <ClientOnly
        fallback={
          <p className="p-6" role="status">
            正在读取菜谱…
          </p>
        }
      >
        <PublishedRecipePage id={recipeId} />
      </ClientOnly>
    );
  },
});
