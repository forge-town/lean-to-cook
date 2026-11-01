import { expect, it } from "vitest";
import { renderCatalogLean, leanString } from "./renderCatalogLean.helper";
import { CatalogDetailSchema } from "@repo/schemas/catalog";
const record = CatalogDetailSchema.parse({
  id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
  resource: "ingredients",
  updatedAt: "2026-10-31T00:00:00.000Z",
  values: { name: "牛奶", aliases: [], description: "", categoryId: null, imageKey: "glassOfMilk" },
  source: null,
  references: [],
  publication: null,
  verification: "not_verified",
});
it("binds Lean data to the exact ingredient identity and revision", () => {
  const result = renderCatalogLean(record, "牛奶");
  expect(result.source).toContain(record.id);
  expect(result.source).toContain(record.updatedAt);
  expect(result.source).toContain('name := "牛奶"');
  expect(result.source).toContain("ingredientValid allowedImages record = true := by decide");
});
it("escapes string contents rather than allowing Lean declarations to be injected", () => {
  expect(leanString('"\nend X\naxiom unsafe : False\n')).toBe(
    '"\\\"\\nend X\\naxiom unsafe : False\\n"',
  );
  expect(leanString("\b\f")).toContain("\\u0008");
});
