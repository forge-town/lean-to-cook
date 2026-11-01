import type { Meta, StoryObj } from "@storybook/react-vite";
import { Text } from "./Text";
const meta = {
  component: Text,
  title: "Components/Text",
  decorators: [
    (Story) => (
      <div className="cook-home" style={{ padding: 32, maxWidth: 1000 }}>
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof Text>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { children: "把食材写成定义，把步骤连成推演。" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div>
      <Text>食材准备就绪。</Text>
      <Text>前置条件已经满足。</Text>
    </div>
  ),
};
export const LongContent: Story = {
  args: {
    children: "这里可以查看每一步操作怎样改变厨房状态，也可以打开对应的 Lean 证明。",
  },
};
