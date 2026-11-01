import { expect, it } from "vitest";
import { catalogHref } from "./navigation";
import { readLocation } from "./resources";
it("uses business paths and path IDs while keeping filters in search", () => {
  const url = new URL(
    catalogHref("recipes", { id: "record-1", q: "鸡蛋", pageSize: 10 }),
    "http://localhost",
  );
  expect(url.pathname).toBe("/recipes/record-1");
  expect(url.searchParams.get("q")).toBe("鸡蛋");
  expect(url.searchParams.has("id")).toBe(false);
  expect(url.searchParams.has("resource")).toBe(false);
  expect(catalogHref("units", { id: "new" })).toBe("/units/new");
});
it("never chooses page identity from search parameters", () => {
  expect(readLocation("?resource=ingredients&id=wrong&page=2", "recipes", "correct")).toMatchObject(
    { resource: "recipes", id: "correct", page: 2 },
  );
});
