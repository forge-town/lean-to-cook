import { describe, expect, it, vi } from "vitest";
import { okAsync } from "neverthrow";
import { CatalogService } from "@repo/services";
import { appRouter } from "./router";
vi.mock("@repo/services", () => ({
  CatalogService: {
    assignIngredientImages: vi.fn(),
    getLean: vi.fn(),
    checkLean: vi.fn(),
    listIngredients: vi.fn(),
    list: vi.fn(),
    get: vi.fn(),
    save: vi.fn(),
    remove: vi.fn(),
    publish: vi.fn(),
    unpublish: vi.fn(),
    getPublic: vi.fn(),
  },
}));
const listInput = { resource: "recipes" as const, page: 1, pageSize: 25, search: "" };
describe("catalog authorization", () => {
  it("rejects anonymous management reads and mutations before reaching services", async () => {
    const caller = appRouter.createCaller({ authenticated: false });
    await expect(caller.catalog.list(listInput)).rejects.toMatchObject({ code: "UNAUTHORIZED" });
    await expect(
      caller.catalog.delete({
        resource: "recipes",
        id: crypto.randomUUID(),
        expectedUpdatedAt: new Date().toISOString(),
      }),
    ).rejects.toMatchObject({ code: "UNAUTHORIZED" });
    expect(CatalogService.list).not.toHaveBeenCalled();
    expect(CatalogService.remove).not.toHaveBeenCalled();
  });
  it("permits authenticated list reads and validates pagination", async () => {
    vi.mocked(CatalogService.list).mockReturnValue(okAsync({ data: [], total: 0 }));
    const caller = appRouter.createCaller({ authenticated: true });
    expect(await caller.catalog.list(listInput)).toEqual({ data: [], total: 0 });
    await expect(caller.catalog.list({ ...listInput, pageSize: 1000 })).rejects.toMatchObject({
      code: "BAD_REQUEST",
    });
  });
});

it("exposes presentation reads publicly but protects one-click image writes", async () => {
  const caller = appRouter.createCaller({ authenticated: false });
  vi.mocked(CatalogService.listIngredients).mockReturnValue(okAsync([]));
  expect(await caller.public.ingredients()).toEqual([]);
  await expect(caller.catalog.assignIngredientImages()).rejects.toMatchObject({
    code: "UNAUTHORIZED",
  });
  expect(CatalogService.assignIngredientImages).not.toHaveBeenCalled();
  vi.mocked(CatalogService.assignIngredientImages).mockReturnValue(okAsync({ updated: 2 }));
  expect(
    await appRouter.createCaller({ authenticated: true }).catalog.assignIngredientImages(),
  ).toEqual({ updated: 2 });
});

it("protects Lean reads and compilation and limits identities to supported resources", async () => {
  const identity = { resource: "recipes" as const, id: crypto.randomUUID() };
  const anonymous = appRouter.createCaller({ authenticated: false });
  await expect(anonymous.catalog.lean(identity)).rejects.toMatchObject({ code: "UNAUTHORIZED" });
  await expect(anonymous.catalog.checkLean(identity)).rejects.toMatchObject({
    code: "UNAUTHORIZED",
  });
  expect(CatalogService.getLean).not.toHaveBeenCalled();
  expect(CatalogService.checkLean).not.toHaveBeenCalled();
  const authenticated = appRouter.createCaller({ authenticated: true });
  await expect(
    // @ts-expect-error Deliberately invalid resource at the external boundary.
    authenticated.catalog.checkLean({ ...identity, resource: "units" }),
  ).rejects.toMatchObject({ code: "BAD_REQUEST" });
  expect(CatalogService.checkLean).not.toHaveBeenCalled();
});
