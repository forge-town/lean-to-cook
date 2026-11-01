import { beforeEach, expect, it, vi } from "vitest";
import { okAsync } from "neverthrow";
import { CatalogLeanArtifactSchema } from "@repo/schemas/catalog";
import { LeanCertificateRepository } from "@repo/models";
import { CatalogServiceError } from "../../Catalog.service.error";
import { getLeanMethod } from "../getLean/getLean.method";
import { compileCatalogLean } from "../../helpers/compileCatalogLean/compileCatalogLean.helper";
import { loadLeanModel } from "../../helpers/loadLeanModel/loadLeanModel.helper";
import { checkLeanMethod } from "./checkLean.method";
vi.mock("@repo/models", () => ({
  LeanCertificateRepository: { saveBatch: vi.fn() },
  CatalogPersistenceError: class extends Error {},
}));
vi.mock("../getLean/getLean.method", () => ({ getLeanMethod: vi.fn() }));
vi.mock("../../helpers/compileCatalogLean/compileCatalogLean.helper", () => ({
  compileCatalogLean: vi.fn(),
}));
vi.mock("../../helpers/loadLeanModel/loadLeanModel.helper", () => ({ loadLeanModel: vi.fn() }));
const artifact = CatalogLeanArtifactSchema.parse({
  id: "eebced67-ea7f-4ad4-8d15-938b8b25f6cc",
  resource: "ingredients",
  updatedAt: "2026-10-31T00:00:00.000Z",
  source: "generated code",
  modelSource: "model",
  modelPath: "LeanToCook/DataContracts/Recipes.lean",
  declaration: "test.data_valid",
  digest: "a".repeat(64),
  verification: "pending",
  checkedAt: null,
  leanVersion: null,
  origin: null,
});
const identity = { id: artifact.id, resource: artifact.resource };
beforeEach(() => {
  vi.clearAllMocks();
  vi.mocked(getLeanMethod).mockReturnValue(okAsync(artifact));
  vi.mocked(compileCatalogLean).mockResolvedValue({ leanVersion: "Lean 4.25.0" });
  vi.mocked(loadLeanModel).mockResolvedValue(artifact.modelSource);
  vi.mocked(LeanCertificateRepository.saveBatch).mockResolvedValue({ inserted: 1 });
});
it("never writes a certificate when compilation fails or the model changes", async () => {
  vi.mocked(compileCatalogLean).mockRejectedValueOnce(
    new CatalogServiceError("CONFLICT", "bad proof"),
  );
  const failed = await checkLeanMethod(identity);
  expect(failed.isErr()).toBe(true);
  expect(LeanCertificateRepository.saveBatch).not.toHaveBeenCalled();
  vi.mocked(loadLeanModel).mockResolvedValue("new model");
  const changed = await checkLeanMethod(identity);
  expect(changed._unsafeUnwrapErr().code).toBe("CONFLICT");
  expect(LeanCertificateRepository.saveBatch).not.toHaveBeenCalled();
});
it("saves only the checked snapshot and re-reads concurrent edits", async () => {
  const edited = { ...artifact, digest: "b".repeat(64), source: "edited code" };
  vi.mocked(getLeanMethod)
    .mockReturnValueOnce(okAsync(artifact))
    .mockReturnValueOnce(okAsync(edited));
  const result = await checkLeanMethod(identity);
  expect(compileCatalogLean).toHaveBeenCalledWith([artifact.source]);
  expect(LeanCertificateRepository.saveBatch).toHaveBeenCalledWith({
    recipes: [],
    ingredients: [
      {
        ingredientId: artifact.id,
        contentDigest: artifact.digest,
        source: artifact.source,
        modelSource: artifact.modelSource,
        leanVersion: "Lean 4.25.0",
      },
    ],
  });
  expect(result._unsafeUnwrap()).toEqual(edited);
});
it("reuses an exact existing certificate without spawning Lean again", async () => {
  vi.mocked(getLeanMethod).mockReturnValue(
    okAsync({
      ...artifact,
      verification: "checked",
      checkedAt: artifact.updatedAt,
      leanVersion: "Lean 4.25.0",
    }),
  );
  const result = await checkLeanMethod(identity);
  expect(result._unsafeUnwrap().verification).toBe("checked");
  expect(compileCatalogLean).not.toHaveBeenCalled();
  expect(LeanCertificateRepository.saveBatch).not.toHaveBeenCalled();
});
