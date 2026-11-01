import type { Meta, StoryObj } from "@storybook/react-vite";
import { AppShell } from "../AppShell";
import { WorkspaceHeader } from "./WorkspaceHeader";
const args = {
  title: "地三鲜",
  previousDisabled: false,
  nextDisabled: false,
  onNextButtonClick: () => undefined,
  onPreviousButtonClick: () => undefined,
  onResetButtonClick: () => undefined,
};
const meta = {
  component: WorkspaceHeader,
  title: "Components/WorkspaceHeader",
  args,
  decorators: [
    (Story) => (
      <AppShell>
        <Story />
      </AppShell>
    ),
  ],
} satisfies Meta<typeof WorkspaceHeader>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...args } };
export const Default: Story = { args: {} };
export const FirstStep: Story = { args: { previousDisabled: true } };
export const LastStep: Story = { args: { nextDisabled: true } };
export const BaseUsage: Story = {
  args: { title: "菠萝咖啡特调", previousDisabled: true },
  render: (props) => <WorkspaceHeader {...props} />,
};
export const NarrowFrame: Story = { parameters: { viewport: { defaultViewport: "mobile1" } } };
