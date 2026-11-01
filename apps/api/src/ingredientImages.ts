import { readFile } from "node:fs/promises";
import { ingredientImagePaths } from "@repo/schemas/catalog";
import { ResultAsync } from "neverthrow";
export const serveIngredientImage = async (pathname: string): Promise<Response> => {
  if (!(Object.values(ingredientImagePaths) as string[]).includes(pathname))
    return new Response(null, { status: 404 });
  const filename = pathname.slice("/api/ingredient-images/".length);
  const file = await ResultAsync.fromPromise(
    readFile(new URL(`../../web/public/ingredient-icons/fluent-flat/${filename}`, import.meta.url)),
    (cause) => new Error("Ingredient image unavailable", { cause }),
  );

  return file.match(
    (content) =>
      new Response(new Uint8Array(content), {
        headers: {
          "Content-Type": "image/svg+xml",
          "Cache-Control": "public, max-age=86400",
          "X-Content-Type-Options": "nosniff",
        },
      }),
    () => new Response(null, { status: 404 }),
  );
};
