import { afterAll, expect, it } from "vitest";
import { databaseClient } from "@repo/db";
import { CatalogRepository } from "../../CatalogRepository";
const fixture: { id: string | null } = { id: null };
afterAll(async () => {
  if (fixture.id) {
    const record = await CatalogRepository.get({ resource: "ingredients", id: fixture.id });
    if (record)
      await CatalogRepository.remove({
        resource: "ingredients",
        id: fixture.id,
        expectedUpdatedAt: record.record.updatedAt.toISOString(),
      });
  }
  await databaseClient.end();
});
it("returns aliases in bulk and treats SQL search wildcards as literal characters", async () => {
  const suffix = crypto.randomUUID();
  const alias = "alias_%_" + suffix;
  const created = await CatalogRepository.save({
    resource: "ingredients",
    id: null,
    expectedUpdatedAt: null,
    values: { name: "bulk-" + suffix, aliases: [alias], categoryId: null, description: "" },
  });
  fixture.id = created.id;
  const page = await CatalogRepository.readPage({
    resource: "ingredients",
    search: alias,
    page: 1,
    pageSize: 100,
  });
  expect(page.total).toBe(1);
  expect(page.dictionaryRows?.[0]).toMatchObject({
    id: created.id,
    aliases: [alias],
    usageCount: 0,
  });
  expect(page.dictionaryRows?.[0]?.updatedAt).toBeInstanceOf(Date);
});
