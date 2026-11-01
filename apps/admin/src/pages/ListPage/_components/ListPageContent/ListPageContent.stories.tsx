import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { ListPageContent } from "./ListPageContent";
import { recipeLocation, ingredientLocation } from "../../../../storybook/fixtures";
import { ListPageStoreProvider } from "../../_store";
const meta = {
  title: "Pages/ListPage/Components/ListPageContent",
  component: ListPageContent,
  args: { location: recipeLocation },
  decorators: [
    (Story) => (
      <ListPageStoreProvider location={recipeLocation}>
        <Story />
      </ListPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof ListPageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { location: recipeLocation } };
export const Default: Story = { args: {} };
const alternateArgs = { location: ingredientLocation } satisfies ComponentProps<
  typeof ListPageContent
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <ListPageContent {...meta.args} />
      <ListPageContent {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = { args: { location: ingredientLocation } };
