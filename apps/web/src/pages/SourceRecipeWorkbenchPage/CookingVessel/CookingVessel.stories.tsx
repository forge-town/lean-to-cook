import type { Meta, StoryObj } from "@storybook/react-vite";
import { CookingVessel } from "./CookingVessel";
import { potatoSceneAt } from "../sceneFixtures";
const meta = {
  component: CookingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/CookingVessel",
  args: { scene: potatoSceneAt(2) },
} satisfies Meta<typeof CookingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene: potatoSceneAt(2) } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 md:grid-cols-3">
      {[1, 2, 4].map((step) => (
        <CookingVessel key={step} scene={potatoSceneAt(step)} />
      ))}
    </div>
  ),
};
export const Steam: Story = {
  args: {
    scene: {
      ...potatoSceneAt(2),
      method: "steam",
      methodLabel: "蒸汽熟成",
      vesselLabel: "竹蒸笼",
      atmosphere: "warm",
    },
  },
};
export const Microwave: Story = {
  args: {
    scene: {
      ...potatoSceneAt(2),
      method: "microwave",
      methodLabel: "微波加热",
      vesselLabel: "微波炉容器",
    },
  },
};
export const Holding: Story = { args: { scene: potatoSceneAt(3) } };
