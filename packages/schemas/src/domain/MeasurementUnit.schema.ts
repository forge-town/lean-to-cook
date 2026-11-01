import { z } from "zod";

export const measurementUnitSchema = z.enum([
  "piece",
  "gram",
  "milliliter",
  "second",
  "centimeter",
]);

export type MeasurementUnit = z.infer<typeof measurementUnitSchema>;
