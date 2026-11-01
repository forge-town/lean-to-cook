import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { AssignIngredientImages } from "./AssignIngredientImages";
import { ListPageStoreProvider } from "../../pages/ListPage/_store";
import { readLocation } from "../../lib/resources";
afterEach(cleanup);
it("assigns missing images in one action and reports the actual result", async () => {
  const assignImages = vi.fn().mockResolvedValue(4);
  render(
    <ListPageStoreProvider assignImages={assignImages} location={readLocation("/ingredients")}>
      <AssignIngredientImages />
    </ListPageStoreProvider>,
  );
  fireEvent.click(screen.getByRole("button", { name: "一键配图" }));
  expect(await screen.findByRole("status")).toHaveProperty("textContent", "已为 4 个食材配图");
  expect(assignImages).toHaveBeenCalledTimes(1);
});
it("allows retry after a failure", async () => {
  const assignImages = vi.fn().mockRejectedValueOnce(new Error("Offline")).mockResolvedValueOnce(0);
  render(
    <ListPageStoreProvider assignImages={assignImages} location={readLocation("/ingredients")}>
      <AssignIngredientImages />
    </ListPageStoreProvider>,
  );
  fireEvent.click(screen.getByRole("button", { name: "一键配图" }));
  expect(await screen.findByRole("alert")).toHaveProperty("textContent", "配图失败，请重试");
  fireEvent.click(screen.getByRole("button", { name: "一键配图" }));
  expect(await screen.findByRole("status")).toHaveProperty("textContent", "所有食材已配图");
});
