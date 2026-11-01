// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { sourceRecipeCatalog } from "@repo/schemas";
import { afterEach, expect, it, vi } from "vitest";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { loadSourceRecipeDocument } from "@/sourceRecipeDocuments";
import { SourceRecipePageContent as SourceRecipePage } from "./SourceRecipePageContent";

const sourceRecipe = sourceRecipeCatalog.find((recipe) => recipe.id === "c8756846df80")!;
afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("renders the reported recipe as headings, lists and a locally served image", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const markdown = await loadSourceRecipeDocument(sourceRecipe.sourcePath);
  render(
    <StorybookRouter>
      <SourceRecipePage markdown={markdown!} sourceRecipe={sourceRecipe} />
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "白灼菜心的做法" })).toBeTruthy();
  expect(screen.getByRole("heading", { name: "必备原料和工具", level: 2 })).toBeTruthy();
  const image = screen.getByRole("img", { name: "白灼菜心" });
  expect(decodeURI(image.getAttribute("src")!)).toContain("白灼菜心.jpg");
  expect(image.getAttribute("src")).not.toBe("./白灼菜心.jpg");
  expect(screen.getAllByRole("list").length).toBeGreaterThan(1);
});
it("renders GitHub tables and code without interpreting raw HTML", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  render(
    <StorybookRouter>
      <SourceRecipePage
        markdown={
          "## 用量\n\n| 原料 | 数量 |\n| --- | --- |\n| 菜心 | 250g |\n\n**洗净**后加 `5g` 盐。\n\n```text\n保留代码块\n```\n\n<script>alert(1)</script>"
        }
        sourceRecipe={sourceRecipe}
      />
    </StorybookRouter>
  );
  expect(await screen.findByRole("table")).toBeTruthy();
  expect(screen.getByText("洗净").tagName).toBe("STRONG");
  expect(screen.getByText("5g").tagName).toBe("CODE");
  expect(screen.getByText("保留代码块").parentElement?.tagName).toBe("PRE");
  expect(document.querySelector("script")).toBeNull();
});
it("resolves relative recipe links and preserves fragment navigation", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  render(
    <StorybookRouter>
      <SourceRecipePage
        markdown={"## 计算\n\n[本菜谱](./白灼菜心.md) · [本节](#计算) · [不安全](javascript:alert)"}
        sourceRecipe={sourceRecipe}
      />
    </StorybookRouter>
  );
  expect(await screen.findByRole("heading", { name: "计算" })).toBeTruthy();
  expect(screen.getByRole("link", { name: "本菜谱" }).getAttribute("href")).toBe(
    `/source-recipe/${sourceRecipe.id}`
  );
  expect(decodeURI(screen.getByRole("link", { name: "本节" }).getAttribute("href")!)).toBe("#计算");
  expect(screen.getByRole("heading", { name: "计算" }).id).toBe("计算");
  expect(screen.getByText("不安全").closest("a")?.getAttribute("href") ?? "").not.toContain(
    "javascript:"
  );
});
