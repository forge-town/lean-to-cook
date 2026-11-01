import type { Meta, StoryObj } from "@storybook/react-vite";
import { WorkspaceDivider } from "./WorkspaceDivider";
const meta = {
  component: WorkspaceDivider,
  title: "Components/Workspace/WorkspaceDivider",
  args: { side: "left", panelId: "recipe-directory" },
  decorators: [
    (Story) => (
      <div className="flex h-80 justify-center bg-paper">
        <Story />
      </div>
    ),
  ],
} satisfies Meta<typeof WorkspaceDivider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { side: "left", panelId: "recipe-directory" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="flex h-80 gap-20">
      <WorkspaceDivider panelId="recipe-directory" side="left" />
      <WorkspaceDivider panelId="recipe-proof" side="right" />
    </div>
  ),
};
export const Right: Story = { args: { side: "right", panelId: "recipe-proof" } };
