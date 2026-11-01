import { z } from "zod";
import { inferencePremiseSchema } from "./InferencePremise.schema";
import { proofReductionSchema } from "./ProofReduction.schema";

export const crossRecipeInferenceSchema = z
  .object({
    conclusion: z.string().min(1),
    description: z.string().min(1),
    name: z.string().regex(/^[A-Za-z][A-Za-z0-9_]*$/),
    premises: z.array(inferencePremiseSchema).min(2),
    reductions: z.array(proofReductionSchema).min(1),
    statement: z.string().min(1),
    status: z.literal("verified"),
    title: z.string().min(1),
  })
  .strict();

export type CrossRecipeInference = z.infer<typeof crossRecipeInferenceSchema>;
