import { z } from "zod";
import { proofReductionSchema } from "./ProofReduction.schema";

export const proofDerivationSchema = z
  .object({
    conclusion: z.string().min(1),
    premises: z.array(z.string().min(1)).min(1),
    reductions: z.array(proofReductionSchema).min(1),
    relatedSteps: z.array(z.number().int().min(0).max(99)),
  })
  .strict();

export type ProofDerivation = z.infer<typeof proofDerivationSchema>;
