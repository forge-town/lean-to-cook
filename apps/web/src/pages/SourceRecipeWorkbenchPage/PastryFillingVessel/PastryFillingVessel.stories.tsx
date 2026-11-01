import type { Meta, StoryObj } from "@storybook/react-vite";
import { PastryFillingVessel } from "./PastryFillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: PastryFillingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/PastryFillingVessel",
  args: { scene: actionSceneAt("baked-egg-tarts", 1) },
} satisfies Meta<typeof PastryFillingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("baked-egg-tarts", 1), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <PastryFillingVessel scene={actionSceneAt("baked-egg-tarts", 1)} />
      <PastryFillingVessel
        scene={{ ...actionSceneAt("baked-egg-tarts", 1), activeIngredients: [] }}
      />
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
