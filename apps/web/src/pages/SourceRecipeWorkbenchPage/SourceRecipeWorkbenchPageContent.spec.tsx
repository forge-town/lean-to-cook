// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen, waitFor } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { sourceRecipeCatalog } from "@repo/schemas";
import potatoMarkdown from "../../../../../content/how-to-cook/dishes/vegetable_dish/拔丝土豆/拔丝土豆.md?raw";
import { AppShell } from "@/components/AppShell";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { SourceRecipeWorkbenchPage } from "./SourceRecipeWorkbenchPage";
afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("shows the cooking demonstration at each real potato step, including back and reset", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const sourceRecipe = sourceRecipeCatalog.find((r) => r.id === "4378c05c5f7b")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SourceRecipeWorkbenchPage markdown={potatoMarkdown} sourceRecipe={sourceRecipe} />
      </AppShell>
    </StorybookRouter>
  );
  const scene = await screen.findByTestId("kitchen-scene");
  expect(scene.dataset.method).toBe("prep");
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  await waitFor(() => expect(scene.dataset.method).toBe("deepFry"));
  expect(screen.getByRole("img", { name: "油炸上色，使用宽口炸锅" })).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("caramelize");
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("plate");
  expect(screen.getByRole("img", { name: "拔丝土豆成品构成" })).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: "上一步" }));
  expect(scene.dataset.method).not.toBe("plate");
  fireEvent.click(screen.getByRole("button", { name: "重置" }));
  expect(scene.dataset.method).toBe("prep");
});

it("uses specific instruction labels and does not finish the dish at an intermediate holding step", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const sourceRecipe = sourceRecipeCatalog.find((r) => r.id === "4378c05c5f7b")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SourceRecipeWorkbenchPage markdown={potatoMarkdown} sourceRecipe={sourceRecipe} />
      </AppShell>
    </StorybookRouter>
  );
  const holdButton = await screen.findByRole("button", { name: "3. 取出土豆" });
  expect(screen.queryByRole("button", { name: /烹饪流程/ })).toBeNull();
  expect(screen.getByRole("button", { name: "1. 土豆去皮" })).toBeTruthy();
  expect(screen.getByRole("button", { name: "2. 起锅烧油" })).toBeTruthy();
  fireEvent.click(holdButton);
  expect(holdButton.getAttribute("aria-current")).toBe("step");
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("rest");
  expect(screen.getByRole("img", { name: "暂存备用，使用备料碗" })).toBeTruthy();
  expect(screen.queryByRole("img", { name: "拔丝土豆成品构成" })).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "6. 土豆盛盘" }));
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("plate");
});
