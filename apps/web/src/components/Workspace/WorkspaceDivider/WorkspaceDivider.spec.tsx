// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { WorkspaceDivider } from "./WorkspaceDivider";
import { AppShellStoreProvider } from "../../AppShell/_store/AppShellStoreProvider";
afterEach(cleanup);
it("supports keyboard bounds and Enter reset for a labelled vertical separator", () => {
  render(
    <AppShellStoreProvider>
      <WorkspaceDivider panelId="recipe-directory" side="left" />
    </AppShellStoreProvider>
  );
  const divider = screen.getByRole("separator", { name: "调整目录宽度" });
  expect(divider.getAttribute("aria-controls")).toBe("recipe-directory");
  expect(divider.getAttribute("aria-orientation")).toBe("vertical");
  fireEvent.keyDown(divider, { key: "End" });
  expect(divider.getAttribute("aria-valuenow")).toBe("35");
  fireEvent.keyDown(divider, { key: "ArrowRight" });
  expect(divider.getAttribute("aria-valuenow")).toBe("35");
  fireEvent.keyDown(divider, { key: "Home" });
  expect(divider.getAttribute("aria-valuenow")).toBe("12");
  fireEvent.keyDown(divider, { key: "Enter" });
  expect(divider.getAttribute("aria-valuenow")).toBe("19");
});
