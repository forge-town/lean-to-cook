import { z } from "zod";
import { cookingActionSchema } from "./CookingAction.schema";
import { formalActionSchema } from "./FormalAction.schema";
import { kitchenPredicateSchema } from "./KitchenPredicate.schema";
import { numericDerivationSchema } from "./NumericDerivation.schema";
import { stateChangeSchema } from "./StateChange.schema";

export const recipeStepSchema = z
  .object({
    actions: z.array(cookingActionSchema).min(1),
    effects: z.array(stateChangeSchema).min(1),
    formalAction: formalActionSchema,
    id: z.string().regex(/^step-[0-9]{2}$/),
    inputs: z.array(z.string().min(1)),
    instruction: z.string().min(1),
    note: z.string().min(1).optional(),
    numericDerivations: z.array(numericDerivationSchema).optional(),
    optional: z.boolean(),
    requires: z.array(kitchenPredicateSchema),
    sequence: z.number().int().positive(),
    stageTitle: z.string().min(1),
  })
  .strict();

export type RecipeStep = z.infer<typeof recipeStepSchema>;
