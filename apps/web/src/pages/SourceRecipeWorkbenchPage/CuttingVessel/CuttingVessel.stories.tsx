import type { Meta, StoryObj } from "@storybook/react-vite";
import { CuttingVessel } from "./CuttingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: CuttingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/CuttingVessel",
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 3) },
} satisfies Meta<typeof CuttingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 3), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <CuttingVessel scene={actionSceneAt("tomato-scrambled-eggs", 3)} />
      <CuttingVessel scene={actionSceneAt("three-fresh", 2)} />
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
