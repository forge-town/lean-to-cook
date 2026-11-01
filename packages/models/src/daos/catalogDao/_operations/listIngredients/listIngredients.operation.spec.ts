import { expect, it, vi } from "vitest";
const findMany = vi.hoisted(() => vi.fn());
vi.mock("@repo/db", () => ({ db: { query: { ingredientsTable: { findMany } } } }));
import { listIngredientsOperation } from "./listIngredients.operation";
it("keeps ingredient aliases available for public recipe-name matching", async () => {
  findMany.mockResolvedValue([{ id: "a", name: "番茄", ingredientAliases: [{ name: "西红柿" }] }]);
  expect(await listIngredientsOperation()).toEqual([
    { id: "a", name: "番茄", aliases: ["西红柿"] },
  ]);
});
