// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { PublicCatalog } from "./PublicCatalog";
vi.mock("../../integrations/catalog/dataProvider", () => ({
  publicCatalogDataProvider: { getList: async () => ({ data: [], total: 0 }) },
}));
afterEach(cleanup);
it("renders the public page while ingredient metadata is loading", () => {
  render(
    <PublicCatalog>
      <h1>今日菜谱</h1>
    </PublicCatalog>
  );
  expect(screen.getByRole("heading", { name: "今日菜谱" })).toBeTruthy();
});
