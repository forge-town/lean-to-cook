import { cleanup, fireEvent, render, screen, waitFor } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { Refine } from "@refinedev/core";
import { EditorPageContent } from "./EditorPageContent";
import { EditorPageStoreProvider } from "../../_store";
import { editorOptions, fixtureProvider, fixtureRecipe } from "../../../../storybook/fixtures";
afterEach(cleanup);
it("should show unsaved feedback only while the form differs from the saved record", async () => {
  render(
    <Refine dataProvider={fixtureProvider}>
      <EditorPageStoreProvider options={editorOptions}>
        <EditorPageContent record={fixtureRecipe} resource="recipes" />
      </EditorPageStoreProvider>
    </Refine>,
  );
  expect(screen.queryByText("修改未保存")).toBeNull();
  fireEvent.change(screen.getByLabelText("菜谱名称"), { target: { value: "番茄炒蛋（修改）" } });
  expect(await screen.findByText("修改未保存")).toBeDefined();
  fireEvent.change(screen.getByLabelText("菜谱名称"), { target: { value: "番茄炒蛋" } });
  await waitFor(() => expect(screen.queryByText("修改未保存")).toBeNull());
});
it("should explain fractional servings on blur before saving", async () => {
  render(
    <Refine dataProvider={fixtureProvider}>
      <EditorPageStoreProvider options={editorOptions}>
        <EditorPageContent record={fixtureRecipe} resource="recipes" />
      </EditorPageStoreProvider>
    </Refine>,
  );
  fireEvent.change(screen.getByLabelText("份数"), { target: { value: "1.5" } });
  fireEvent.blur(screen.getByLabelText("份数"));
  expect(await screen.findByText("份数必须是整数")).toBeDefined();
});
it("should reject an entire mixed numeric paste with a readable error", async () => {
  render(
    <Refine dataProvider={fixtureProvider}>
      <EditorPageStoreProvider options={editorOptions}>
        <EditorPageContent record={fixtureRecipe} resource="recipes" />
      </EditorPageStoreProvider>
    </Refine>,
  );
  fireEvent.paste(screen.getByLabelText("份数"), { clipboardData: { getData: () => "123aaa" } });
  expect(await screen.findByText("请只粘贴数字，不要包含文字或其他符号")).toBeDefined();
  expect((screen.getByLabelText("份数") as HTMLInputElement).value).toBe("2");
});
