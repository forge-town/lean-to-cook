// @vitest-environment jsdom
import { Refine } from "@refinedev/core";
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { StorybookRouter } from "../../storybook/StorybookRouter";
import { PublishedRecipePage } from "./PublishedRecipePage";
import { publishedRecipeFixture, publishedRecipeFixtureProvider } from "./publishedRecipeFixtures";
afterEach(cleanup);
it("renders published API data at a per-recipe entry without inventing a proof badge", async () => {
  render(
    <StorybookRouter>
      <Refine dataProvider={publishedRecipeFixtureProvider} options={{ disableTelemetry: true }}>
        <PublishedRecipePage id={publishedRecipeFixture.id} />
      </Refine>
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "菠萝咖啡特调" })).toBeDefined();
  expect(screen.getByText("加入冷萃咖啡和冰块。")).toBeDefined();
  expect(screen.getByText("30 ml")).toBeDefined();
  expect(screen.queryByText("结构校验通过")).toBeNull();
});
it("shows an unavailable state when the public API rejects a draft", async () => {
  render(
    <StorybookRouter>
      <Refine
        dataProvider={{
          ...publishedRecipeFixtureProvider,
          getOne: async () => {
            throw new Error("这道菜谱尚未发布");
          },
        }}
        options={{ disableTelemetry: true }}
      >
        <PublishedRecipePage id={publishedRecipeFixture.id} />
      </Refine>
    </StorybookRouter>
  );
  expect(await screen.findByRole("alert")).toBeDefined();
  expect(screen.getByText("菜谱暂不可查看")).toBeDefined();
  expect(screen.queryByText("加入冷萃咖啡和冰块。")).toBeNull();
});
