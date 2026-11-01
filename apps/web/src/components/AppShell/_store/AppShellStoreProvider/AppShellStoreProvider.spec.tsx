// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { AppShellStoreProvider } from "./AppShellStoreProvider";
afterEach(cleanup);
it("provides the shell boundary without altering its children", () => {
  render(
    <AppShellStoreProvider>
      <h1>菜谱</h1>
    </AppShellStoreProvider>
  );
  expect(screen.getByRole("heading", { name: "菜谱" })).toBeTruthy();
});
