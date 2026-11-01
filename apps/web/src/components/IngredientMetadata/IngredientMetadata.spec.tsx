// @vitest-environment jsdom
import { Refine } from "@refinedev/core";
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { IngredientMetadata } from "./IngredientMetadata";
import { IngredientIllustration } from "../../pages/SourceRecipeWorkbenchPage/IngredientIllustration";
import { publicCatalogDataProvider } from "../../integrations/catalog/dataProvider";
const getList = async () => ({
  data: [
    {
      id: crypto.randomUUID(),
      name: "可乐饮料",
      sourceName: "可乐",
      imageKey: "teacup",
      aliases: [],
    },
  ],
  total: 1,
});
afterEach(cleanup);
it("loads backend image and display name for an original recipe ingredient", async () => {
  render(
    <Refine
      dataProvider={{
        ...publicCatalogDataProvider,
        getList: getList as typeof publicCatalogDataProvider.getList,
      }}
    >
      <IngredientMetadata>
        <IngredientIllustration ingredient={{ name: "可乐", kind: "liquid", state: "raw" }} />
      </IngredientMetadata>
    </Refine>
  );
  const figure = await screen.findByLabelText("可乐饮料，原始");
  expect(figure.querySelector("img")?.getAttribute("src")).toBe(
    "/api/ingredient-images/teacup_without_handle.svg"
  );
});
it("keeps existing bundled illustrations available without a public API response", () => {
  render(<IngredientIllustration ingredient={{ name: "鸡蛋", kind: "egg", state: "raw" }} />);
  expect(screen.getByLabelText("鸡蛋，原始").querySelector("img")?.getAttribute("src")).toBe(
    "/ingredient-icons/fluent-flat/egg.svg"
  );
});
