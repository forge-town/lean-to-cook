import type { Meta, StoryObj } from "@storybook/react-vite";
import { PublicCatalog } from "./PublicCatalog";
import { IngredientIllustration } from "../../pages/SourceRecipeWorkbenchPage/IngredientIllustration";
const meta = {
  title: "Components/PublicCatalog",
  component: PublicCatalog,
  args: {
    children: (
      <IngredientIllustration ingredient={{ name: "土豆", kind: "potato", state: "raw" }} />
    ),
  },
} satisfies Meta<typeof PublicCatalog>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <PublicCatalog>
      <IngredientIllustration ingredient={{ name: "土豆", kind: "potato", state: "raw" }} />
      <IngredientIllustration ingredient={{ name: "可乐", kind: "liquid", state: "raw" }} />
    </PublicCatalog>
  ),
};
