// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { AppShell } from "../AppShell";
import { createRecipeProofPageStore } from "@/pages/RecipeProofPage/_store/recipeProofPageStore";
import { WorkspaceHeader } from "./WorkspaceHeader";
afterEach(() => {
  cleanup();
  vi.clearAllMocks();
  vi.unstubAllGlobals();
});
it("places six icon controls in one capsule and preserves disabled states and callbacks", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const pageStore = createRecipeProofPageStore({ lastStep: 2, initialTheoremName: "" });
  const actions = pageStore.getState();
  render(
    <StorybookRouter>
      <AppShell>
        <WorkspaceHeader
          previousDisabled
          nextDisabled={false}
          title="地三鲜"
          onNextButtonClick={actions.handleNextButtonClick}
          onPreviousButtonClick={actions.handlePreviousButtonClick}
          onResetButtonClick={actions.handleResetButtonClick}
        />
      </AppShell>
    </StorybookRouter>
  );
  const toolbar = await screen.findByRole("toolbar", { name: "菜谱操作与布局" });
  expect(within(toolbar).getAllByRole("button")).toHaveLength(6);
  for (const name of ["重置", "上一步", "下一步"]) {
    const button = within(toolbar).getByRole("button", { name });
    expect(button.querySelector("svg")).toBeTruthy();
    expect(button.textContent).toBe("");
  }
  fireEvent.click(within(toolbar).getByRole("button", { name: "上一步" }));
  expect(pageStore.getState().currentStep).toBe(0);
  fireEvent.click(within(toolbar).getByRole("button", { name: "下一步" }));
  expect(pageStore.getState().currentStep).toBe(1);
  fireEvent.click(within(toolbar).getByRole("button", { name: "重置" }));
  expect(pageStore.getState().currentStep).toBe(0);
});
