import type { QueryClient } from "@tanstack/react-query";
import type { CatalogDetail, CatalogResource } from "@repo/schemas/catalog";
export const recordQueryKey = (resource: CatalogResource, id: string) =>
  ["catalog-record", resource, id] as const;
export const syncRecordCache = (client: QueryClient, record: CatalogDetail) =>
  client.setQueryData(recordQueryKey(record.resource, record.id), { data: record });
