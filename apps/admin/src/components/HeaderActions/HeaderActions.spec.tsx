import { cleanup, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { Button } from "@repo/ui/button";
import { HeaderActions } from "./HeaderActions";
import { AdminShellStoreProvider } from "../AdminShell/_store";
import { AdminShellContent } from "../AdminShell/_components/AdminShellContent";
import { recipeLocation } from "../../storybook/fixtures";
afterEach(cleanup);
it("places the page action in the shared header and removes it on unmount", () => {
  const view = render(
    <AdminShellStoreProvider logout={async () => ({ success: true })}>
      <AdminShellContent location={recipeLocation}>
        <HeaderActions>
          <Button>编辑</Button>
        </HeaderActions>
      </AdminShellContent>
    </AdminShellStoreProvider>,
  );
  expect(within(screen.getByRole("banner")).getByRole("button", { name: "编辑" })).toBeDefined();
  expect(within(screen.getByRole("main")).queryByRole("button", { name: "编辑" })).toBeNull();
  view.unmount();
  expect(screen.queryByRole("button", { name: "编辑" })).toBeNull();
});
