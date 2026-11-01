import type { BaseRecord, DataProvider } from "@refinedev/core";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { fixtureProvider } from "./fixtures";
import { leanFixtureFor } from "./leanFixtures";
export const leanStoryProvider = (record: CatalogDetail, scenario: string): DataProvider => {
  if (scenario === "loading")
    return { ...fixtureProvider, custom: async () => new Promise<never>(() => undefined) };
  if (scenario !== "long") return fixtureProvider;
  const artifact = leanFixtureFor(record);

  return {
    ...fixtureProvider,
    custom: async <T extends BaseRecord>() => ({
      data: {
        ...artifact,
        source: artifact.source + "\n-- 保留菜谱的记录版本、食材关联和操作顺序。".repeat(100),
      } as BaseRecord as T,
    }),
  };
};
