import { expect, it, vi } from "vitest";
vi.mock("@repo/models", () => ({ CatalogPersistenceError: class extends Error {} }));
import { compileCatalogLean } from "./compileCatalogLean.helper";
import { renderCatalogLean } from "../renderCatalogLean/renderCatalogLean.helper";
import { CatalogDetailSchema } from "@repo/schemas/catalog";
const record = CatalogDetailSchema.parse({
  id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
  resource: "ingredients",
  updatedAt: "2026-10-31T00:00:00.000Z",
  values: {
    name: '牛奶"\nend Injected\n-- 🥛\b\f',
    aliases: [],
    description: "",
    categoryId: null,
    imageKey: "glassOfMilk",
  },
  source: null,
  references: [],
  publication: null,
  verification: "not_verified",
});
it("kernel-checks generated ingredient data including hostile string contents", async () => {
  const artifact = renderCatalogLean(record);
  expect(await compileCatalogLean([artifact.source])).toMatchObject({
    leanVersion: expect.stringContaining("4.25.0"),
  });
}, 60_000);
it("does not accept sorry or an invalid data theorem as a successful certificate", async () => {
  await expect(compileCatalogLean(["example : False := by sorry"])).rejects.toMatchObject({
    code: "CONFLICT",
  });
  await expect(compileCatalogLean(["example : False := by decide"])).rejects.toMatchObject({
    code: "CONFLICT",
  });
}, 60_000);
