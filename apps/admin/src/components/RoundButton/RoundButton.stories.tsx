import type { Meta, StoryObj } from "@storybook/react-vite";
import { fn } from "storybook/test";
import { Pencil, Trash2, Upload } from "lucide-react";
import { RoundButton } from "./RoundButton";
const meta = {
  title: "Components/RoundButton",
  component: RoundButton,
  args: { label: "编辑", children: <Pencil aria-hidden="true" />, onClick: fn() },
} satisfies Meta<typeof RoundButton>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="button-row">
      <RoundButton label="发布当前版本">
        <Upload aria-hidden="true" />
      </RoundButton>
      <RoundButton label="编辑">
        <Pencil aria-hidden="true" />
      </RoundButton>
      <RoundButton className="detail-action-delete" label="删除">
        <Trash2 aria-hidden="true" />
      </RoundButton>
    </div>
  ),
};
export const Disabled: Story = { args: { disabled: true } };
