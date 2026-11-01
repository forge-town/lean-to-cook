import { cleanup, fireEvent, render, screen, waitFor, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { Refine } from "@refinedev/core";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { RecordDeleteDialog } from "./RecordDeleteDialog";
import { RecordEditDrawer } from "../RecordEditDrawer";
import { AdminShell } from "../../../../components/AdminShell";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureRecipe,
  detailFor,
  fixtureProvider,
  fixtureAuth,
  recipeLocation,
} from "../../../../storybook/fixtures";
const setup = (record: CatalogDetail, remove = vi.fn(async () => ({}))) => {
  render(
    <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
      <AdminShell location={{ ...recipeLocation, resource: record.resource, id: record.id }}>
        <EditorPageStoreProvider
          options={{ ...editorOptions, record, resource: record.resource, remove }}
        >
          <RecordEditDrawer record={record} resource={record.resource}>
            <div>只读内容</div>
          </RecordEditDrawer>
          <RecordDeleteDialog record={record} />
        </EditorPageStoreProvider>
      </AdminShell>
    </Refine>,
  );

  return remove;
};
afterEach(cleanup);
it("opens a separate confirmation and cancels without deleting", async () => {
  const remove = setup(fixtureRecipe);
  fireEvent.click(await screen.findByRole("button", { name: "删除" }));
  const dialog = await screen.findByRole("dialog", { name: "删除菜谱" });
  expect(within(dialog).getByText("确定删除「番茄炒蛋」？")).toBeDefined();
  expect(remove).not.toHaveBeenCalled();
  fireEvent.click(within(dialog).getByRole("button", { name: "取消" }));
  await waitFor(() => expect(screen.queryByRole("dialog")).toBeNull());
  expect(remove).not.toHaveBeenCalled();
});
it("keeps a deletion failure in the dialog for retry", async () => {
  const remove = vi.fn(async () => {
    throw new Error("记录已经被修改");
  });
  setup(fixtureRecipe, remove);
  fireEvent.click(await screen.findByRole("button", { name: "删除" }));
  const dialog = await screen.findByRole("dialog", { name: "删除菜谱" });
  fireEvent.click(within(dialog).getByRole("button", { name: "删除" }));
  expect(await within(dialog).findByRole("alert")).toHaveProperty("textContent", "记录已经被修改");
  expect(screen.getByRole("dialog")).toBeDefined();
  expect(remove).toHaveBeenCalledOnce();
});
it("shows actual recipe references and blocks deleting an ingredient in use", async () => {
  const record = detailFor("ingredients");
  record.references = [{ kind: "recipe", id: fixtureRecipe.id, name: "番茄炒蛋", code: null }];
  const remove = setup(record);
  fireEvent.click(await screen.findByRole("button", { name: "删除" }));
  const dialog = await screen.findByRole("dialog", { name: "删除食材" });
  expect(within(dialog).getByRole("status").textContent).toContain("已关联 1 道菜谱");
  expect((within(dialog).getByRole("button", { name: "删除" }) as HTMLButtonElement).disabled).toBe(
    true,
  );
  expect(within(dialog).getByRole("link", { name: "番茄炒蛋" }).getAttribute("href")).toBe(
    `/recipes/${fixtureRecipe.id}`,
  );
  expect(remove).not.toHaveBeenCalled();
});
