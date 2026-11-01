import { z } from "zod";

export const inferencePremiseSchema = z
  .object({
    recipeId: z.string().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/),
    theorem: z.string().regex(/^[A-Za-z][A-Za-z0-9_]*$/),
  })
  .strict();

export type InferencePremise = z.infer<typeof inferencePremiseSchema>;
