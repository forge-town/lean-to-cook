import type { Meta, StoryObj } from "@storybook/react-vite";
import { PeelingVessel } from "./PeelingVessel";
import { actionSceneAt, potatoPeelingScene } from "../actionSceneFixtures";
const meta = {
  component: PeelingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/PeelingVessel",
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 2) },
} satisfies Meta<typeof PeelingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 2), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <PeelingVessel scene={actionSceneAt("tomato-scrambled-eggs", 2)} />
      <PeelingVessel scene={potatoPeelingScene} />
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
