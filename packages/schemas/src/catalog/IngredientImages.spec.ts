import { expect, it } from "vitest";
import { IngredientInputSchema } from "./IngredientInput.schema";
import { matchIngredientImage } from "./matchIngredientImage";
it("rejects arbitrary image paths while accepting bundled image keys", () => {
  const input = { name: "可乐", categoryId: null, description: "", aliases: [] };
  expect(IngredientInputSchema.safeParse({ ...input, imageKey: "jar" }).success).toBe(true);
  expect(IngredientInputSchema.safeParse({ ...input, imageKey: "../../secret.svg" }).success).toBe(
    false,
  );
});
it("matches current ingredients without confusing sauces, butter, and vegetables", () => {
  for (const [name, image] of Object.entries({
    可乐: "jar",
    蒸鱼豉油: "jar",
    黄油: "butter",
    食用油: "pouringLiquid",
    尖椒: "hotPepper",
    西红柿: "tomato",
    土豆: "potato",
    椰子水: "droplet",
    米饭: "cookedRice",
  }))
    expect(matchIngredientImage(name)).toBe(image);
  expect(matchIngredientImage("尚未收录的食材")).toBe("jar");
});
