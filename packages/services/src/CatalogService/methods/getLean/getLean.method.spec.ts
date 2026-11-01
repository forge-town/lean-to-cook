import { beforeEach, expect, it, vi } from "vitest";
import { CatalogDetailSchema } from "@repo/schemas/catalog";
import { CatalogRepository, leanCertificateDao } from "@repo/models";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
import { loadLeanModel } from "../../helpers/loadLeanModel/loadLeanModel.helper";
import { getLeanMethod } from "./getLean.method";
vi.mock("@repo/models", () => ({
  CatalogRepository: { get: vi.fn() },
  leanCertificateDao: { findRecipe: vi.fn(), findIngredient: vi.fn() },
  CatalogPersistenceError: class extends Error {},
}));
vi.mock("../../helpers/describeRecord/describeRecord.helper", () => ({ describeRecord: vi.fn() }));
vi.mock("../../helpers/loadLeanModel/loadLeanModel.helper", () => ({
  loadLeanModel: vi.fn(),
  loadOriginLean: vi.fn(async () => null),
}));
const identity = { resource: "ingredients" as const, id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc" };
const detail = CatalogDetailSchema.parse({
  ...identity,
  updatedAt: "2026-10-31T00:00:00.000Z",
  values: { name: "牛奶", description: "", aliases: [], categoryId: null, imageKey: "glassOfMilk" },
  references: [],
  source: null,
  publication: null,
  verification: "not_verified",
});
beforeEach(() => {
  vi.clearAllMocks();
  vi.mocked(CatalogRepository.get).mockResolvedValue({
    resource: "ingredients",
    record: { sourceName: "牛奶" },
  } as Awaited<ReturnType<typeof CatalogRepository.get>>);
  vi.mocked(describeRecord).mockReturnValue({ detail } as ReturnType<typeof describeRecord>);
  vi.mocked(loadLeanModel).mockResolvedValue("model version 1");
  vi.mocked(leanCertificateDao.findIngredient).mockResolvedValue(null);
});
it("binds certificates to exact source, current values and model bytes", async () => {
  const initial = await getLeanMethod(identity);
  const first = initial._unsafeUnwrap();
  expect(first.verification).toBe("pending");
  expect(first.source).toContain(identity.id);
  const certificate = {
    id: crypto.randomUUID(),
    ingredientId: identity.id,
    contentDigest: first.digest,
    source: first.source,
    modelSource: first.modelSource,
    leanVersion: "Lean 4.25.0",
    createdAt: new Date(),
    updatedAt: new Date(),
  };
  vi.mocked(leanCertificateDao.findIngredient).mockImplementation(async (query) =>
    query.contentDigest === first.digest ? certificate : null,
  );
  const result1 = await getLeanMethod(identity);
  expect(result1._unsafeUnwrap().verification).toBe("checked");
  vi.mocked(describeRecord).mockReturnValue({
    detail: { ...detail, updatedAt: "2026-10-31T01:00:00.000Z" },
  } as ReturnType<typeof describeRecord>);
  const result2 = await getLeanMethod(identity);
  expect(result2._unsafeUnwrap().verification).toBe("pending");
  vi.mocked(describeRecord).mockReturnValue({ detail } as ReturnType<typeof describeRecord>);
  vi.mocked(loadLeanModel).mockResolvedValue("model version 2");
  const result3 = await getLeanMethod(identity);
  expect(result3._unsafeUnwrap().verification).toBe("pending");
  vi.mocked(loadLeanModel).mockResolvedValue("model version 1");
  vi.mocked(leanCertificateDao.findIngredient).mockResolvedValue({
    ...certificate,
    source: "mismatched bytes",
  });
  const result4 = await getLeanMethod(identity);
  expect(result4._unsafeUnwrap().verification).toBe("pending");
});
it("returns not-found before querying a certificate", async () => {
  vi.mocked(CatalogRepository.get).mockResolvedValue(null);
  const result = await getLeanMethod(identity);
  expect(result._unsafeUnwrapErr().code).toBe("NOT_FOUND");
  expect(leanCertificateDao.findIngredient).not.toHaveBeenCalled();
});
