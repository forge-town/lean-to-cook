import type { Meta, StoryObj } from "@storybook/react-vite";
import { Workspace } from "./Workspace";
const meta = {
  title: "Components/Workspace",
  component: Workspace,
  args: {
    left: <div className="p-5">基础理论</div>,
    right: <pre className="p-5">theorem amounts_valid</pre>,
    children: <div className="p-8">用量推演</div>,
  },
} satisfies Meta<typeof Workspace>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <Workspace left={<div className="p-5">素菜</div>}>
        <div className="p-8">白灼菜心</div>
      </Workspace>
      <Workspace right={<pre className="p-5">theorem cooked</pre>}>
        <div className="p-8">烹饪状态</div>
      </Workspace>
    </>
  ),
};
export const ContentOnly: Story = { args: { left: undefined, right: undefined } };
