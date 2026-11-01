import { ingredientImagePaths } from "./ingredientImagePaths";
export const ingredientImageKeys = Object.keys(
  ingredientImagePaths,
) as (keyof typeof ingredientImagePaths)[];
