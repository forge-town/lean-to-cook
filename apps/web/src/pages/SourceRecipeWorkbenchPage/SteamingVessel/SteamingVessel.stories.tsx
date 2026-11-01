import type { Meta, StoryObj } from "@storybook/react-vite";
import { SteamingVessel } from "./SteamingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: SteamingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/SteamingVessel",
  args: { scene: actionSceneAt("steamed-sea-bass", 5) },
} satisfies Meta<typeof SteamingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("steamed-sea-bass", 5), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <SteamingVessel scene={actionSceneAt("steamed-sea-bass", 5)} />
      <SteamingVessel scene={{ ...actionSceneAt("steamed-sea-bass", 4), activeIngredients: [] }} />
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
