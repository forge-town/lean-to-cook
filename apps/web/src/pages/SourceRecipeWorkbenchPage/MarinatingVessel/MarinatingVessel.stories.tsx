import type { Meta, StoryObj } from "@storybook/react-vite";
import { MarinatingVessel } from "./MarinatingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: MarinatingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/MarinatingVessel",
  args: { scene: actionSceneAt("cola-chicken-wings", 2) },
} satisfies Meta<typeof MarinatingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("cola-chicken-wings", 2), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <MarinatingVessel scene={actionSceneAt("cola-chicken-wings", 2)} />
      <MarinatingVessel scene={actionSceneAt("steamed-sea-bass", 2)} />
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
