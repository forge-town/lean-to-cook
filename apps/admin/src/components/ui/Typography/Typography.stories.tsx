import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { Typography } from "./Typography";
const meta = {
  title: "Components/Typography",
  component: Typography,
  args: { as: "h2", children: "番茄炒蛋" },
} satisfies Meta<typeof Typography>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { as: "h2", children: "番茄炒蛋" } };
export const Default: Story = { args: {} };
const alternateArgs = {
  ...meta.args,
  as: "p",
  children: "数量不确定时，可以保留适量等原文。",
} satisfies ComponentProps<typeof Typography>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <Typography {...meta.args} />
      <Typography {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = {
  args: { ...meta.args, as: "p", children: "数量不确定时，可以保留适量等原文。" },
};
