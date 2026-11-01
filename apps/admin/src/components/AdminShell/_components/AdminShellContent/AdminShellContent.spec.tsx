import { cleanup, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { AdminShellContent } from "./AdminShellContent";
import { AdminShellStoreProvider } from "../../_store";
import { readLocation } from "../../../../lib/resources";
afterEach(cleanup);
it("should place list title and creation in the shared header", () => {
  render(
    <AdminShellStoreProvider logout={async () => ({ success: true })}>
      <AdminShellContent location={readLocation("", "recipes")}>
        <div>结果区域</div>
      </AdminShellContent>
    </AdminShellStoreProvider>,
  );
  const header = screen.getByRole("banner");
  expect(within(header).getByRole("heading", { name: "菜谱" })).toBeDefined();
  expect(within(header).getByRole("link", { name: "＋ 新增菜谱" }).getAttribute("href")).toContain(
    "/recipes/new",
  );
  expect(within(screen.getByRole("main")).queryByRole("heading")).toBeNull();
});
it.each([
  ["recipes", "菜谱", "番茄炒蛋"],
  ["ingredients", "食材", "西红柿"],
  ["recipe-categories", "菜谱分类", "家常菜"],
  ["ingredient-categories", "食材分类", "蔬菜"],
  ["units", "计量单位", "克"],
])("should link the %s parent and identify the current record", (resource, label, recordName) => {
  render(
    <AdminShellStoreProvider logout={async () => ({ success: true })}>
      <AdminShellContent
        location={readLocation("", resource as "recipes", "record")}
        recordName={recordName}
      >
        <div>编辑区域</div>
      </AdminShellContent>
    </AdminShellStoreProvider>,
  );
  const breadcrumb = screen.getByRole("navigation", { name: "面包屑" });
  expect(within(breadcrumb).getByRole("link", { name: label }).getAttribute("href")).toBe(
    `/${resource}`,
  );
  expect(within(breadcrumb).getByText(recordName).getAttribute("aria-current")).toBe("page");
  expect(within(breadcrumb).queryByText("工作台")).toBeNull();
});
it("should keep the new-record location and its navigable parent", () => {
  render(
    <AdminShellStoreProvider logout={async () => ({ success: true })}>
      <AdminShellContent location={readLocation("", "recipes", "new")}>
        <div>新增区域</div>
      </AdminShellContent>
    </AdminShellStoreProvider>,
  );
  const breadcrumb = screen.getByRole("navigation", { name: "面包屑" });
  expect(within(breadcrumb).getByText("新增").getAttribute("aria-current")).toBe("page");
  expect(within(breadcrumb).getByRole("link", { name: "菜谱" }).getAttribute("href")).toBe(
    "/recipes",
  );
});
