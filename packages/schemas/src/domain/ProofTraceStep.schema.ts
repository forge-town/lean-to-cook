import { z } from "zod";
import { formalActionSchema } from "./FormalAction.schema";
import { kitchenPredicateSchema } from "./KitchenPredicate.schema";
import { numericDerivationSchema } from "./NumericDerivation.schema";
import { proofTraceStateSchema } from "./ProofTraceState.schema";
import { stateChangeSchema } from "./StateChange.schema";

export const proofTraceStepSchema = z
  .object({
    effects: z.array(stateChangeSchema).min(1),
    formalAction: formalActionSchema,
    instruction: z.string().min(1),
    numericDerivations: z.array(numericDerivationSchema),
    requires: z.array(kitchenPredicateSchema),
    sequence: z.number().int().positive(),
    stateAfter: proofTraceStateSchema,
    stateBefore: proofTraceStateSchema,
    stepId: z.string().regex(/^step-[0-9]{2}$/),
  })
  .strict();

export type ProofTraceStep = z.infer<typeof proofTraceStepSchema>;
