import { RecordDeleteDialog } from "./_components/RecordDeleteDialog";
import { useOne, useUpdate, useDelete, useCustomMutation, type HttpError } from "@refinedev/core";
import { useQueryClient } from "@tanstack/react-query";
import type { CatalogDetail, CatalogResource } from "@repo/schemas/catalog";
import { EditorPageStoreProvider } from "../EditorPage/_store";
import { recordQueryKey, syncRecordCache } from "../../integrations/refine/recordCache";
import { RecordDetailView } from "./_components/RecordDetailView";
import { RecordEditDrawer } from "./_components/RecordEditDrawer";
import { Anchor } from "../../components/ui/Anchor";
import { catalogHref } from "../../lib/navigation";
export const DetailPage = ({ resource, id }: { resource: CatalogResource; id: string }) => {
  const query = useOne<CatalogDetail>({
    resource,
    id,
    queryOptions: {
      queryKey: recordQueryKey(resource, id),
      refetchOnWindowFocus: false,
      retry: false,
    },
  });
  const update = useUpdate<CatalogDetail, HttpError, object>();
  const remove = useDelete();
  const publication = useCustomMutation<CatalogDetail>();
  const leanCheck = useCustomMutation();
  const client = useQueryClient();
  const record = query.result;
  if (query.query.isLoading)
    return (
      <div className="loading-state" role="status">
        正在读取记录…
      </div>
    );
  if (!record || query.query.isError)
    return (
      <div className="error-banner" role="alert">
        {query.query.error?.message ?? "这条记录不存在"}
        <Anchor href={catalogHref(resource)}>返回列表</Anchor>
      </div>
    );

  return (
    <EditorPageStoreProvider
      key={`${resource}:${id}`}
      options={{
        resource,
        record,
        save: (values, expectedUpdatedAt) =>
          update.mutateAsync({ resource, id, values, meta: { expectedUpdatedAt } }),
        remove: (expectedUpdatedAt) =>
          remove.mutateAsync({ resource, id, meta: { expectedUpdatedAt } }),
        publication: (action, expectedUpdatedAt) =>
          publication.mutateAsync({
            url: action,
            method: "post",
            values: { resource, id, expectedUpdatedAt },
          }),
        verifyLean: async () => {
          const result = await leanCheck.mutateAsync({
            url: "lean/check",
            method: "post",
            values: { resource, id },
          });
          await Promise.all([
            client.invalidateQueries({ queryKey: ["catalog-lean", resource, id] }),
            client.invalidateQueries({ queryKey: recordQueryKey(resource, id) }),
          ]);

          return result;
        },
        onRecordChange: (updated) => syncRecordCache(client, updated),
      }}
    >
      <RecordEditDrawer
        mutationPending={
          update.mutation.isPending ||
          remove.mutation.isPending ||
          publication.mutation.isPending ||
          leanCheck.mutation.isPending
        }
        record={record}
        resource={resource}
      >
        <RecordDetailView checking={leanCheck.mutation.isPending} record={record} />
      </RecordEditDrawer>
      <RecordDeleteDialog busy={remove.mutation.isPending} record={record} />
    </EditorPageStoreProvider>
  );
};
