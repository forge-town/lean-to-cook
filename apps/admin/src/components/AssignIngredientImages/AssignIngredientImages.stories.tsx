import type { Meta, StoryObj } from "@storybook/react-vite";
import { AssignIngredientImages } from "./AssignIngredientImages";
import { ListPageStoreProvider } from "../../pages/ListPage/_store";
import { readLocation } from "../../lib/resources";
const meta = {
  title: "Components/AssignIngredientImages",
  component: AssignIngredientImages,
  decorators: [
    (Story) => (
      <ListPageStoreProvider location={readLocation("/ingredients")} assignImages={async () => 64}>
        <Story />
      </ListPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof AssignIngredientImages>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="button-row">
      <AssignIngredientImages />
      <ListPageStoreProvider location={readLocation("/ingredients")} assignImages={async () => 0}>
        <AssignIngredientImages />
      </ListPageStoreProvider>
    </div>
  ),
};
export const Error: Story = {
  decorators: [
    (Story) => (
      <ListPageStoreProvider
        location={readLocation("/ingredients")}
        assignImages={async () => {
          throw new globalThis.Error("离线");
        }}
      >
        <Story />
      </ListPageStoreProvider>
    ),
  ],
};
