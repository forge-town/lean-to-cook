import { readFile, stat } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { getSourceProofPath } from "@repo/lean-proofs/source-proof-path";
import { getSourceRecipeById } from "@repo/schemas";
import type { CatalogRepository } from "@repo/models";
import { CatalogServiceError } from "../../Catalog.service.error";
const packageUrl = new URL(import.meta.resolve("@repo/lean-proofs/package.json"));
export const leanProjectRoot = fileURLToPath(new URL("./", packageUrl));
const modelPaths = [
  "Core/Quantities",
  "DataContracts/References",
  "DataContracts/Ingredients",
  "DataContracts/Recipes",
  "DataContracts/Proofs",
];
const textCache = new Map<string, { mtime: number; text: string }>();
const loadText = async (url: URL) => {
  const info = await stat(url);
  const cached = textCache.get(url.href);
  if (cached?.mtime === info.mtimeMs) return cached.text;
  const text = await readFile(url, "utf8");
  textCache.set(url.href, { mtime: info.mtimeMs, text });

  return text;
};
export const loadLeanModel = async () => {
  const parts = await Promise.all(
    modelPaths.map((path) => loadText(new URL(`LeanToCook/${path}.lean`, packageUrl))),
  );

  return parts
    .map(
      (part, index) => `/- ${modelPaths[index]}.lean -/\n${part.replaceAll(/^import .+\n/gm, "")}`,
    )
    .join("\n");
};
export const loadOriginLean = async (
  raw: NonNullable<Awaited<ReturnType<CatalogRepository["get"]>>>,
) => {
  if (raw.resource !== "recipes") return null;
  const source = raw.record.recipeSources[0];
  const known = source ? getSourceRecipeById(source.sourceId) : undefined;
  if (
    !source ||
    !known ||
    source.commit !== known.upstreamCommit ||
    source.path !== known.sourcePath
  )
    return null;
  const full = await loadText(
    new URL(`LeanToCook/Generated/${getSourceProofPath(known)}`, packageUrl),
  );
  const name = `recipe_${known.id}`;
  if (!full.includes(`theorem ${name}_kernel_certificate`))
    throw new CatalogServiceError("INTERNAL", "未找到对应菜谱的 Lean 源码");

  return {
    commit: source.commit,
    path: source.path,
    declaration: `LeanToCook.SourceCatalog.${name}_kernel_certificate`,
    source: full,
  };
};
