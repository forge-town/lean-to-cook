import { cleanup, act, fireEvent, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { Refine } from "@refinedev/core";
import { Sheet } from "@repo/ui/sheet";
import { RecordDetailActions } from "./RecordDetailActions";
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
it("places edit, publication and delete controls in the shared header", async () => {
  const publication = vi.fn(async () => ({ data: fixtureRecipe }));
  const verifyLean = vi.fn(async () => ({}));
  const record = { ...fixtureRecipe, publicPath: "/source-recipe/c8756846df80" };
  render(
    <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
      <AdminShell location={{ ...recipeLocation, id: fixtureRecipe.id }}>
        <EditorPageStoreProvider options={{ ...editorOptions, publication, verifyLean }}>
          <Sheet>
            <RecordDetailActions record={record} />
          </Sheet>
          <div>只读内容</div>
        </EditorPageStoreProvider>
      </AdminShell>
    </Refine>,
  );
  const header = await screen.findByRole("banner");
  expect(within(header).getByRole("button", { name: "编辑" })).toBeDefined();
  expect(within(header).getByRole("button", { name: "删除" })).toBeDefined();
  const frontend = within(header).getByRole("link", { name: "前台菜谱" });
  expect(frontend.getAttribute("href")).toBe("http://localhost:7201/source-recipe/c8756846df80");
  expect(frontend.getAttribute("target")).toBe("_blank");
  await act(async () => {
    fireEvent.click(within(header).getByRole("button", { name: "校验 Lean" }));
  });
  expect(verifyLean).toHaveBeenCalledTimes(1);
  fireEvent.click(within(header).getByRole("button", { name: "发布当前版本" }));
  expect(publication).toHaveBeenCalledWith("publish", fixtureRecipe.updatedAt);
  expect(within(screen.getByRole("main")).queryByRole("button")).toBeNull();
});
