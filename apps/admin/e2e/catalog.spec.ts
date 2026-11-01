import { test, expect, type Page, type APIRequestContext } from "@playwright/test";
import { readFileSync } from "node:fs";
const password = readFileSync(new URL("../../../.env.local", import.meta.url), "utf8").match(
  /^LOCAL_ADMIN_PASSWORD=(.+)$/m,
)![1]!;
const origin = "http://localhost:7202";
const created: { resource: string; id: string }[] = [];
const query = async (request: APIRequestContext, procedure: string, input: object) => {
  const response = await request.get(`/api/trpc/${procedure}`, {
    params: { input: JSON.stringify(input) },
  });
  const body = await response.json();

  return { response, data: body.result?.data };
};
const removeFixture = async (request: APIRequestContext, resource: string, id: string) => {
  const record = await query(request, "catalog.get", { resource, id });
  if (record.response.ok())
    await request.post("/api/trpc/catalog.delete", {
      data: { resource, id, expectedUpdatedAt: record.data.updatedAt },
      headers: { origin },
    });
};
const choose = async (page: Page, label: string, option: string, index = 0) => {
  const control = page.getByRole("combobox", { name: label, exact: true }).nth(index);
  await expect(control).toBeEnabled();
  await control.click();
  await page.getByRole("option", { name: option, exact: true }).click();
};
const editRecord = async (page: Page) => {
  await page.getByRole("banner").getByRole("button", { name: "编辑", exact: true }).click();
  await expect(page.getByRole("dialog")).toBeVisible();
};
const saveRecord = async (page: Page) => {
  await page.getByRole("button", { name: "保存修改", exact: true }).click();
  await expect(page.getByRole("dialog")).toHaveCount(0);
  await expect(
    page.getByRole("banner").getByRole("button", { name: "编辑", exact: true }),
  ).toBeVisible();
};
const remember = async (page: Page, resource: string) => {
  await expect(page).toHaveURL(new RegExp(`/${resource}/[a-f0-9-]{36}`));
  const id = new URL(page.url()).pathname.split("/").at(-1)!;
  created.unshift({ resource, id });

  return id;
};
test.afterEach(async ({ request }) => {
  await request.post("/api/auth/login", { data: { password }, headers: { origin } });
  for (const item of created.splice(0)) await removeFixture(request, item.resource, item.id);
});
test("password login, empty input and incorrect password", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { name: "后台登录" })).toBeVisible();
  await page.getByRole("button", { name: "登录" }).click();
  await expect(page.getByText("请填写管理员密码")).toBeVisible();
  await page.getByLabel("管理员密码", { exact: true }).fill("wrong-password");
  await page.getByRole("button", { name: "登录" }).click();
  await expect(page.getByText("密码不正确", { exact: true })).toBeVisible();
  await page.getByLabel("管理员密码", { exact: true }).fill(password);
  await page.getByRole("button", { name: "登录" }).click();
  await expect(page.getByRole("heading", { name: "菜谱", exact: true })).toBeVisible();
  await expect(page.getByLabel("列表分页", { exact: true })).toContainText("373");
});
test.describe("authenticated catalog", () => {
  test.beforeEach(async ({ page }) => {
    const response = await page.request.post("/api/auth/login", {
      data: { password },
      headers: { origin },
    });
    expect(response.ok()).toBe(true);
  });
  test("search, category filter, pagination and reset", async ({ page }) => {
    await page.goto("/recipes");
    await page.getByRole("link", { name: "下一页", exact: true }).click();
    await expect(page).toHaveURL(/page=2/);
    await page.getByLabel("搜索", { exact: true }).fill("汤");
    await choose(page, "分类", "汤与粥");
    await page.getByRole("button", { name: "筛选", exact: true }).click();
    await expect(page).toHaveURL(/categoryId=/);
    expect(new URL(page.url()).searchParams.get("page")).toBeNull();
    await expect(page.getByRole("table")).toBeVisible();
    const rows = page.getByRole("table").getByRole("row");
    expect(await rows.count()).toBeGreaterThan(1);
    for (const row of await rows.all()) {
      const cells = row.getByRole("cell");
      if ((await cells.count()) > 0) await expect(cells.nth(1)).toHaveText("汤与粥");
    }
    await page.getByRole("link", { name: "清空筛选", exact: true }).click();
    await expect(page.getByLabel("列表分页", { exact: true })).toContainText("373");
  });
  test("ingredient CRUD persists aliases, reports collisions and deletes", async ({ page }) => {
    const name = `验收食材-${Date.now()}`;
    const alias = `别名-${Date.now()}`;
    await page.goto("/ingredients/new");
    await page.getByLabel("名称", { exact: true }).fill(name);
    await page.getByLabel("别名（每行一个）").fill(alias);
    await page.getByLabel("食材说明").fill("仅用于本地自动验收");
    await saveRecord(page);
    const id = await remember(page, "ingredients");
    await page.reload();
    await expect(page.getByRole("heading", { name, exact: true })).toBeVisible();
    await editRecord(page);
    await expect(page.getByLabel("名称", { exact: true })).toHaveValue(name);
    await expect(page.getByLabel("别名（每行一个）")).toHaveValue(alias);
    await page.getByLabel("名称", { exact: true }).fill(name + "更新");
    await saveRecord(page);
    await expect(page.getByRole("heading", { name: name + "更新", exact: true })).toBeVisible();
    await page.goto("/ingredients?q=" + encodeURIComponent(alias));
    await expect(page.getByRole("link", { name: name + "更新", exact: true })).toBeVisible();
    await page.goto("/ingredients/new");
    await page.getByLabel("名称", { exact: true }).fill(alias);
    await page.getByRole("button", { name: "保存修改", exact: true }).click();
    await expect(page.getByRole("alert")).toContainText("名称或别名已被其他食材使用");
    await page.goto(`/ingredients/${id}`);
    await page.getByRole("button", { name: "删除这条记录", exact: true }).click();
    await page.getByRole("button", { name: "确认删除", exact: true }).click();
    await expect(page).toHaveURL(/notice=deleted/);
    expect(
      (await query(page.request, "catalog.get", { resource: "ingredients", id })).response.status(),
    ).toBe(404);
  });
  test("recipe editing, step order, publication and reference protection", async ({ page }) => {
    const name = `验收菜谱-${Date.now()}`;
    await page.goto("/recipes/new");
    await page.getByLabel("菜谱名称", { exact: true }).fill(name);
    await page.getByLabel("原文", { exact: true }).fill("鸡蛋两个");
    await choose(page, "类型", "食材");
    await choose(page, "关联食材", "鸡蛋");
    await page.getByLabel("数量", { exact: true }).fill("2.5");
    await choose(page, "计量单位", "个");
    await page.getByLabel("用量原文", { exact: true }).fill("2.5 个");
    await page.getByLabel("第 1 步", { exact: true }).fill("先打散鸡蛋");
    await page.getByRole("button", { name: "＋ 添加步骤", exact: true }).click();
    await page.getByLabel("第 2 步", { exact: true }).fill("再放进锅里");
    await page.getByRole("button", { name: "上移第 2 步", exact: true }).click();
    await expect(page.getByLabel("第 1 步", { exact: true })).toHaveValue("再放进锅里");
    await page.getByRole("button", { name: "下移第 1 步", exact: true }).click();
    await saveRecord(page);
    const id = await remember(page, "recipes");
    await page.reload();
    await expect(page.getByText("先打散鸡蛋", { exact: true })).toBeVisible();
    expect((await query(page.request, "public.recipe", { id })).response.status()).toBe(404);
    await page.getByRole("button", { name: "发布当前版本", exact: true }).click();
    await expect(page.getByText("已发布", { exact: true })).toBeVisible();
    const published = await query(page.request, "public.recipe", { id });
    expect(published.response.ok()).toBe(true);
    expect(published.data.verification).toBe("not_verified");
    expect(published.data.values.requirements[0].amount).toBe("2.5");
    const ingredientId = published.data.values.requirements[0].ingredientId;
    const current = await query(page.request, "catalog.get", {
      resource: "ingredients",
      id: ingredientId,
    });
    const blocked = await page.request.post("/api/trpc/catalog.delete", {
      headers: { origin },
      data: {
        resource: "ingredients",
        id: ingredientId,
        expectedUpdatedAt: current.data.updatedAt,
      },
    });
    expect(blocked.status()).toBe(409);
    await editRecord(page);
    await page.getByLabel("菜谱名称", { exact: true }).fill(name + "改过");
    await saveRecord(page);
    await expect(page.getByText("修改后未发布", { exact: true })).toBeVisible();
    expect((await query(page.request, "public.recipe", { id })).response.status()).toBe(404);
    await page.getByRole("button", { name: "发布当前版本", exact: true }).click();
    await expect(page.getByText("已发布", { exact: true })).toBeVisible();
    const publicList = await query(page.request, "public.recipes", {
      page: 1,
      pageSize: 25,
      search: name,
    });
    expect(publicList.data.total).toBe(1);
    await page.getByRole("button", { name: "取消发布", exact: true }).click();
    await expect(page.getByText("草稿", { exact: true })).toBeVisible();
    expect((await query(page.request, "public.recipe", { id })).response.status()).toBe(404);
  });
  for (const resource of ["ingredient-categories", "recipe-categories", "units"]) {
    test(`${resource} supports create and rename`, async ({ page }) => {
      const name = `验收字典-${Date.now()}`;
      await page.goto(`/${resource}/new`);
      await page.getByLabel("名称", { exact: true }).fill(name);
      if (resource === "units") {
        await page.getByLabel("单位代码", { exact: true }).fill("test_" + Date.now());
        await choose(page, "度量类型", "计数");
      }
      await saveRecord(page);
      await remember(page, resource);
      await editRecord(page);
      await page.getByLabel("名称", { exact: true }).fill(name + "新");
      await saveRecord(page);
      await expect(page.getByRole("heading", { name: name + "新", exact: true })).toBeVisible();
      await page.reload();
      await expect(page.getByRole("heading", { name: name + "新", exact: true })).toBeVisible();
    });
  }
  test("mobile layout fits the viewport and retains navigation", async ({ page }) => {
    await page.setViewportSize({ width: 390, height: 844 });
    await page.goto("/ingredients");
    await expect(page.getByRole("heading", { name: "食材", exact: true })).toBeVisible();
    await expect(page.getByRole("navigation", { name: "管理菜单" })).toBeVisible();
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(
      390,
    );
    await page.screenshot({
      path: "../../docs/validation/admin/mobile.png",
      fullPage: true,
    });
  });
});
