import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { AdminShell } from "./AdminShell";
import { recipeLocation, ingredientLocation } from "../../storybook/fixtures";
const meta = {
  title: "Components/AdminShell",
  component: AdminShell,
  args: { location: recipeLocation, children: "菜谱与食材管理" },
} satisfies Meta<typeof AdminShell>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { location: recipeLocation, children: "菜谱与食材管理" } };
export const Default: Story = { args: {} };
const alternateArgs = { ...meta.args, location: ingredientLocation } satisfies ComponentProps<
  typeof AdminShell
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminShell {...meta.args} />
      <AdminShell {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = { args: { ...meta.args, location: ingredientLocation } };
