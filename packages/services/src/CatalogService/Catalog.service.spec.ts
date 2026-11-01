import { beforeEach, describe, expect, it, vi } from "vitest";
import { CatalogRepository } from "@repo/models";
import { CatalogService } from "./Catalog.service";
vi.mock("@repo/models", async () => ({
  CatalogRepository: {
    get: vi.fn(),
    readPage: vi.fn(),
    usageCount: vi.fn(),
    publish: vi.fn(),
    findPublicationCandidates: vi.fn(),
  },
  CatalogPersistenceError: class extends Error {},
}));
const id = "eebced67-ea7f-4ad4-8d15-938b8b25f6cc";
const date = new Date("2026-10-30T00:00:00.000Z");
const record = {
  id,
  title: "炒蛋",
  categoryId: null,
  category: null,
  description: "",
  servings: null,
  notes: "",
  createdAt: date,
  updatedAt: date,
  recipeSources: [],
  recipePublications: [],
  recipeRequirements: [
    {
      id,
      recipeId: id,
      position: 1,
      label: "鸡蛋",
      kind: "unclassified",
      ingredientId: null,
      ingredient: null,
      quantityText: "",
      amount: null,
      unitId: null,
      unit: null,
      optional: false,
      createdAt: date,
      updatedAt: date,
    },
  ],
  recipeSteps: [
    { id, recipeId: id, position: 1, instruction: "打散鸡蛋", createdAt: date, updatedAt: date },
  ],
};
beforeEach(() => vi.clearAllMocks());
describe("public catalog boundary", () => {
  it("hides drafts from the public API", async () => {
    vi.mocked(CatalogRepository.get).mockResolvedValue({ resource: "recipes", record });
    const result = await CatalogService.getPublic({ id });
    expect(result.isErr()).toBe(true);
  });
  it("only exposes the exact content that was published", async () => {
    vi.mocked(CatalogRepository.get).mockResolvedValue({ resource: "recipes", record });
    vi.mocked(CatalogRepository.publish).mockResolvedValue({ id });
    const publication = await CatalogService.publish({
      resource: "recipes",
      id,
      expectedUpdatedAt: date.toISOString(),
    });
    expect(publication.isOk()).toBe(true);
    const digest = vi.mocked(CatalogRepository.publish).mock.calls[0]![0].contentDigest!;
    vi.mocked(CatalogRepository.get).mockResolvedValue({
      resource: "recipes",
      record: {
        ...record,
        recipePublications: [
          { id, recipeId: id, contentDigest: digest, createdAt: date, updatedAt: date },
        ],
      },
    });
    const result = await CatalogService.getPublic({ id });
    expect(result.isOk()).toBe(true);
    if (result.isOk()) expect(result.value.verification).toBe("not_verified");
    vi.mocked(CatalogRepository.get).mockResolvedValue({
      resource: "recipes",
      record: {
        ...record,
        title: "改过的炒蛋",
        recipePublications: [
          { id, recipeId: id, contentDigest: digest, createdAt: date, updatedAt: date },
        ],
      },
    });
    expect((await CatalogService.getPublic({ id })).isErr()).toBe(true);
  });
  it("maps database failures instead of exposing raw errors", async () => {
    vi.mocked(CatalogRepository.get).mockRejectedValue(new Error("private database URL"));
    const result = await CatalogService.getPublic({ id });
    expect(result.isErr()).toBe(true);
    if (result.isErr()) expect(result.error.message).not.toContain("private");
  });
});

it("paginates the public directory after excluding unpublished content", async () => {
  vi.mocked(CatalogRepository.findPublicationCandidates).mockResolvedValue([{ id }]);
  vi.mocked(CatalogRepository.get).mockResolvedValue({ resource: "recipes", record });
  const result = await CatalogService.listPublic({
    resource: "recipes",
    page: 1,
    pageSize: 25,
    search: "",
  });
  expect(result.isOk()).toBe(true);
  if (result.isOk()) expect(result.value).toEqual({ data: [], total: 0 });
});

it("reads ingredient lists in bulk without fetching every ingredient again", async () => {
  vi.mocked(CatalogRepository.readPage).mockResolvedValue({
    data: [{ id }],
    total: 1,
    dictionaryRows: [
      {
        id,
        name: "西红柿",
        updatedAt: date,
        categoryName: "蔬菜",
        aliases: ["番茄"],
        code: null,
        dimension: null,
        usageCount: 3,
      },
    ],
  });
  const result = await CatalogService.list({
    resource: "ingredients",
    page: 1,
    pageSize: 100,
    search: "",
  });
  expect(result.isOk()).toBe(true);
  if (result.isOk())
    expect(result.value.data[0]).toMatchObject({
      name: "西红柿",
      detail: "蔬菜 · 番茄",
      usageCount: 3,
    });
  expect(CatalogRepository.get).not.toHaveBeenCalled();
});

it("returns distinct foreign-key recipe references and the saved ingredient category", async () => {
  const recipeId = crypto.randomUUID();
  vi.mocked(CatalogRepository.get).mockResolvedValue({
    resource: "ingredients",
    record: {
      id,
      name: "牛奶",
      sourceName: "牛奶",
      imageKey: "glassOfMilk",
      categoryId: id,
      description: "",
      createdAt: date,
      updatedAt: date,
      category: { id, name: "乳制品", createdAt: date, updatedAt: date },
      ingredientAliases: [],
      recipeRequirements: [
        { recipeId, recipe: { id: recipeId, title: "烤蛋挞" } },
        { recipeId, recipe: { id: recipeId, title: "烤蛋挞" } },
      ],
    },
  });
  const result = await CatalogService.get({ resource: "ingredients", id });
  expect(result._unsafeUnwrap().references).toEqual([
    { kind: "category", id, name: "乳制品", code: null },
    { kind: "recipe", id: recipeId, name: "烤蛋挞", code: null },
  ]);
});
