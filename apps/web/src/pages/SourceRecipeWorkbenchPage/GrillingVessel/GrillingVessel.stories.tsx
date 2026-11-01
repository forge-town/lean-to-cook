import type { Meta, StoryObj } from "@storybook/react-vite";
import { GrillingVessel } from "./GrillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const scene = {
  ...actionSceneAt("simple-braised-pork", 2),
  method: "torch" as const,
  methodLabel: "喷枪炙皮",
  vesselLabel: "喷枪 / 金属托盘",
  instruction: "使用火焰喷枪炙皮",
};
const meta = {
  component: GrillingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/GrillingVessel",
  args: { scene },
} satisfies Meta<typeof GrillingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene, className: "bg-paper" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <GrillingVessel scene={scene} />
      <GrillingVessel scene={{ ...scene, activeIngredients: [] }} />
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
