export const getSourceProofPath = (sourceRecipe: { category: string; id: string }) => {
  const category = sourceRecipe.category
    .split(/[^a-zA-Z0-9]+/)
    .filter(Boolean)
    .map((part) => part[0]!.toUpperCase() + part.slice(1))
    .join("");
  if (!/^[A-Z][a-zA-Z0-9]*$/.test(category) || !/^[a-f0-9]+$/.test(sourceRecipe.id))
    throw new Error(`Invalid source proof identity: ${sourceRecipe.category}/${sourceRecipe.id}`);
  return `Sources/${category}/Recipe${sourceRecipe.id[0]!.toUpperCase()}${sourceRecipe.id.slice(1)}.lean`;
};
