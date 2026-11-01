import { z } from "zod";
import { measurementUnitSchema } from "./MeasurementUnit.schema";

const quantityValueSchema = z.number().finite().nonnegative();

const exactQuantitySchema = z
  .object({
    kind: z.literal("exact"),
    unit: measurementUnitSchema,
    value: quantityValueSchema,
  })
  .strict();

const perServingQuantitySchema = z
  .object({
    kind: z.literal("perServing"),
    rounding: z.enum(["none", "ceil", "floor"]),
    unit: measurementUnitSchema,
    value: quantityValueSchema,
  })
  .strict();

const rangePerServingQuantitySchema = z
  .object({
    kind: z.literal("rangePerServing"),
    max: quantityValueSchema,
    min: quantityValueSchema,
    unit: measurementUnitSchema,
  })
  .strict()
  .refine(({ max, min }) => max >= min, {
    message: "Quantity maximum must be greater than or equal to its minimum",
  });

const derivedQuantitySchema = z
  .object({
    factor: quantityValueSchema,
    kind: z.literal("derived"),
    sourceIngredientId: z.string().min(1),
    sourceUnit: measurementUnitSchema,
    unit: measurementUnitSchema,
  })
  .strict();

export const quantitySchema = z.discriminatedUnion("kind", [
  exactQuantitySchema,
  perServingQuantitySchema,
  rangePerServingQuantitySchema,
  derivedQuantitySchema,
]);

export type Quantity = z.infer<typeof quantitySchema>;
