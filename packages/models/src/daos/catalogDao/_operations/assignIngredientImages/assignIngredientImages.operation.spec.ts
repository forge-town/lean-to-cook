import { expect, it, vi } from "vitest";
const mocks = vi.hoisted(() => ({
  update: vi.fn(),
  set: vi.fn(),
  where: vi.fn(),
  returning: vi.fn(),
}));
vi.mock("@repo/db", () => ({ db: { update: mocks.update } }));
import { assignIngredientImagesOperation } from "./assignIngredientImages.operation";
it("does not touch the database for an empty image assignment", async () => {
  expect(await assignIngredientImagesOperation([])).toEqual({ updated: 0 });
  expect(mocks.update).not.toHaveBeenCalled();
});
it("counts actual conditional writes rather than proposed choices", async () => {
  mocks.update.mockReturnValue({ set: mocks.set });
  mocks.set.mockReturnValue({ where: mocks.where });
  mocks.where.mockReturnValue({ returning: mocks.returning });
  mocks.returning.mockResolvedValue([{ id: "a" }]);
  expect(
    await assignIngredientImagesOperation([
      { id: "a", imageKey: "tomato" },
      { id: "b", imageKey: "jar" },
    ]),
  ).toEqual({ updated: 1 });
});
