import type { Recipe } from "@repo/schemas";

import { SimulatorPageStoreProvider } from "./_store";
import { SimulatorPageContent } from "./SimulatorPageContent";

interface SimulatorPageProperties {
  recipe: Recipe;
}

export const SimulatorPage = ({ recipe }: SimulatorPageProperties) => (
  <SimulatorPageStoreProvider recipe={recipe}>
    <SimulatorPageContent recipe={recipe} />
  </SimulatorPageStoreProvider>
);
