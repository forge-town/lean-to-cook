import { expect, test } from "@playwright/test";

test.use({
  viewport: { width: 1440, height: 900 },
  video: { mode: "on", size: { width: 1440, height: 900 } },
});

test("the independent homepage leads into the current recipe and proof libraries", async ({
  page,
}) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { name: "做道菜，顺便证明一下。" })).toBeVisible();
  await expect(page.getByTestId("home-opening")).toHaveCount(0);
  await page.getByRole("button", { name: "↺ 重播开场" }).click();
  await page.getByRole("button", { name: "跳过开场" }).click();
  await expect(page.getByTestId("home-opening")).toHaveCount(0);
  await expect(page.getByRole("link", { name: "打开菜谱库" })).toHaveAttribute(
    "href",
    "/source-recipes",
  );
  await page.getByRole("link", { name: "进入证明库" }).click();
  await expect(page).toHaveURL(/\/library$/u);
  await expect(page.getByRole("heading", { name: "把菜谱当作可执行命题。" })).toBeVisible();
  await page.getByRole("link", { name: "返回首页" }).click();
  await expect(page.locator(".cook-home")).toHaveAttribute("data-home-phase", "complete", {
    timeout: 500,
  });
  await expect(page.getByTestId("home-opening")).toHaveCount(0);
});

test("the opening respects reduced motion and links to a real simulator case", async ({ page }) => {
  await page.emulateMedia({ reducedMotion: "reduce" });
  await page.goto("/");
  await expect(page.locator(".cook-home")).toHaveAttribute("data-home-phase", "complete");
  await expect(page.getByTestId("home-opening")).toHaveCount(0);
  await page.getByRole("link", { name: "先试一道西红柿炒鸡蛋" }).click();
  await expect(page.getByTestId("simulator-page")).toBeVisible();
  await expect(page.locator(".simulator-recipe-brief strong")).toHaveText("西红柿炒鸡蛋");
});

test("keyboard navigation can bypass the opening immediately", async ({ page }) => {
  await page.goto("/");
  await page.keyboard.press("Tab");
  await expect(page.getByTestId("home-opening")).toHaveCount(0, { timeout: 500 });
  await expect(page.getByRole("heading", { name: "做道菜，顺便证明一下。" })).toBeVisible();
});

test("the mobile homepage remains usable without horizontal overflow", async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  await page.emulateMedia({ reducedMotion: "reduce" });
  await page.goto("/");
  await expect(page.getByRole("link", { name: "打开菜谱库" })).toBeInViewport();
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth)).toBe(
    true,
  );
  await page.getByRole("link", { name: "打开菜谱库" }).click();
  await expect(page.getByRole("heading", { name: "373 道源菜谱，完整收录。" })).toBeVisible();
});

test("the static homepage stays accessible when JavaScript is disabled", async ({ browser }) => {
  const context = await browser.newContext({ javaScriptEnabled: false });
  const page = await context.newPage();
  await page.goto("/");
  await expect(page.getByRole("heading", { name: "做道菜，顺便证明一下。" })).toBeVisible();
  await expect(page.getByTestId("home-opening")).toBeHidden();
  await page.getByRole("link", { name: "打开菜谱库" }).click();
  await expect(page.getByRole("heading", { name: "373 道源菜谱，完整收录。" })).toBeVisible();
  await context.close();
});
