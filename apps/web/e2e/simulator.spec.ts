import { expect, test } from "@playwright/test";

test.describe("COD-377 theorem-driven cooking simulator", () => {
  test("selecting a verified recipe loads a matching initial state and conclusion", async ({
    page,
  }) => {
    await page.goto("/simulator?recipe=three-fresh");

    await expect(page.getByTestId("simulator-page")).toBeVisible();
    await page.getByTestId("recipe-selector").selectOption("steamed-sea-bass");

    await expect(page).toHaveURL(/\/simulator\?recipe=steamed-sea-bass/u);
    await expect(page.locator(".simulator-recipe-brief strong")).toHaveText("清蒸鲈鱼");
    await expect(page.getByTestId("current-step-index")).toHaveText("0");
    await expect(page.getByRole("button", { name: "执行下一步 →" })).toBeEnabled();
    await expect(page.getByTestId("conclusion-panel")).toHaveAttribute("data-state", "verified");
    await expect(page.getByText("fish.present", { exact: true }).first()).toBeVisible();
  });

  test("a failed action preserves state and previous rewinds all three panels", async ({
    page,
  }) => {
    await page.goto("/simulator?recipe=steamed-sea-bass");

    await page.getByRole("button", { name: /执行第 02 步/u }).click();

    await expect(page.getByTestId("current-step-index")).toHaveText("0");
    await expect(page.getByTestId("conclusion-panel")).toHaveAttribute("data-state", "blocked");
    await expect(page.getByTestId("block-reason")).toContainText("aromatics.cut");
    await expect(page.getByTestId("block-reason")).toContainText("状态保持在 S0");

    await page.getByRole("button", { name: "执行下一步 →" }).click();
    await expect(page.getByTestId("current-step-index")).toHaveText("1");
    await expect(page.getByTestId("conclusion-panel")).toHaveAttribute("data-state", "verified");
    await expect(page.getByText("aromatics.cut", { exact: true }).first()).toBeVisible();

    await page.getByRole("button", { name: "← 上一步" }).click();
    await expect(page.getByTestId("current-step-index")).toHaveText("0");
    await expect(page.getByText("鲈鱼、葱姜与蒸锅已经就位", { exact: true })).toBeVisible();
    await expect(page.getByTestId("conclusion-panel")).toHaveAttribute("data-state", "verified");
  });
});
