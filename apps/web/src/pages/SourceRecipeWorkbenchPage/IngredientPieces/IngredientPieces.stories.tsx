import type { Meta, StoryObj } from "@storybook/react-vite";
import { IngredientPieces } from "./IngredientPieces";
const meta = {
  component: IngredientPieces,
  title: "Pages/SourceRecipeWorkbenchPage/Components/IngredientPieces",
  args: { ingredient: { kind: "tomato", name: "西红柿", state: "prepped", form: "pieces" } },
} satisfies Meta<typeof IngredientPieces>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { ingredient: { kind: "tomato", name: "西红柿", state: "prepped", form: "pieces" } },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="flex gap-8 p-5">
      <IngredientPieces ingredient={{ kind: "tomato", name: "西红柿", state: "prepped" }} />
      <IngredientPieces ingredient={{ kind: "potato", name: "土豆", state: "prepped" }} />
    </div>
  ),
};
export const Cooked: Story = {
  args: { ingredient: { kind: "tomato", name: "西红柿", state: "cooked", form: "pieces" } },
};
