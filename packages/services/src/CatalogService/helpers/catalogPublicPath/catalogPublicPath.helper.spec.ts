import { expect, it } from "vitest";
import { sourceRecipeCatalog } from "@repo/schemas";
import { catalogPublicPath } from "./catalogPublicPath.helper";
it("resolves the precise imported recipe, while unpublished custom records remain private", () => {
  const source = sourceRecipeCatalog.find((r) => r.title === "菠萝咖啡特调")!;
  expect(
    catalogPublicPath("db-id", "draft", {
      sourceId: source.id,
      commit: source.upstreamCommit,
      path: source.sourcePath,
    }),
  ).toBe(`/source-recipe/${source.id}`);
  expect(catalogPublicPath("db-id", "draft")).toBeNull();
  expect(catalogPublicPath("db-id", "published")).toBe("/catalog/recipes/db-id");
  expect(
    catalogPublicPath("db-id", "draft", {
      sourceId: source.id,
      commit: "other",
      path: source.sourcePath,
    }),
  ).toBeNull();
});
