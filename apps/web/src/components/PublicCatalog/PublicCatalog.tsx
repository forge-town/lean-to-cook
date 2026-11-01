import { Refine } from "@refinedev/core";
import type { PropsWithChildren } from "react";
import { publicCatalogDataProvider } from "../../integrations/catalog/dataProvider";
import { IngredientMetadata } from "../IngredientMetadata";
export type PublicCatalogProps = PropsWithChildren;
export const PublicCatalog = ({ children }: PublicCatalogProps) => (
  <Refine dataProvider={publicCatalogDataProvider} options={{ disableTelemetry: true }}>
    <IngredientMetadata>{children}</IngredientMetadata>
  </Refine>
);
