// @vitest-environment jsdom
import { cleanup, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { sourceRecipeCatalog } from "@repo/schemas";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { SourceRecipeLibraryPageContent } from "./SourceRecipeLibraryPageContent";
afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("shows categories and linked dish pictures without repository reports", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  render(
    <StorybookRouter>
      <SourceRecipeLibraryPageContent />
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "菜谱", level: 1 })).toBeTruthy();
  const categories = screen.getByRole("navigation", { name: "菜谱分类" });
  expect(within(categories).getByRole("link", { name: "素菜" }).getAttribute("href")).toBe(
    "#source-category-vegetable"
  );
  expect(screen.getAllByRole("article")).toHaveLength(sourceRecipeCatalog.length);
  expect(screen.getAllByRole("img")).toHaveLength(sourceRecipeCatalog.length);
  const greens = sourceRecipeCatalog.find((recipe) => recipe.title === "白灼菜心")!;
  expect(screen.getByRole("link", { name: "白灼菜心" }).getAttribute("href")).toBe(
    `/source-recipe/${greens.id}`
  );
  expect(screen.getByRole("img", { name: "白灼菜心" }).getAttribute("src")).toMatch(/\.jpg/);
  expect(document.body.textContent).not.toMatch(
    /HowToCook|SOURCE CORPUS|KERNEL CERTS|COVERAGE|documents|LEAN STRUCTURAL|upstream repository/i
  );
});
