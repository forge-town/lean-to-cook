const sourceRecipeDocuments = import.meta.glob<string>(
  "../../../content/how-to-cook/dishes/**/*.md",
  {
    import: "default",
    query: "?raw",
  }
);

const SOURCE_DOCUMENT_PREFIX = "../../../content/how-to-cook/";

export const loadSourceRecipeDocument = async (sourcePath: string) => {
  const loadDocument = sourceRecipeDocuments[`${SOURCE_DOCUMENT_PREFIX}${sourcePath}`];

  return loadDocument ? loadDocument() : undefined;
};
