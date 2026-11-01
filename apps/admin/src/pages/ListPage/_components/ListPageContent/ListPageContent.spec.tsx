import { cleanup, render, screen, waitFor } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { Refine } from "@refinedev/core";
import { ListPageContent } from "./ListPageContent";
import { ListPageStoreProvider } from "../../_store";
import { fixtureProvider } from "../../../../storybook/fixtures";
import { readLocation } from "../../../../lib/resources";
import { dataProvider } from "../../../../integrations/refine/dataProvider";
import { navigation } from "../../../../lib/navigation";
vi.mock("../../../../integrations/trpc/client", () => ({
  trpcClient: { catalog: { list: { query: async () => ({ data: [], total: 373 }) } } },
}));
afterEach(() => {
  cleanup();
  vi.restoreAllMocks();
});
it("should correct an out-of-range page before showing resource emptiness", async () => {
  const go = vi.spyOn(navigation, "go").mockImplementation(() => {});
  const location = readLocation("?resource=recipes&page=999");
  render(
    <Refine dataProvider={{ ...fixtureProvider, getList: dataProvider.getList }}>
      <ListPageStoreProvider location={location}>
        <ListPageContent location={location} />
      </ListPageStoreProvider>
    </Refine>,
  );
  await waitFor(() => expect(go).toHaveBeenCalledWith(expect.stringContaining("page=15")));
  expect(screen.queryByText("没有找到菜谱")).toBeNull();
});
it("should keep headings and first-record creation outside normal list content", async () => {
  const location = readLocation("?resource=recipes&pageSize=50");
  render(
    <Refine dataProvider={fixtureProvider}>
      <ListPageStoreProvider location={location}>
        <ListPageContent location={location} />
      </ListPageStoreProvider>
    </Refine>,
  );
  await screen.findByText("番茄炒蛋");
  expect(screen.queryByRole("heading", { name: "菜谱" })).toBeNull();
  expect(screen.getByRole("combobox", { name: "每页条数" })).toBeDefined();
});
