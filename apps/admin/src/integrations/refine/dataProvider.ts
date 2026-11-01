import type {
  BaseRecord,
  DataProvider,
  GetListParams,
  GetOneParams,
  CreateParams,
  UpdateParams,
  DeleteOneParams,
  CustomParams,
} from "@refinedev/core";
import {
  CatalogResourceSchema,
  CatalogWriteSchema,
  CatalogDeleteSchema,
  RecipePublicationInputSchema,
  CatalogLeanIdentitySchema,
} from "@repo/schemas/catalog";
import { catalogHref, navigation } from "../../lib/navigation";
import { trpcClient } from "../trpc/client";
export const dataProvider: DataProvider = {
  getApiUrl: () => "/api/trpc",
  getList: async <T extends BaseRecord>({ resource, pagination, filters }: GetListParams) => {
    const search = filters?.find((filter) => "field" in filter && filter.field === "q");
    const category = filters?.find((filter) => "field" in filter && filter.field === "categoryId");
    const result = await trpcClient.catalog.list.query({
      resource: CatalogResourceSchema.parse(resource),
      page: pagination?.currentPage ?? 1,
      pageSize: pagination?.pageSize ?? 25,
      search: search && "value" in search ? String(search.value) : "",
      categoryId:
        category && "value" in category && category.value ? String(category.value) : undefined,
    });

    const lastPage = Math.max(1, Math.ceil(result.total / (pagination?.pageSize ?? 25)));
    if ((pagination?.currentPage ?? 1) > lastPage) {
      navigation.go(
        catalogHref(CatalogResourceSchema.parse(resource), {
          page: lastPage,
          pageSize: pagination?.pageSize ?? 25,
          q: search && "value" in search ? String(search.value) : "",
          categoryId:
            category && "value" in category && category.value ? String(category.value) : "",
        }),
      );
    }

    return { data: result.data as BaseRecord[] as T[], total: result.total };
  },
  getOne: async <T extends BaseRecord>({ resource, id }: GetOneParams) => ({
    data: (await trpcClient.catalog.get.query({
      resource: CatalogResourceSchema.parse(resource),
      id: String(id),
    })) as BaseRecord as T,
  }),
  create: async <T extends BaseRecord, V = object>({ resource, variables }: CreateParams<V>) => ({
    data: (await trpcClient.catalog.save.mutate(
      CatalogWriteSchema.parse({ resource, id: null, expectedUpdatedAt: null, values: variables }),
    )) as BaseRecord as T,
  }),
  update: async <T extends BaseRecord, V = object>({
    resource,
    id,
    variables,
    meta,
  }: UpdateParams<V>) => ({
    data: (await trpcClient.catalog.save.mutate(
      CatalogWriteSchema.parse({
        resource,
        id: String(id),
        expectedUpdatedAt: meta?.expectedUpdatedAt,
        values: variables,
      }),
    )) as BaseRecord as T,
  }),
  deleteOne: async <T extends BaseRecord, V = object>({
    resource,
    id,
    meta,
  }: DeleteOneParams<V>) => ({
    data: (await trpcClient.catalog.delete.mutate(
      CatalogDeleteSchema.parse({
        resource,
        id: String(id),
        expectedUpdatedAt: meta?.expectedUpdatedAt,
      }),
    )) as BaseRecord as T,
  }),
  custom: async <T extends BaseRecord, Q, P>({ url, payload, query }: CustomParams<Q, P>) => {
    if (url === "lean")
      return {
        data: (await trpcClient.catalog.lean.query(
          CatalogLeanIdentitySchema.parse(query),
        )) as BaseRecord as T,
      };
    if (url === "lean/check")
      return {
        data: (await trpcClient.catalog.checkLean.mutate(
          CatalogLeanIdentitySchema.parse(payload),
        )) as BaseRecord as T,
      };
    if (url === "assign-ingredient-images")
      return {
        data: (await trpcClient.catalog.assignIngredientImages.mutate()) as BaseRecord as T,
      };
    if (url.startsWith("options/")) {
      const resource = CatalogResourceSchema.parse(url.slice("options/".length));
      const first = await trpcClient.catalog.list.query({
        resource,
        page: 1,
        pageSize: 100,
        search: "",
      });
      const pages = await Promise.all(
        Array.from({ length: Math.max(0, Math.ceil(first.total / 100) - 1) }, (_, index) =>
          trpcClient.catalog.list.query({ resource, page: index + 2, pageSize: 100, search: "" }),
        ),
      );

      return {
        data: {
          id: resource,
          options: [...first.data, ...pages.flatMap((page) => page.data)],
        } as BaseRecord as T,
      };
    }
    const input = RecipePublicationInputSchema.parse(payload);
    const data =
      url === "publish"
        ? await trpcClient.catalog.publish.mutate(input)
        : url === "unpublish"
          ? await trpcClient.catalog.unpublish.mutate(input)
          : null;
    if (!data) throw new Error("不支持这个操作");

    return { data: data as BaseRecord as T };
  },
};
