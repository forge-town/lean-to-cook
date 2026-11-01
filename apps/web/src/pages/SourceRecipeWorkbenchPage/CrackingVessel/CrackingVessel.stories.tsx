import type { Meta, StoryObj } from "@storybook/react-vite";
import { CrackingVessel } from "./CrackingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: CrackingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/CrackingVessel",
  args: { scene: actionSceneAt("microwave-sunny-side-egg", 1) },
} satisfies Meta<typeof CrackingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("microwave-sunny-side-egg", 1), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <CrackingVessel scene={actionSceneAt("microwave-sunny-side-egg", 1)} />
      <CrackingVessel
        scene={{ ...actionSceneAt("microwave-sunny-side-egg", 3), activeIngredients: [] }}
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
