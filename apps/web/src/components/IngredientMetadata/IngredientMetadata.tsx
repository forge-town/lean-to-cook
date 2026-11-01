import { useList } from "@refinedev/core";
import type { PropsWithChildren } from "react";
import type { PublicIngredient } from "@repo/schemas/catalog";
import { IngredientContext } from "../../integrations/catalog/ingredientContext";
export type IngredientMetadataProps = PropsWithChildren;
export const IngredientMetadata = ({ children }: IngredientMetadataProps) => {
  const query = useList<PublicIngredient>({
    resource: "ingredients",
    pagination: { mode: "off" },
    queryOptions: {
      enabled: typeof globalThis.document !== "undefined",
      retry: 1,
      refetchInterval: 10_000,
      refetchOnWindowFocus: "always",
      staleTime: 0,
    },
    errorNotification: false,
  });

  return <IngredientContext value={query.result.data}>{children}</IngredientContext>;
};
