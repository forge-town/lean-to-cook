import type { Meta, StoryObj } from "@storybook/react-vite";
import { AppShell } from "./AppShell";
import { Workspace } from "../Workspace";
const meta = {
  title: "Components/AppShell",
  component: AppShell,
  args: {
    children: (
      <div className="p-8">
        <h1 className="text-3xl">菜谱</h1>
      </div>
    ),
  },
} satisfies Meta<typeof AppShell>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <AppShell>
        <Workspace left={<div className="p-5">素菜</div>}>
          <div className="p-8">白灼菜心</div>
        </Workspace>
      </AppShell>
      <AppShell>
        <Workspace
          left={<div className="p-5">基础理论</div>}
          right={<pre className="p-5">theorem amounts_valid</pre>}
        >
          <div className="p-8">用量推演</div>
        </Workspace>
      </AppShell>
    </>
  ),
};
