import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { Anchor } from "./Anchor";
const meta = {
  title: "Components/Anchor",
  component: Anchor,
  args: { href: "/ingredients", children: "打开食材库" },
} satisfies Meta<typeof Anchor>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { href: "/ingredients", children: "打开食材库" } };
export const Default: Story = { args: {} };
const alternateArgs = {
  ...meta.args,
  children: "查看来源",
  href: "https://github.com/Anduin2017/HowToCook",
} satisfies ComponentProps<typeof Anchor>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <Anchor {...meta.args} />
      <Anchor {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = {
  args: { ...meta.args, children: "查看来源", href: "https://github.com/Anduin2017/HowToCook" },
};
