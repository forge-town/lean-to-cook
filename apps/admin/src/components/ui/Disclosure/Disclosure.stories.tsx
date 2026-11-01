import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { Disclosure } from "./Disclosure";
const meta = {
  title: "Components/Disclosure",
  component: Disclosure,
  args: { title: "查看导入时的原文", children: "# 番茄炒蛋\n原料：番茄、鸡蛋" },
} satisfies Meta<typeof Disclosure>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { title: "查看导入时的原文", children: "# 番茄炒蛋\n原料：番茄、鸡蛋" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  title: "查看导入时的原文",
  children: "# 番茄炒蛋\n原料：番茄、鸡蛋",
} satisfies ComponentProps<typeof Disclosure>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <Disclosure {...meta.args} />
      <Disclosure {...alternateArgs} />
    </div>
  ),
};
