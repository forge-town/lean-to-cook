// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { getRecipeById } from "@repo/schemas";
import { RecipeProofPage } from "@/pages/RecipeProofPage/RecipeProofPage";
import { AppShell } from "./AppShell";
afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("provides a shared page menu and preserves a way out of focus mode", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  render(
    <StorybookRouter>
      <AppShell>
        <h1>菜谱</h1>
      </AppShell>
    </StorybookRouter>
  );
  const focus = await screen.findByRole("button", { name: "专注模式" });
  fireEvent.click(focus);
  expect(screen.getByTestId("app-shell").dataset.focus).toBe("true");
  fireEvent.click(screen.getByRole("button", { name: "退出专注模式" }));
  expect(screen.getByTestId("app-shell").dataset.focus).toBe("false");
  fireEvent.click(screen.getByRole("button", { name: "切换页面" }));
  const menuItem = await screen.findByRole("menuitem", { name: "菜谱" });
  expect(menuItem.getAttribute("href")).toBe("/source-recipes");
  expect(screen.getByRole("menuitem", { name: "基础理论" }).getAttribute("href")).toBe("/theories");
});

it("keeps recipe title and live step controls inside the header and removes them on unmount", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = getRecipeById("three-fresh")!;
  const { rerender } = render(
    <StorybookRouter>
      <AppShell>
        <RecipeProofPage markdown={undefined} recipe={recipe} sourceRecipe={undefined} />
      </AppShell>
    </StorybookRouter>
  );
  const header = await screen.findByRole("banner");
  expect(within(header).getByRole("heading", { name: "地三鲜" })).toBeTruthy();
  expect(within(header).getByRole("button", { name: "上一步" })).toHaveProperty("disabled", true);
  fireEvent.click(within(header).getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("kitchen-scene").dataset.step).toBe("1");
  fireEvent.click(within(header).getByRole("button", { name: "重置" }));
  expect(screen.getByTestId("kitchen-scene").dataset.step).toBe("0");
  expect(within(screen.getByRole("main")).queryByRole("button", { name: "下一步" })).toBeNull();
  rerender(
    <StorybookRouter key="theories">
      <AppShell>
        <h1>基础理论</h1>
      </AppShell>
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "基础理论" })).toBeTruthy();
  expect(within(screen.getByRole("banner")).queryByRole("heading", { name: "地三鲜" })).toBeNull();
});
