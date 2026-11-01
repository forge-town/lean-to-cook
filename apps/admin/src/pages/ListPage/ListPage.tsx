import { useCustomMutation, useInvalidate } from "@refinedev/core";
import { HeaderActions } from "../../components/HeaderActions";
import { AssignIngredientImages } from "../../components/AssignIngredientImages";
import type { AdminLocation } from "../../lib/resources";
import { ListPageStoreProvider } from "./_store";
import { ListPageContent } from "./_components/ListPageContent";
export const ListPage = ({ location }: { location: AdminLocation }) => {
  const assignment = useCustomMutation<{ updated: number }>();
  const invalidate = useInvalidate();

  return (
    <ListPageStoreProvider
      key={`${location.resource}:${location.page}:${location.pageSize}:${location.search}:${location.categoryId}`}
      assignImages={async () => {
        const response = await assignment.mutateAsync({
          url: "assign-ingredient-images",
          method: "post",
          values: {},
        });
        await invalidate({ resource: "ingredients", invalidates: ["all"] });

        return response.data.updated;
      }}
      location={location}
    >
      {location.resource === "ingredients" && (
        <HeaderActions>
          <AssignIngredientImages />
        </HeaderActions>
      )}
      <ListPageContent location={location} />
    </ListPageStoreProvider>
  );
};
