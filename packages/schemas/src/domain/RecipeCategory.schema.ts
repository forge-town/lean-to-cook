import { z } from "zod";

export const recipeCategorySchema = z.enum([
  "vegetable",
  "meat",
  "aquatic",
  "breakfast",
  "staple",
  "semiFinished",
  "soup",
  "drink",
  "condiment",
  "dessert",
]);

export type RecipeCategory = z.infer<typeof recipeCategorySchema>;
