import { z } from "zod";

export const recipePresentationSchema = z
  .object({
    caseNumber: z.number().int().positive(),
    contextLabel: z.string().min(1),
    defaultContextValue: z.number().int().positive(),
    initialStageTitle: z.string().min(1),
    scene: z.enum([
      "tomatoEgg",
      "colaWings",
      "threeFresh",
      "butterShrimp",
      "cornRibSoup",
      "steamedSeaBass",
      "braise",
      "quickSoup",
      "breakfast",
      "staple",
      "semiFinished",
      "drink",
      "condiment",
      "chiliOil",
      "dessert",
    ]),
  })
  .strict();

export type RecipePresentation = z.infer<typeof recipePresentationSchema>;
