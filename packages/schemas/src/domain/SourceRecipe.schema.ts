import { z } from "zod";

import { recipeCategorySchema } from "./RecipeCategory.schema";

export const sourceRecipeSchema = z
  .object({
    category: recipeCategorySchema,
    id: z.string().regex(/^[a-f0-9]{12}$/),
    license: z.literal("Unlicense"),
    sourcePath: z.string().regex(/^dishes\/.+\.md$/),
    sourceUrl: z.url(),
    title: z.string().min(1),
    upstreamCommit: z.string().regex(/^[a-f0-9]{40}$/),
  })
  .strict();

export type SourceRecipe = z.infer<typeof sourceRecipeSchema>;
