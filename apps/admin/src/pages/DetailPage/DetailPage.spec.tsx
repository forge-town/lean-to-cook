import { cleanup, fireEvent, render, screen, waitFor, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { createMemoryHistory, createRouter } from "@tanstack/react-router";
import type { BaseRecord, DataProvider, UpdateParams } from "@refinedev/core";
import { CatalogDetailSchema } from "@repo/schemas/catalog";
import { AdminApp } from "../../components/AdminApp";
import { routeTree } from "../../routeTree.gen";
import { navigation } from "../../lib/navigation";
import { fixtureAuth, fixtureId, fixtureProvider, fixtureRecipe } from "../../storybook/fixtures";
afterEach(() => {
  cleanup();
  vi.restoreAllMocks();
});
const mountDetail = (provider: DataProvider = fixtureProvider, path = `/recipes/${fixtureId}`) => {
  const router = createRouter({
    routeTree,
    history: createMemoryHistory({ initialEntries: [path] }),
    scrollRestoration: false,
  });
  render(<AdminApp authentication={fixtureAuth} dataSource={provider} routerInstance={router} />);

  return router;
};
it.each([
  ["recipes", "番茄炒蛋"],
  ["ingredients", "西红柿"],
  ["ingredient-categories", "蔬菜"],
  ["recipe-categories", "家常菜"],
  ["units", "克"],
])("opens %s as saved facts without editable fields", async (resource, name) => {
  const router = mountDetail(fixtureProvider, `/${resource}/${fixtureId}?resource=wrong&id=wrong`);
  expect(await screen.findByRole("heading", { name, level: 1 })).toBeDefined();
  const main = screen.getByRole("main");
  expect(within(main).queryByRole("textbox")).toBeNull();
  expect(screen.queryByRole("dialog")).toBeNull();
  expect(within(screen.getByRole("banner")).getByRole("button", { name: "编辑" })).toBeDefined();
  expect(router.state.location.pathname).toBe(`/${resource}/${fixtureId}`);
});
it("discards a cancelled draft and restores focus to the header trigger", async () => {
  const update = vi.spyOn(fixtureProvider, "update");
  mountDetail();
  await screen.findByRole("heading", { name: "番茄炒蛋", level: 1 });
  const edit = within(screen.getByRole("banner")).getByRole("button", { name: "编辑" });
  fireEvent.click(edit);
  const dialog = await screen.findByRole("dialog", { name: "编辑菜谱" });
  fireEvent.change(within(dialog).getByLabelText("菜谱名称"), { target: { value: "尚未保存" } });
  expect(
    within(screen.getByRole("main", { hidden: true })).getByRole("heading", {
      name: "番茄炒蛋",
      hidden: true,
    }),
  ).toBeDefined();
  fireEvent.click(within(dialog).getByRole("button", { name: "取消" }));
  await waitFor(() => expect(screen.queryByRole("dialog")).toBeNull());
  await waitFor(() => expect(document.activeElement).toBe(edit));
  expect(update).not.toHaveBeenCalled();
  fireEvent.click(edit);
  const reopened = await screen.findByRole("dialog", { name: "编辑菜谱" });
  expect((within(reopened).getByLabelText("菜谱名称") as HTMLInputElement).value).toBe("番茄炒蛋");
});
it("keeps the drawer and draft when saving is rejected", async () => {
  mountDetail();
  await screen.findByRole("heading", { name: "番茄炒蛋", level: 1 });
  fireEvent.click(within(screen.getByRole("banner")).getByRole("button", { name: "编辑" }));
  const dialog = await screen.findByRole("dialog", { name: "编辑菜谱" });
  fireEvent.change(within(dialog).getByLabelText("菜谱名称"), {
    target: { value: "保留这份修改" },
  });
  fireEvent.click(within(dialog).getByRole("button", { name: "保存修改" }));
  expect(await within(dialog).findByRole("alert")).toBeDefined();
  expect((within(dialog).getByLabelText("菜谱名称") as HTMLInputElement).value).toBe(
    "保留这份修改",
  );
  expect(screen.getByRole("dialog")).toBe(dialog);
});
it("syncs saved values and optimistic versions in place across consecutive edits", async () => {
  const state = { record: structuredClone(fixtureRecipe) };
  const updateRecord: DataProvider["update"] = async <T extends BaseRecord, V>({
    variables,
    meta,
  }: UpdateParams<V>) => {
    expect(meta?.expectedUpdatedAt).toBe(state.record.updatedAt);
    state.record = CatalogDetailSchema.parse({
      ...state.record,
      values: variables,
      updatedAt:
        state.record.updatedAt === fixtureRecipe.updatedAt
          ? "2026-10-31T01:00:00.000Z"
          : "2026-10-31T02:00:00.000Z",
    });

    return { data: state.record as BaseRecord as T };
  };
  const provider = { ...fixtureProvider, update: updateRecord };
  const update = vi.spyOn(provider, "update");
  const go = vi.spyOn(navigation, "go");
  const router = mountDetail(provider);
  await screen.findByRole("heading", { name: "番茄炒蛋", level: 1 });
  for (const title of ["番茄炒蛋一", "番茄炒蛋二"]) {
    fireEvent.click(within(screen.getByRole("banner")).getByRole("button", { name: "编辑" }));
    const dialog = await screen.findByRole("dialog", { name: "编辑菜谱" });
    fireEvent.change(within(dialog).getByLabelText("菜谱名称"), { target: { value: title } });
    fireEvent.click(within(dialog).getByRole("button", { name: "保存修改" }));
    await waitFor(() => expect(screen.queryByRole("dialog")).toBeNull());
    expect(await screen.findByRole("heading", { name: title, level: 1 })).toBeDefined();
    expect(
      within(screen.getByRole("navigation", { name: "面包屑" })).getByText(title),
    ).toBeDefined();
  }
  expect(update).toHaveBeenCalledTimes(2);
  expect(go).not.toHaveBeenCalled();
  expect(router.state.location.pathname).toBe(`/recipes/${fixtureId}`);
});
