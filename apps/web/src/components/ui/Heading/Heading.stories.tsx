import type { Meta, StoryObj } from "@storybook/react-vite";
import { Heading } from "./Heading";
const meta = {
  component: Heading,
  title: "Components/Heading",
  decorators: [
    (Story) => (
      <div className="cook-home" style={{ padding: 32, maxWidth: 1000 }}>
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof Heading>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { children: "看看步骤怎么走" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div>
      <Heading>厨房里的定义</Heading>
      <Heading level={2}>从原料到结论</Heading>
    </div>
  ),
};
export const SectionHeading: Story = { args: { level: 2, children: "逐步推演" } };
