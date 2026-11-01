import { z } from "zod";
import { proofTheoremSchema } from "./ProofTheorem.schema";

export const recipeProofSchema = z
  .object({
    leanVersion: z.string().regex(/^[0-9]+\.[0-9]+\.[0-9]+$/),
    module: z.string().min(1),
    modelScope: z.string().min(1),
    theorems: z.array(proofTheoremSchema).min(1),
  })
  .strict();

export type RecipeProof = z.infer<typeof recipeProofSchema>;
