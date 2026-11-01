// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { HomePageContent } from "./HomePageContent";

afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("offers independent destinations for the source corpus, proof library and example", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  render(
    <StorybookRouter>
      <HomePageContent />
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "步步有数，道道靠谱" })).toBeTruthy();
  expect(screen.getByRole("link", { name: "打开菜谱库" }).getAttribute("href")).toBe(
    "/source-recipes"
  );
  expect(screen.getByRole("link", { name: "进入证明库" }).getAttribute("href")).toBe("/library");
  expect(screen.getByRole("link", { name: "先试一道西红柿炒鸡蛋" }).getAttribute("href")).toContain(
    "tomato-scrambled-eggs"
  );
});
