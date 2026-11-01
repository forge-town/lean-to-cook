import type { Meta, StoryObj } from "@storybook/react-vite";
import { ApplianceVessel } from "./ApplianceVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: ApplianceVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/ApplianceVessel",
  args: { scene: actionSceneAt("microwave-sunny-side-egg", 2) },
} satisfies Meta<typeof ApplianceVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("microwave-sunny-side-egg", 2), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <ApplianceVessel scene={actionSceneAt("microwave-sunny-side-egg", 2)} />
      <ApplianceVessel
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
