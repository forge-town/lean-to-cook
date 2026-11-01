import type { Meta, StoryObj } from "@storybook/react-vite";
import { ReductionVessel } from "./ReductionVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: ReductionVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/ReductionVessel",
  args: { scene: actionSceneAt("cola-chicken-wings", 7) },
} satisfies Meta<typeof ReductionVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("cola-chicken-wings", 7), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <ReductionVessel scene={actionSceneAt("cola-chicken-wings", 7)} />
      <ReductionVessel scene={actionSceneAt("sweet-sour-sauce", 3)} />
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
