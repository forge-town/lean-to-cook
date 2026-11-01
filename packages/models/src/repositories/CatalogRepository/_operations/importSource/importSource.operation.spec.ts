import { afterAll, expect, it } from "vitest";
import { databaseClient } from "@repo/db";
import { CatalogRepository } from "../../CatalogRepository";
import { importSourceOperation } from "./importSource.operation";
const identity: { id: string | null } = { id: null };
afterAll(async () => {
  if (identity.id) {
    const record = await CatalogRepository.get({ resource: "recipes", id: identity.id });
    if (record)
      await CatalogRepository.remove({
        resource: "recipes",
        id: identity.id,
        expectedUpdatedAt: record.record.updatedAt.toISOString(),
      });
  }
  await databaseClient.end();
});
it("imports once and never overwrites an administrator's changes", async () => {
  const sourceId = "seed-test-" + crypto.randomUUID();
  const input = {
    values: {
      title: "原始菜谱",
      description: "",
      categoryId: null,
      servings: null,
      notes: "",
      requirements: [
        {
          label: "锅",
          kind: "unclassified" as const,
          ingredientId: null,
          amount: null,
          unitId: null,
          optional: false,
          quantityText: "",
        },
      ],
      steps: ["开火"],
    },
    source: {
      sourceId,
      path: "test.md",
      url: "https://example.com/test",
      commit: "abc",
      license: "Unlicense",
      markdown: "# 原始菜谱",
    },
  };
  const first = await importSourceOperation(input);
  identity.id = first.id;
  expect(first.inserted).toBe(true);
  const record = await CatalogRepository.get({ resource: "recipes", id: first.id });
  await CatalogRepository.save({
    resource: "recipes",
    id: first.id,
    expectedUpdatedAt: record!.record.updatedAt.toISOString(),
    values: { ...input.values, title: "人工编辑" },
  });
  const second = await importSourceOperation(input);
  expect(second).toEqual({ id: first.id, inserted: false });
  const kept = await CatalogRepository.get({ resource: "recipes", id: first.id });
  if (kept?.resource !== "recipes") throw new Error("Missing recipe");
  expect(kept.record.title).toBe("人工编辑");
  expect(kept.record.recipeSources[0]?.markdown).toBe(input.source.markdown);
});
