// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { Workspace } from "./Workspace";
import { AppShellStoreProvider } from "../AppShell/_store/AppShellStoreProvider";
const renderWorkspace = (ui: React.ReactNode) =>
  render(<AppShellStoreProvider>{ui}</AppShellStoreProvider>);
afterEach(cleanup);
it("keeps directory, content and detail in separate accessible panes", () => {
  renderWorkspace(
    <Workspace left={<h2>基础理论</h2>} right={<h2>Lean 代码</h2>}>
      <h1>用量推演</h1>
    </Workspace>
  );
  expect(
    within(screen.getByRole("complementary", { name: "目录" })).getByText("基础理论")
  ).toBeTruthy();
  expect(within(screen.getByRole("region", { name: "工作区" })).getByText("用量推演")).toBeTruthy();
  expect(
    within(screen.getByRole("complementary", { name: "详情面板" })).getByText("Lean 代码")
  ).toBeTruthy();
});
it("omits absent panes for focused pages", () => {
  renderWorkspace(
    <Workspace>
      <h1>菜谱</h1>
    </Workspace>
  );
  expect(screen.queryByRole("complementary")).toBeNull();
});
it("exposes adjustable boundaries and preserves sizes when a pane is toggled", () => {
  const { rerender } = renderWorkspace(
    <Workspace left={<p>目录</p>} right={<p>证明</p>}>
      菜谱
    </Workspace>
  );
  const left = screen.getByRole("separator", { name: "调整目录宽度" });
  const right = screen.getByRole("separator", { name: "调整详情宽度" });
  expect(left.getAttribute("aria-valuenow")).toBe("19");
  fireEvent.keyDown(left, { key: "ArrowRight" });
  expect(left.getAttribute("aria-valuenow")).toBe("20");
  fireEvent.keyDown(right, { key: "ArrowLeft", shiftKey: true });
  expect(right.getAttribute("aria-valuenow")).toBe("30");
  fireEvent.doubleClick(right);
  expect(right.getAttribute("aria-valuenow")).toBe("25");
  rerender(
    <AppShellStoreProvider>
      <Workspace>菜谱</Workspace>
    </AppShellStoreProvider>
  );
  expect(screen.queryByRole("separator")).toBeNull();
  rerender(
    <AppShellStoreProvider>
      <Workspace left={<p>目录</p>}>菜谱</Workspace>
    </AppShellStoreProvider>
  );
  expect(screen.getByRole("separator").getAttribute("aria-valuenow")).toBe("20");
});
