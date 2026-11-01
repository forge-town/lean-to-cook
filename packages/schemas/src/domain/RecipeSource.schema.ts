import { z } from "zod";

export const recipeSourceSchema = z
  .object({
    commit: z.string().regex(/^[a-f0-9]{40}$/),
    license: z.literal("Unlicense"),
    project: z.literal("Anduin2017/HowToCook"),
    retrievedAt: z.string().date(),
    url: z.string().url(),
  })
  .strict();

export type RecipeSource = z.infer<typeof recipeSourceSchema>;
