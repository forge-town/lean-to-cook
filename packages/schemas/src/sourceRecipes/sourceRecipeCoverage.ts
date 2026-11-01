import sourceRecipeCoverageData from "../../../../content/how-to-cook/COVERAGE.json";

import { sourceRecipeCoverageSchema } from "../domain/SourceRecipeCoverage.schema";

export const sourceRecipeCoverage = sourceRecipeCoverageSchema.parse(sourceRecipeCoverageData);
