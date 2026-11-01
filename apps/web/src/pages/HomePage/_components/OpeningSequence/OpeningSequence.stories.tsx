import type { Meta, StoryObj } from "@storybook/react-vite";
import { OpeningSequence } from "./OpeningSequence";
const meta = {
  component: OpeningSequence,
  title: "Pages/HomePage/Components/OpeningSequence",
  decorators: [
    (Story) => (
      <div className="relative h-dvh">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof OpeningSequence>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { className: "bg-paper" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="flex flex-wrap gap-6 p-6">
      <div className="relative h-[34rem] w-[42rem] overflow-hidden rounded-3xl border border-border">
        <OpeningSequence />
      </div>
      <div className="relative h-[34rem] w-80 overflow-hidden rounded-3xl border border-border">
        <OpeningSequence />
      </div>
    </div>
  ),
};
export const NarrowFrame: Story = {
  decorators: [
    (Story) => (
      <div className="relative mx-auto h-dvh max-w-sm overflow-hidden">
        <Story />
      </div>
    ),
  ],
};
