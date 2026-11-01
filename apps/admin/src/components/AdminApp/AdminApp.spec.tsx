import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { createMemoryHistory } from "@tanstack/react-router";
import { AdminApp } from "./AdminApp";
import { router } from "../../router";
import { fixtureAuth, fixtureId, fixtureProvider } from "../../storybook/fixtures";
afterEach(cleanup);
it("returns to the matched record after login and removes protected content on logout", async () => {
  const session = { authenticated: false };
  router.update({
    history: createMemoryHistory({ initialEntries: [`/recipes/${fixtureId}`] }),
    scrollRestoration: false,
  });
  render(
    <AdminApp
      authentication={{
        ...fixtureAuth,
        check: async () => ({ authenticated: session.authenticated }),
        login: async () => {
          session.authenticated = true;

          return { success: true };
        },
        logout: async () => {
          session.authenticated = false;

          return { success: true };
        },
      }}
      dataSource={fixtureProvider}
    />,
  );
  expect(await screen.findByRole("heading", { name: "后台登录" })).toBeDefined();
  fireEvent.change(screen.getByLabelText("管理员密码"), { target: { value: "fixture-password" } });
  fireEvent.click(screen.getByRole("button", { name: "登录" }));
  expect(await screen.findByRole("heading", { name: "番茄炒蛋", level: 1 })).toBeDefined();
  expect(router.state.location.pathname).toBe(`/recipes/${fixtureId}`);
  fireEvent.click(screen.getByRole("button", { name: "退出" }));
  expect(await screen.findByRole("heading", { name: "后台登录" })).toBeDefined();
  expect(screen.queryByRole("heading", { name: "番茄炒蛋", level: 1 })).toBeNull();
});
