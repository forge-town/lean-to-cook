import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { RouteNotFound } from "./RouteNotFound";
afterEach(cleanup);
it("offers a valid route back to the recipe list", () => {
  render(<RouteNotFound />);
  expect(screen.getByRole("heading", { name: "页面不存在" })).toBeDefined();
  expect(screen.getByRole("link", { name: "返回菜谱" }).getAttribute("href")).toBe("/recipes");
});
