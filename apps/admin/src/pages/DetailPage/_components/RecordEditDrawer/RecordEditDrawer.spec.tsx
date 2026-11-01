import { cleanup, fireEvent, render, screen, waitFor, within } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { Refine } from "@refinedev/core";
import { RecordEditDrawer } from "./RecordEditDrawer";
import { AdminShell } from "../../../../components/AdminShell";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureRecipe,
  fixtureProvider,
  fixtureAuth,
  recipeLocation,
} from "../../../../storybook/fixtures";
afterEach(cleanup);
it.each(["close", "escape"])("closes with %s and discards the draft", async (method) => {
  render(
    <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
      <AdminShell location={{ ...recipeLocation, id: fixtureRecipe.id }}>
        <EditorPageStoreProvider options={editorOptions}>
          <RecordEditDrawer record={fixtureRecipe} resource="recipes">
            <div>只读内容</div>
          </RecordEditDrawer>
        </EditorPageStoreProvider>
      </AdminShell>
    </Refine>,
  );
  fireEvent.click(await screen.findByRole("button", { name: "编辑" }));
  const dialog = await screen.findByRole("dialog", { name: "编辑菜谱" });
  const input = within(dialog).getByLabelText("菜谱名称");
  fireEvent.change(input, { target: { value: "放弃的草稿" } });
  if (method === "close") fireEvent.click(within(dialog).getByRole("button", { name: "关闭编辑" }));
  else fireEvent.keyDown(input, { key: "Escape" });
  await waitFor(() => expect(screen.queryByRole("dialog")).toBeNull());
  fireEvent.click(screen.getByRole("button", { name: "编辑" }));
  const reopened = await screen.findByRole("dialog", { name: "编辑菜谱" });
  expect((within(reopened).getByLabelText("菜谱名称") as HTMLInputElement).value).toBe("番茄炒蛋");
});
