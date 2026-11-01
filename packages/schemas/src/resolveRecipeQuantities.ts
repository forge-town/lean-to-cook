import type { MeasurementUnit } from "./domain/MeasurementUnit.schema";
import type { Quantity } from "./domain/Quantity.schema";
import type { Recipe } from "./domain/Recipe.schema";

interface ResolvedQuantity {
  max: number;
  min: number;
  unit: MeasurementUnit;
}

const roundQuantity = (
  value: number,
  rounding: Extract<Quantity, { kind: "perServing" }>["rounding"],
) => {
  switch (rounding) {
    case "ceil": {
      return Math.ceil(value);
    }
    case "floor": {
      return Math.floor(value);
    }
    case "none": {
      return value;
    }
  }
};

export const resolveRecipeQuantities = (
  recipe: Recipe,
  servings: number,
): Record<string, ResolvedQuantity> => {
  if (!Number.isInteger(servings) || servings <= 0) {
    throw new Error("Servings must be a positive integer");
  }

  const resolved: Record<string, ResolvedQuantity> = {};

  for (const ingredient of recipe.ingredients) {
    const quantity = ingredient.quantity;

    switch (quantity.kind) {
      case "exact": {
        resolved[ingredient.id] = {
          max: quantity.value,
          min: quantity.value,
          unit: quantity.unit,
        };
        break;
      }
      case "perServing": {
        const value = roundQuantity(
          quantity.value * servings,
          quantity.rounding,
        );
        resolved[ingredient.id] = {
          max: value,
          min: value,
          unit: quantity.unit,
        };
        break;
      }
      case "rangePerServing": {
        resolved[ingredient.id] = {
          max: quantity.max * servings,
          min: quantity.min * servings,
          unit: quantity.unit,
        };
        break;
      }
      case "derived": {
        const source = resolved[quantity.sourceIngredientId];

        if (!source || source.unit !== quantity.sourceUnit) {
          throw new Error(
            `Cannot resolve derived quantity for ${ingredient.id}: source ${quantity.sourceIngredientId} is missing or uses another unit`,
          );
        }

        resolved[ingredient.id] = {
          max: source.max * quantity.factor,
          min: source.min * quantity.factor,
          unit: quantity.unit,
        };
        break;
      }
    }
  }

  return resolved;
};
