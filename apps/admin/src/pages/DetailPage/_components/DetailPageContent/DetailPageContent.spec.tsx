import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { DetailPageContent } from "./DetailPageContent";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import { editorOptions, fixtureRecipe, detailFor } from "../../../../storybook/fixtures";
afterEach(cleanup);
it("renders the saved recipe procedure and quantities without form controls", () => {
  render(
    <EditorPageStoreProvider options={editorOptions}>
      <DetailPageContent record={fixtureRecipe} />
    </EditorPageStoreProvider>,
  );
  expect(screen.getByText("打散鸡蛋，加入少许盐。")).toBeDefined();
  expect(screen.getByText("鸡蛋 3 个")).toBeDefined();
  expect(screen.queryByRole("textbox")).toBeNull();
  expect(screen.queryByRole("button", { name: "保存修改" })).toBeNull();
});

it("shows the saved ingredient image without edit controls", () => {
  const record = detailFor("ingredients");
  if (!("aliases" in record.values)) throw new Error("Missing ingredient fixture");
  record.values.imageKey = "tomato";
  render(
    <EditorPageStoreProvider options={{ ...editorOptions, resource: "ingredients", record }}>
      <DetailPageContent record={record} />
    </EditorPageStoreProvider>,
  );
  expect(screen.getByRole("img", { name: record.values.name }).getAttribute("src")).toBe(
    "/api/ingredient-images/tomato.svg",
  );
  expect(screen.queryByRole("button", { name: "选择番茄" })).toBeNull();
});

it("keeps record actions out of the detail body and shows real recipe references", () => {
  const record = detailFor("ingredients");
  record.references = [{ kind: "recipe", id: fixtureRecipe.id, name: "番茄炒蛋", code: null }];
  render(
    <EditorPageStoreProvider options={{ ...editorOptions, resource: "ingredients", record }}>
      <DetailPageContent record={record} />
    </EditorPageStoreProvider>,
  );
  expect(screen.getByRole("link", { name: "番茄炒蛋" }).getAttribute("href")).toBe(
    `/recipes/${fixtureRecipe.id}`,
  );
  expect(screen.queryByRole("button", { name: /删除|发布/ })).toBeNull();
  expect(screen.queryByText("删除后无法恢复。正在使用的记录不能删除。")).toBeNull();
});

it("uses the original ingredient name as a single navigation link when names match", () => {
  const record = structuredClone(fixtureRecipe);
  if (!("requirements" in record.values)) throw new Error("Missing recipe");
  record.values.requirements[0] = {
    ...record.values.requirements[0]!,
    label: "牛奶",
    kind: "ingredient",
    ingredientId: record.id,
  };
  record.references = [{ kind: "ingredient", id: record.id, name: "牛奶", code: null }];
  render(
    <EditorPageStoreProvider options={{ ...editorOptions, record }}>
      <DetailPageContent record={record} />
    </EditorPageStoreProvider>,
  );
  expect(screen.getAllByText("牛奶")).toHaveLength(1);
  expect(screen.getByRole("link", { name: "牛奶" }).getAttribute("href")).toBe(
    `/ingredients/${record.id}`,
  );
});
