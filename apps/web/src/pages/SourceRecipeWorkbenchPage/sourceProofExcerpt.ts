const sources = import.meta.glob<string>(
  "../../../../../packages/lean-proofs/LeanToCook/Generated/Sources/**/*.lean",
  { query: "?raw", import: "default", eager: true }
);
const excerpts = new Map(
  Object.values(sources).flatMap((source) => {
    const id = source.match(/def recipe_([a-f0-9]+) : Recipe/)?.[1];

    return id ? [[id, source] as const] : [];
  })
);
export const sourceProofExcerpt = (id: string) => excerpts.get(id) ?? "";
