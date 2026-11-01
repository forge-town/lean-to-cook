import type { PublicIngredient } from "@repo/schemas/catalog";
const normalize = (name: string) => name.trim().normalize("NFKC").toLocaleLowerCase();
export const findIngredientPresentation = (rows: PublicIngredient[], sourceName: string) => {
  const key = normalize(sourceName);

  return (
    rows.find((row) => normalize(row.sourceName) === key) ??
    rows.find((row) => normalize(row.name) === key) ??
    rows.find((row) => row.aliases.some((alias) => normalize(alias) === key))
  );
};
