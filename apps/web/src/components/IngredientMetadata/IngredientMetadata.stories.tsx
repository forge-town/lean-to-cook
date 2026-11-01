import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { IngredientMetadata } from "./IngredientMetadata";
import { IngredientIllustration } from "../../pages/SourceRecipeWorkbenchPage/IngredientIllustration";
import { publicCatalogDataProvider } from "../../integrations/catalog/dataProvider";
const meta = {
  title: "Components/IngredientMetadata",
  component: IngredientMetadata,
  decorators: [
    (Story) => (
      <Refine
        dataProvider={{
          ...publicCatalogDataProvider,
          getList: (async () => ({
            data: [
              { id: "coke", sourceName: "可乐", name: "可乐饮料", imageKey: "jar", aliases: [] },
            ],
            total: 1,
          })) as typeof publicCatalogDataProvider.getList,
        }}
      >
        <Story />
      </Refine>
    ),
  ],
  args: {
    children: (
      <IngredientIllustration ingredient={{ name: "可乐", kind: "liquid", state: "raw" }} />
    ),
  },
} satisfies Meta<typeof IngredientMetadata>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <IngredientMetadata>
      <IngredientIllustration ingredient={{ name: "可乐", kind: "liquid", state: "raw" }} />
      <IngredientIllustration ingredient={{ name: "鸡蛋", kind: "egg", state: "cooked" }} />
    </IngredientMetadata>
  ),
};
