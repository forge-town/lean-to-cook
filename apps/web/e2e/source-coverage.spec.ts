import { expect, test } from "@playwright/test";

test.describe("COD-376 reproducible HowToCook coverage", () => {
  test("the source library exposes compiled-only coverage and pinned provenance", async ({
    page,
  }) => {
    await page.goto("/source-recipes");

    const coverage = page.getByRole("region", { name: "固定来源的内核覆盖报告" });

    await expect(coverage).toBeVisible();
    await expect(coverage.locator("header > strong")).toContainText("100%");
    await expect(coverage.locator("header > strong")).toHaveAttribute("data-status", "verified");
    await expect(coverage.getByText("已验证", { exact: true })).toBeVisible();
    await expect(coverage.getByText("373", { exact: true })).toBeVisible();
    await expect(coverage.getByText("待补齐", { exact: true })).toBeVisible();
    await expect(coverage.getByText("失败 / 漂移", { exact: true })).toBeVisible();
    await expect(coverage.getByText("308cc8b7", { exact: true })).toBeVisible();
    await expect(coverage).toContainText("Schema 0 · Proof 0");
    await expect(coverage).toContainText("Build 0 · Drift 0 · Duplicate 0");
  });
});

for (const title of [
  "冬瓜桑拿鸡",
  "山药南瓜炖鸡汤",
  "白萝卜丝清汤",
  "滕州菜煎饼",
  "炒土豆和胡萝卜蒸菜",
  "炸洋葱花",
]) {
  test(`the new ${title} recipe has a readable source and executable workbench`, async ({
    page,
  }) => {
    await page.goto("/source-recipes");
    const card = page.locator(".source-recipe-card").filter({
      has: page.getByRole("heading", { name: title, exact: true }),
    });

    await card.getByRole("link", { name: "阅读收录原文 →" }).click();
    await expect(page.getByRole("heading", { name: title, exact: true })).toBeVisible();
    await expect(page.locator(".source-markdown-document")).toContainText("## 操作");
    await expect(page.getByRole("link", { name: "GitHub 固定原文 ↗" })).toHaveAttribute(
      "href",
      /308cc8b7dab1da84b20e7fafdf836a715437f582/u,
    );

    await page.getByRole("link", { name: "打开 Lean 结构证明工作台 →" }).click();
    await expect(page.getByRole("heading", { name: title, exact: true })).toBeVisible();
    await expect(page.locator(".source-workbench-stage-toolbar")).toContainText("step 00");
    await page.getByRole("button", { name: "下一步 →", exact: true }).click();
    await expect(page.locator(".source-workbench-stage-toolbar")).toContainText("step 01");
    await page.getByRole("button", { name: "重置", exact: true }).click();
    await expect(page.locator(".source-workbench-stage-toolbar")).toContainText("step 00");
  });
}
