import { useCreate, type HttpError } from "@refinedev/core";
import type { CatalogDetail, CatalogResource } from "@repo/schemas/catalog";
import { EditorPageStoreProvider } from "./_store";
import { EditorPageContent } from "./_components/EditorPageContent";
export const EditorPage = ({ resource }: { resource: CatalogResource; id?: string }) => {
  const create = useCreate<CatalogDetail, HttpError, object>();

  return (
    <EditorPageStoreProvider
      key={resource}
      options={{
        resource,
        save: (values) => create.mutateAsync({ resource, values }),
        remove: async () => {
          throw new Error("记录尚未创建");
        },
        publication: async () => {
          throw new Error("记录尚未创建");
        },
      }}
    >
      <EditorPageContent mutationPending={create.mutation.isPending} resource={resource} />
    </EditorPageStoreProvider>
  );
};
