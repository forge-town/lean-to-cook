import { z } from "zod";
import { ingredientSchema } from "./Ingredient.schema";
import { kitchenPredicateSchema } from "./KitchenPredicate.schema";
import { recipeProofSchema } from "./RecipeProof.schema";
import { recipePresentationSchema } from "./RecipePresentation.schema";
import { recipeCategorySchema } from "./RecipeCategory.schema";
import { recipeSourceSchema } from "./RecipeSource.schema";
import { recipeStepSchema } from "./RecipeStep.schema";

export const recipeSchema = z
  .object({
    calories: z.number().int().nonnegative(),
    category: recipeCategorySchema,
    description: z.string().min(1),
    difficulty: z.number().int().min(1).max(5),
    durationMinutes: z.number().int().positive(),
    id: z.string().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/),
    ingredients: z.array(ingredientSchema).min(1),
    initialState: z.array(kitchenPredicateSchema),
    presentation: recipePresentationSchema,
    proof: recipeProofSchema,
    servingDescription: z.string().min(1),
    source: recipeSourceSchema,
    steps: z.array(recipeStepSchema).min(1),
    title: z.string().min(1),
  })
  .strict();

export type Recipe = z.infer<typeof recipeSchema>;
