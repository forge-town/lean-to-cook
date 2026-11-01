import { afterAll, describe, expect, it } from "vitest";
import { databaseClient, db } from "@repo/db";
import { sql } from "drizzle-orm";
import { catalogDao } from "../../daos/catalogDao/catalog.dao";
import { CatalogRepository } from "./CatalogRepository";

const identity = { resource: "recipes" as const, id: crypto.randomUUID() };
const recipe = {
  title: "Test recipe",
  categoryId: null,
  description: "",
  servings: null,
  notes: "",
  requirements: [
    {
      label: "锅",
      kind: "tool" as const,
      ingredientId: null,
      quantityText: "",
      amount: null,
      unitId: null,
      optional: false,
    },
  ],
  steps: ["准备炒锅"],
};
const created: {
  resource: "recipes" | "ingredients" | "units" | "recipe-categories" | "ingredient-categories";
  id: string;
}[] = [];
const create = async (input: Parameters<typeof CatalogRepository.save>[0]) => {
  const result = await CatalogRepository.save(input);
  created.unshift({ resource: input.resource, id: result.id });

  return result;
};
afterAll(async () => {
  for (const item of created) {
    const record = await CatalogRepository.get(item);
    if (record)
      await CatalogRepository.remove({
        ...item,
        expectedUpdatedAt: record.record.updatedAt.toISOString(),
      });
  }
  await databaseClient.end();
});
describe("catalog persistence", () => {
  it("persists a recipe, ordered steps and requirements as an aggregate", async () => {
    const result = await create({ ...identity, id: null, expectedUpdatedAt: null, values: recipe });
    const stored = await CatalogRepository.get({ ...identity, id: result.id });
    expect(stored?.resource).toBe("recipes");
    if (stored?.resource !== "recipes") throw new Error("Missing recipe");
    expect(stored.record.recipeSteps.map((step) => step.instruction)).toEqual(recipe.steps);
    expect(stored.record.recipeRequirements[0]?.kind).toBe("tool");
  });
  it("does not overwrite an edit made in another window", async () => {
    const result = await create({
      resource: "recipes",
      id: null,
      expectedUpdatedAt: null,
      values: recipe,
    });
    const before = await CatalogRepository.get({ resource: "recipes", id: result.id });
    const first = {
      resource: "recipes" as const,
      id: result.id,
      expectedUpdatedAt: before!.record.updatedAt.toISOString(),
      values: { ...recipe, title: "First change" },
    };
    await CatalogRepository.save(first);
    await expect(
      CatalogRepository.save({ ...first, values: { ...recipe, title: "Overwritten" } }),
    ).rejects.toMatchObject({ code: "CONFLICT" });
  });
  it("rolls back the parent when a child references a missing ingredient", async () => {
    const id = crypto.randomUUID();
    await expect(
      CatalogRepository.save({
        resource: "recipes",
        id: null,
        expectedUpdatedAt: null,
        values: {
          ...recipe,
          title: id,
          requirements: [
            { ...recipe.requirements[0]!, kind: "ingredient", ingredientId: crypto.randomUUID() },
          ],
        },
      }),
    ).rejects.toBeDefined();
    const matches = await db.execute(sql`select id from recipes where title=${id}`);
    expect(matches.length).toBe(0);
  });
  it("rejects alias collisions with a canonical ingredient, including concurrent saves", async () => {
    const name = "ingredient-" + crypto.randomUUID();
    await create({
      resource: "ingredients",
      id: null,
      expectedUpdatedAt: null,
      values: { name, categoryId: null, description: "", aliases: [name + "-alias"] },
    });
    await expect(
      CatalogRepository.save({
        resource: "ingredients",
        id: null,
        expectedUpdatedAt: null,
        values: { name: name + "-alias", categoryId: null, description: "", aliases: [] },
      }),
    ).rejects.toMatchObject({ code: "DUPLICATE" });
    const shared = name + "-concurrent";
    const results = await Promise.allSettled(
      [1, 2].map((n) =>
        create({
          resource: "ingredients",
          id: null,
          expectedUpdatedAt: null,
          values: { name: name + n, categoryId: null, description: "", aliases: [shared] },
        }),
      ),
    );
    expect(results.filter((result) => result.status === "fulfilled")).toHaveLength(1);
  });
  it("blocks deleting ingredients and units referenced by a recipe", async () => {
    const food = await create({
      resource: "ingredients",
      id: null,
      expectedUpdatedAt: null,
      values: { name: crypto.randomUUID(), categoryId: null, description: "", aliases: [] },
    });
    const unit = await create({
      resource: "units",
      id: null,
      expectedUpdatedAt: null,
      values: { name: crypto.randomUUID(), code: "u" + crypto.randomUUID(), dimension: "count" },
    });
    await create({
      resource: "recipes",
      id: null,
      expectedUpdatedAt: null,
      values: {
        ...recipe,
        requirements: [
          {
            ...recipe.requirements[0]!,
            kind: "ingredient",
            ingredientId: food.id,
            amount: "2",
            unitId: unit.id,
          },
        ],
      },
    });
    for (const item of [
      { resource: "ingredients" as const, id: food.id },
      { resource: "units" as const, id: unit.id },
    ]) {
      const record = await CatalogRepository.get(item);
      await expect(
        CatalogRepository.remove({
          ...item,
          expectedUpdatedAt: record!.record.updatedAt.toISOString(),
        }),
      ).rejects.toBeDefined();
    }
  });
});
it("should round-trip a six-decimal quantity as an exact string", async () => {
  const unit = await create({
    resource: "units",
    id: null,
    expectedUpdatedAt: null,
    values: { name: crypto.randomUUID(), code: "exact-" + crypto.randomUUID(), dimension: "mass" },
  });
  const result = await create({
    resource: "recipes",
    id: null,
    expectedUpdatedAt: null,
    values: {
      ...recipe,
      requirements: [{ ...recipe.requirements[0]!, amount: "999999999.000001", unitId: unit.id }],
    },
  });
  const stored = await CatalogRepository.get({ resource: "recipes", id: result.id });
  if (stored?.resource !== "recipes") throw new Error("Missing recipe");
  expect(stored.record.recipeRequirements[0]?.amount).toBe("999999999.000001");
});

it("preserves ingredient presentation choices, stable recipe binding and optimistic locks", async () => {
  const name = `image-${crypto.randomUUID()}`;
  const values = { name, categoryId: null, description: "", aliases: [], imageKey: null };
  const { id } = await create({
    resource: "ingredients",
    id: null,
    expectedUpdatedAt: null,
    values,
  });
  const before = await CatalogRepository.get({ resource: "ingredients", id });
  expect(await catalogDao.assignIngredientImages([{ id, imageKey: "jar" }])).toEqual({
    updated: 1,
  });
  await expect(
    CatalogRepository.save({
      resource: "ingredients",
      id,
      expectedUpdatedAt: before!.record.updatedAt.toISOString(),
      values,
    }),
  ).rejects.toMatchObject({ code: "CONFLICT" });
  const assigned = await CatalogRepository.get({ resource: "ingredients", id });
  await CatalogRepository.save({
    resource: "ingredients",
    id,
    expectedUpdatedAt: assigned!.record.updatedAt.toISOString(),
    values: { ...values, name: name + " renamed", imageKey: "tomato" },
  });
  expect(await catalogDao.assignIngredientImages([{ id, imageKey: "jar" }])).toEqual({
    updated: 0,
  });
  const renamed = await CatalogRepository.get({ resource: "ingredients", id });
  if (renamed?.resource !== "ingredients") throw new Error("Missing ingredient");
  expect(renamed.record.imageKey).toBe("tomato");
  expect(renamed.record.sourceName).toBe(name);
  await CatalogRepository.save({
    resource: "ingredients",
    id,
    expectedUpdatedAt: renamed.record.updatedAt.toISOString(),
    values: { name: name + " renamed", categoryId: null, description: "", aliases: [] },
  });
  const finalRecord = await CatalogRepository.get({ resource: "ingredients", id });
  if (finalRecord?.resource !== "ingredients") throw new Error("Missing ingredient");
  expect(finalRecord.record.imageKey).toBe("tomato");
});
it("links only selected unclassified rows, preserves tools, and protects recipe edit versions", async () => {
  const name = `linked-${crypto.randomUUID()}`;
  const ingredient = await create({
    resource: "ingredients",
    id: null,
    expectedUpdatedAt: null,
    values: { name, categoryId: null, description: "", aliases: [] },
  });
  const values = {
    ...recipe,
    requirements: [
      { ...recipe.requirements[0]!, label: name, kind: "unclassified" as const },
      { ...recipe.requirements[0]!, label: name, kind: "tool" as const },
      { ...recipe.requirements[0]!, label: name + "或水", kind: "unclassified" as const },
    ],
  };
  const { id } = await create({ resource: "recipes", id: null, expectedUpdatedAt: null, values });
  const before = await CatalogRepository.get({ resource: "recipes", id });
  const beforeCandidates = await CatalogRepository.findUnclassifiedRequirements();
  const originalCandidate = beforeCandidates.find(
    (row) => row.recipeId === id && row.label === name,
  )!;
  await CatalogRepository.save({
    resource: "recipes",
    id,
    expectedUpdatedAt: before!.record.updatedAt.toISOString(),
    values: { ...values, title: name },
  });
  expect(
    await CatalogRepository.linkIngredients([
      { requirement: originalCandidate, ingredientId: ingredient.id },
    ]),
  ).toEqual({ linked: 0, recipes: 0 });
  const afterCandidates = await CatalogRepository.findUnclassifiedRequirements();
  const candidate = afterCandidates.find((row) => row.recipeId === id && row.label === name)!;
  expect(
    await CatalogRepository.linkIngredients([
      { requirement: candidate, ingredientId: ingredient.id },
    ]),
  ).toEqual({ linked: 1, recipes: 1 });
  expect(
    await CatalogRepository.linkIngredients([
      { requirement: candidate, ingredientId: ingredient.id },
    ]),
  ).toEqual({ linked: 0, recipes: 0 });
  const after = await CatalogRepository.get({ resource: "recipes", id });
  if (after?.resource !== "recipes") throw new Error("Missing recipe");
  expect(
    after.record.recipeRequirements.map((row) => ({
      label: row.label,
      kind: row.kind,
      ingredientId: row.ingredientId,
    })),
  ).toEqual([
    { label: name, kind: "ingredient", ingredientId: ingredient.id },
    { label: name, kind: "tool", ingredientId: null },
    { label: name + "或水", kind: "unclassified", ingredientId: null },
  ]);
  await expect(
    CatalogRepository.save({
      resource: "recipes",
      id,
      expectedUpdatedAt: candidate.recipeUpdatedAt.toISOString(),
      values,
    }),
  ).rejects.toMatchObject({ code: "CONFLICT" });
  const dictionary = await CatalogRepository.get({ resource: "ingredients", id: ingredient.id });
  await expect(
    CatalogRepository.remove({
      resource: "ingredients",
      id: ingredient.id,
      expectedUpdatedAt: dictionary!.record.updatedAt.toISOString(),
    }),
  ).rejects.toBeDefined();
});
