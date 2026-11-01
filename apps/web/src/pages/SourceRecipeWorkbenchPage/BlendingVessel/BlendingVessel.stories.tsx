import type { Meta, StoryObj } from "@storybook/react-vite";
import { BlendingVessel } from "./BlendingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const scene = {
  ...actionSceneAt("lemon-water", 1),
  method: "blend" as const,
  methodLabel: "高速搅打",
  vesselLabel: "搅拌机杯",
  instruction: "启动搅拌机",
};
const meta = {
  component: BlendingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/BlendingVessel",
  args: { scene },
} satisfies Meta<typeof BlendingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene, className: "bg-paper" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <BlendingVessel scene={scene} />
      <BlendingVessel scene={{ ...scene, activeIngredients: [] }} />
    </div>
  ),
};
export const NarrowFrame: Story = {
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-xs">
        <Story />
      </div>
    ),
  ],
};
