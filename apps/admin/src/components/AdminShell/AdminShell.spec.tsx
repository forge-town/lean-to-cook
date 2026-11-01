import { Refine } from "@refinedev/core";
import { cleanup, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { AdminShell } from "./AdminShell";
import { AdminApp } from "../AdminApp";
import { DetailPage } from "../../pages/DetailPage";
import { createMemoryHistory } from "@tanstack/react-router";
import { router } from "../../router";
import { readLocation, resources } from "../../lib/resources";
import { fixtureAuth, fixtureId, fixtureProvider } from "../../storybook/fixtures";
afterEach(cleanup);
it("opens an existing record as read-only with a header Edit action", async () => {
  router.update({ history: createMemoryHistory({ initialEntries: [`/recipes/${fixtureId}`] }) });
  render(<AdminApp authentication={fixtureAuth} dataSource={fixtureProvider} />);
  await screen.findByRole("heading", { name: "番茄炒蛋" });
  expect(screen.queryByLabelText("菜谱名称")).toBeNull();
  expect(within(screen.getByRole("banner")).getByRole("button", { name: "编辑" })).toBeDefined();
});
it("should share the record query with the editor and display the fetched title", async () => {
  const dataProvider = { ...fixtureProvider };
  const getOne = vi.spyOn(dataProvider, "getOne");
  render(
    <Refine authProvider={fixtureAuth} dataProvider={dataProvider}>
      <AdminShell location={readLocation("", "recipes", fixtureId)}>
        <DetailPage id={fixtureId} resource="recipes" />
      </AdminShell>
    </Refine>,
  );
  const breadcrumb = within(screen.getByRole("banner")).getByRole("navigation", { name: "面包屑" });
  expect(await within(breadcrumb).findByText("番茄炒蛋")).toBeDefined();
  expect(await screen.findByRole("heading", { name: "番茄炒蛋" })).toBeDefined();
  expect(getOne).toHaveBeenCalledTimes(1);
});
it.each(resources.filter((resource) => resource.name !== "recipes"))(
  "should display the fetched name for $name",
  async ({ name }) => {
    render(
      <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
        <AdminShell location={readLocation("", name, fixtureId)}>
          <div>编辑区域</div>
        </AdminShell>
      </Refine>,
    );
    const breadcrumb = within(screen.getByRole("banner")).getByRole("navigation", {
      name: "面包屑",
    });
    const expectedName =
      name === "ingredients"
        ? "西红柿"
        : name === "units"
          ? "克"
          : name === "recipe-categories"
            ? "家常菜"
            : "蔬菜";
    expect(await within(breadcrumb).findByText(expectedName)).toBeDefined();
  },
);
it.each(["", "&id=new"])("should not fetch a record for list or creation routes (%s)", (id) => {
  const dataProvider = { ...fixtureProvider };
  const getOne = vi.spyOn(dataProvider, "getOne");
  render(
    <Refine authProvider={fixtureAuth} dataProvider={dataProvider}>
      <AdminShell location={readLocation("", "recipes", id ? "new" : null)}>
        <div>页面区域</div>
      </AdminShell>
    </Refine>,
  );
  expect(getOne).not.toHaveBeenCalled();
});
it("should retain a navigable parent when the record cannot be read", async () => {
  render(
    <Refine
      authProvider={fixtureAuth}
      dataProvider={{
        ...fixtureProvider,
        getOne: async () => {
          throw new Error("记录不存在");
        },
      }}
    >
      <AdminShell location={readLocation("", "recipes", fixtureId)}>
        <div>页面区域</div>
      </AdminShell>
    </Refine>,
  );
  const breadcrumb = within(screen.getByRole("banner")).getByRole("navigation", { name: "面包屑" });
  expect(await within(breadcrumb).findByText("读取失败")).toBeDefined();
  expect(within(breadcrumb).getByRole("link", { name: "菜谱" }).getAttribute("href")).toBe(
    "/recipes",
  );
});
