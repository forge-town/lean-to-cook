import type { BaseRecord, DataProvider, GetOneParams } from "@refinedev/core";
import { createTRPCClient, httpBatchLink } from "@trpc/client";
import type { AppRouter } from "@repo/api/router";
const client = createTRPCClient<AppRouter>({ links: [httpBatchLink({ url: "/api/trpc" })] });
const unsupported = async (): Promise<never> => {
  throw new Error("Public ingredient catalog is read-only");
};
export const publicCatalogDataProvider: DataProvider = {
  getApiUrl: () => "/api/trpc",
  getList: async <T extends BaseRecord>({ resource }: { resource: string }) => {
    if (resource !== "ingredients") return unsupported();
    const rows = await client.public.ingredients.query();

    return { data: rows as BaseRecord[] as T[], total: rows.length };
  },
  getOne: async <T extends BaseRecord>({ resource, id }: GetOneParams) => {
    if (resource !== "recipes") return unsupported();

    return { data: (await client.public.recipe.query({ id: String(id) })) as BaseRecord as T };
  },
  create: unsupported,
  update: unsupported,
  deleteOne: unsupported,
};
