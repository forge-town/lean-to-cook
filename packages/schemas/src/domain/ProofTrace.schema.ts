import { z } from "zod";
import { proofTraceStateSchema } from "./ProofTraceState.schema";
import { proofTraceStepSchema } from "./ProofTraceStep.schema";

export const proofTraceSchema = z
  .object({
    initial: proofTraceStateSchema,
    steps: z.array(proofTraceStepSchema).min(1),
  })
  .strict();

export type ProofTrace = z.infer<typeof proofTraceSchema>;
