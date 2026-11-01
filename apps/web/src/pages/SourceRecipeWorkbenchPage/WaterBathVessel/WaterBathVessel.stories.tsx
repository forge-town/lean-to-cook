import type { Meta, StoryObj } from "@storybook/react-vite";
import { WaterBathVessel } from "./WaterBathVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: WaterBathVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/WaterBathVessel",
  args: { scene: actionSceneAt("perfect-boiled-egg", 2) },
} satisfies Meta<typeof WaterBathVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("perfect-boiled-egg", 2), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <WaterBathVessel scene={actionSceneAt("perfect-boiled-egg", 2)} />
      <WaterBathVessel
        scene={{ ...actionSceneAt("perfect-boiled-egg", 3), activeIngredients: [] }}
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
