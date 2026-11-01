import { z } from "zod/v4";
import { IngredientInputSchema } from "./IngredientInput.schema";
/** Public presentation metadata; independent of pinned recipe and proof inputs. */
export const PublicIngredientSchema = IngredientInputSchema.safeExtend({
  /** Stable database identity. */ id: z.uuid(),
  /** Original recipe name; retained when the display name changes. */ sourceName: z
    .string()
    .min(1)
    .max(100),
  /** Last saved presentation change. */ updatedAt: z.iso.datetime(),
});
export type PublicIngredient = z.infer<typeof PublicIngredientSchema>;
