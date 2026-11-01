import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { Landmark } from "./Landmark";
const meta = {
  title: "Components/Landmark",
  component: Landmark,
  args: { as: "section", "aria-label": "菜谱信息", children: "按份数准备原料" },
} satisfies Meta<typeof Landmark>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { as: "section", "aria-label": "菜谱信息", children: "按份数准备原料" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  as: "section",
  "aria-label": "菜谱信息",
  children: "按份数准备原料",
} satisfies ComponentProps<typeof Landmark>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <Landmark {...meta.args} />
      <Landmark {...alternateArgs} />
    </div>
  ),
};
