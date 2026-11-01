import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { ListPage } from "./ListPage";
import { recipeLocation, ingredientLocation } from "../../storybook/fixtures";
const meta = {
  title: "Pages/ListPage/Components/ListPage",
  component: ListPage,
  args: { location: recipeLocation },
} satisfies Meta<typeof ListPage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { location: recipeLocation } };
export const Default: Story = { args: {} };
const alternateArgs = { location: ingredientLocation } satisfies ComponentProps<typeof ListPage>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <ListPage {...meta.args} />
      <ListPage {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = { args: { location: ingredientLocation } };
