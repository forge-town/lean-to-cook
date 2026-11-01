import { z } from "zod/v4";
import { recipeStepSchema } from "../domain/RecipeStep.schema";

/** Presentation step identity mapped to a typed Lean action constructor. */
export const LeanActionMapSchema = z.strictObject({
  /** Version of the correspondence file. */ schemaVersion: z.literal(1),
  /** Claims about correspondence, not a proof of TypeScript equivalence. */ correspondence:
    z.literal("checked-mapping-only"),
  /** Inferred source-workbench actions carry no execution-model claim. */ sourceWorkbench:
    z.literal("presentation-only"),
  /** Every formalized frontend recipe and its ordered actions. */
  recipes: z
    .array(
      z.strictObject({
        /** Frontend catalog identity. */ recipeId: z.string().min(1),
        /** Actual model strength for this recipe. */ scope: z.enum([
          "recipe-execution",
          "generic-four-stage",
        ]),
        /** Namespace containing the Lean Step type. */ namespace: z
          .string()
          .regex(/^LeanToCook(?:\.[A-Za-z][A-Za-z0-9_]*)+$/),
        /** Module exporting the Step type and model. */ module: z.string().min(1),
        /** Name of the Lean plan used to check the full action order. */
        plan: z.string().regex(/^[A-Za-z][A-Za-z0-9_]*$/),
        /** Ordered frontend steps and their corresponding Lean constructor. */
        steps: z
          .array(
            recipeStepSchema
              .pick({ id: true, sequence: true, formalAction: true, requires: true, effects: true })
              .extend({
                /** Constructor of this recipe's Lean Step type. */ constructor: z
                  .string()
                  .regex(/^[A-Za-z][A-Za-z0-9_]*$/),
              }),
          )
          .min(1),
      }),
    )
    .min(1),
});
export type LeanActionMap = z.infer<typeof LeanActionMapSchema>;
