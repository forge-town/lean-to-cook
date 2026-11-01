import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { SurfaceForm } from "./SurfaceForm";
const meta = {
  title: "Components/SurfaceForm",
  component: SurfaceForm,
  args: { "aria-label": "整理菜谱", children: "表单内容由 React Hook Form 管理" },
} satisfies Meta<typeof SurfaceForm>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { "aria-label": "整理菜谱", children: "表单内容由 React Hook Form 管理" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  "aria-label": "整理菜谱",
  children: "表单内容由 React Hook Form 管理",
} satisfies ComponentProps<typeof SurfaceForm>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <SurfaceForm {...meta.args} />
      <SurfaceForm {...alternateArgs} />
    </div>
  ),
};
