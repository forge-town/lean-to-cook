import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { ListPageStoreProvider } from "./ListPageStoreProvider";
import { recipeLocation } from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/ListPage/Components/ListPageStoreProvider",
  component: ListPageStoreProvider,
  args: { location: recipeLocation, children: "列表筛选状态" },
} satisfies Meta<typeof ListPageStoreProvider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { location: recipeLocation, children: "列表筛选状态" } };
export const Default: Story = { args: {} };
const alternateArgs = {
  location: recipeLocation,
  children: "列表筛选状态",
} satisfies ComponentProps<typeof ListPageStoreProvider>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <ListPageStoreProvider {...meta.args} />
      <ListPageStoreProvider {...alternateArgs} />
    </div>
  ),
};
