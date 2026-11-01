import { leanFixtureFor } from "./leanFixtures";
import type {
  AuthProvider,
  BaseRecord,
  DataProvider,
  GetListParams,
  CustomParams,
} from "@refinedev/core";
import {
  CatalogDetailSchema,
  CatalogLeanIdentitySchema,
  CatalogResourceSchema,
  type CatalogResource,
  type CatalogRow,
} from "@repo/schemas/catalog";
import { toEditorValues } from "../pages/EditorPage/_lib/editorValues";
import { readLocation } from "../lib/resources";
import type { EditorPageOptions } from "../pages/EditorPage/_store/editorPageSlice";
export const fixtureId = "eebced67-ea7f-4ad4-8d15-938b8b25f6cc";
export const fixtureRecipe = CatalogDetailSchema.parse({
  id: fixtureId,
  resource: "recipes",
  updatedAt: "2026-10-30T00:00:00.000Z",
  values: {
    title: "番茄炒蛋",
    categoryId: null,
    description: "一道常做的家常菜。",
    servings: 2,
    notes: "出锅前尝一下咸淡。",
    requirements: [
      {
        label: "鸡蛋 3 个",
        kind: "unclassified",
        ingredientId: null,
        amount: null,
        unitId: null,
        quantityText: "3 个",
        optional: false,
      },
    ],
    steps: ["打散鸡蛋，加入少许盐。", "炒熟鸡蛋后盛出，再炒番茄，最后拌匀。"],
  },
  source: null,
  references: [],
  publication: "draft",
  verification: "not_verified",
});
export const detailFor = (resource: CatalogResource) =>
  resource === "recipes"
    ? fixtureRecipe
    : CatalogDetailSchema.parse({
        ...fixtureRecipe,
        resource,
        publication: null,
        values:
          resource === "ingredients"
            ? {
                name: "西红柿",
                description: "适合炒菜、煮汤。",
                aliases: ["番茄"],
                categoryId: null,
              }
            : resource === "units"
              ? { name: "克", code: "g", dimension: "mass" }
              : { name: resource === "recipe-categories" ? "家常菜" : "蔬菜" },
      });
export const fixtureRows: CatalogRow[] = [
  {
    id: fixtureId,
    name: "番茄炒蛋",
    detail: "家常菜",
    updatedAt: fixtureRecipe.updatedAt,
    usageCount: 0,
    publication: "draft",
  },
  {
    id: "4a5514f4-0e67-45a1-ac6a-00646c8a8a69",
    name: "香菇炖鸡",
    detail: "荤菜",
    updatedAt: fixtureRecipe.updatedAt,
    usageCount: 0,
    publication: "changed",
  },
];
export const recipeLocation = readLocation("", "recipes");
export const ingredientLocation = readLocation("", "ingredients");
export const editorOptions: EditorPageOptions = {
  resource: "recipes",
  record: fixtureRecipe,
  save: async () => {
    throw new Error("这是组件演示，不会写入数据库");
  },
  remove: async () => {
    throw new Error("这是组件演示，不会删除记录");
  },
  publication: async () => {
    throw new Error("这是组件演示，不会发布内容");
  },
};
export const fixtureEditorValues = toEditorValues("recipes", fixtureRecipe.values);
export const fixtureAuth: AuthProvider = {
  check: async () => ({ authenticated: true }),
  login: async () => ({ success: false, error: new Error("请在实际后台登录") }),
  logout: async () => ({ success: false }),
  onError: async () => ({}),
};
export const fixtureProvider: DataProvider = {
  getApiUrl: () => "/offline-story",
  getList: async <T extends BaseRecord>({ resource }: GetListParams) => {
    const domain = CatalogResourceSchema.parse(resource);
    const detail = detailFor(domain);
    const rows =
      domain === "recipes"
        ? fixtureRows
        : [
            {
              ...fixtureRows[0],
              name: "name" in detail.values ? detail.values.name : "菜谱",
              publication: null,
              detail: domain === "ingredients" ? "番茄 · 蔬菜" : "字典",
              usageCount: 0,
            },
          ];

    return { data: rows as BaseRecord[] as T[], total: rows.length };
  },
  getOne: async <T extends BaseRecord>({ resource }: { resource: string }) => ({
    data: detailFor(resource as CatalogResource) as BaseRecord as T,
  }),
  create: async () => {
    throw new Error("组件演示不写入数据库");
  },
  update: async () => {
    throw new Error("组件演示不写入数据库");
  },
  deleteOne: async () => {
    throw new Error("组件演示不删除数据");
  },
  custom: async <T extends BaseRecord, Q, P>({ url, query }: CustomParams<Q, P>) => {
    if (url === "lean") {
      const domain = CatalogLeanIdentitySchema.parse(query).resource;

      return { data: leanFixtureFor(detailFor(domain)) as BaseRecord as T };
    }
    const domain = CatalogResourceSchema.parse(url.replace("options/", ""));
    const detail = detailFor(domain);
    const name = "name" in detail.values ? detail.values.name : "家常菜";

    return { data: { id: domain, options: [{ ...fixtureRows[0], name }] } as BaseRecord as T };
  },
};
