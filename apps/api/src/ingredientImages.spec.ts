import { expect, it } from "vitest";
import { serveIngredientImage } from "./ingredientImages";
import { ingredientImagePaths } from "@repo/schemas/catalog";
it("serves every allowlisted image and rejects paths outside the registry", async () => {
  for (const path of Object.values(ingredientImagePaths)) {
    const response = await serveIngredientImage(path);
    expect(response.status, path).toBe(200);
    expect(response.headers.get("content-type")).toBe("image/svg+xml");
    expect(await response.text()).toContain("<svg");
  }
  for (const path of [
    "/api/ingredient-images/../../.env",
    "/api/ingredient-images/secret.svg",
    "/api/ingredient-images/%2e%2e/egg.svg",
  ]) {
    const response = await serveIngredientImage(path);
    expect(response.status).toBe(404);
  }
});
