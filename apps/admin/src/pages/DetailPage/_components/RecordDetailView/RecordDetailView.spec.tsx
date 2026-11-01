import { Refine } from "@refinedev/core";
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { RecordDetailView } from "./RecordDetailView";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureProvider,
  fixtureAuth,
  fixtureRecipe,
} from "../../../../storybook/fixtures";
afterEach(cleanup);
it("opens Lean code without exposing detail form inputs", async () => {
  render(
    <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
      <EditorPageStoreProvider options={editorOptions}>
        <RecordDetailView record={fixtureRecipe} />
      </EditorPageStoreProvider>
    </Refine>,
  );
  expect(screen.getByRole("heading", { name: "番茄炒蛋" })).toBeDefined();
  fireEvent.click(screen.getByRole("tab", { name: "Lean 代码" }));
  const code = await screen.findByLabelText("当前版本 Lean 代码");
  expect(code.textContent).toContain('title := "番茄炒蛋"');
  expect(screen.queryByRole("textbox")).toBeNull();
});
