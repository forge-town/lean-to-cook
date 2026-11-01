import { z } from "zod";
import { kitchenPredicateSchema } from "./KitchenPredicate.schema";

export const proofTraceStateSchema = z
  .object({
    index: z.number().int().nonnegative(),
    predicates: z.array(kitchenPredicateSchema),
  })
  .strict();

export type ProofTraceState = z.infer<typeof proofTraceStateSchema>;
