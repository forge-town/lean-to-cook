import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { RecordTable } from "./RecordTable";
afterEach(cleanup);
it("links each recipe to its detail and distinguishes a changed publication", () => {
  render(
    <RecordTable
      resource="recipes"
      rows={[
        {
          id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
          name: "番茄炒蛋",
          detail: "家常菜",
          publication: "changed",
          updatedAt: "2026-10-30T00:00:00.000Z",
          usageCount: 0,
        },
      ]}
    />,
  );
  expect(screen.getByRole("link", { name: "番茄炒蛋" }).getAttribute("href")).toContain(
    "/recipes/eebced67",
  );
  expect(screen.getByText("修改后未发布")).toBeDefined();
});
it("shows an actionable empty state", () => {
  render(<RecordTable resource="ingredients" rows={[]} />);
  expect(screen.getByText("还没有食材")).toBeDefined();
});
it("should offer a first-record action inside an empty result table", () => {
  render(<RecordTable resource="ingredients" rows={[]} />);
  expect(screen.getByRole("link", { name: "添加第一条食材" })).toBeDefined();
  expect(screen.getByRole("columnheader", { name: "名称" })).toBeDefined();
});
it("should preserve column headers and contextual reset for filtered emptiness", () => {
  render(<RecordTable filtered resetHref="/recipes?pageSize=50" resource="recipes" rows={[]} />);
  expect(screen.getByRole("columnheader", { name: "名称" })).toBeDefined();
  expect(screen.getByRole("link", { name: "清空筛选" }).getAttribute("href")).toContain(
    "pageSize=50",
  );
  expect(screen.queryByRole("link", { name: "添加第一条菜谱" })).toBeNull();
});
it("should retain the requested row geometry while loading", () => {
  render(<RecordTable loading resource="recipes" rows={[]} skeletonRows={25} />);
  expect(screen.getAllByRole("row")).toHaveLength(26);
  expect(screen.queryByText("还没有菜谱")).toBeNull();
});
