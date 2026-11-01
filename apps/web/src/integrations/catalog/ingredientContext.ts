import { createContext } from "react";
import type { PublicIngredient } from "@repo/schemas/catalog";
export const IngredientContext = createContext<PublicIngredient[]>([]);
