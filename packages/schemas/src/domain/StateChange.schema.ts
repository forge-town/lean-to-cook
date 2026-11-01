import { z } from "zod";
import { kitchenPredicateSchema } from "./KitchenPredicate.schema";

export const stateChangeSchema = z
  .object({
    predicate: kitchenPredicateSchema,
    value: z.boolean(),
  })
  .strict();

export type StateChange = z.infer<typeof stateChangeSchema>;
