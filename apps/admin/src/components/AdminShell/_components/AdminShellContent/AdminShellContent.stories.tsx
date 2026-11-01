import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { AdminShellContent } from "./AdminShellContent";
import { fixtureId, recipeLocation } from "../../../../storybook/fixtures";
import { readLocation } from "../../../../lib/resources";
import { AdminShellStoreProvider } from "../../_store";
const meta = {
  title: "Components/AdminShellContent",
  component: AdminShellContent,
  args: { location: recipeLocation, children: "菜谱与食材管理", logoutFailed: false },
  decorators: [
    (Story) => (
      <AdminShellStoreProvider logout={async () => ({ success: false })}>
        <Story />
      </AdminShellStoreProvider>
    ),
  ],
} satisfies Meta<typeof AdminShellContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { location: recipeLocation, children: "菜谱与食材管理", logoutFailed: false },
};
export const Default: Story = { args: {} };
const alternateArgs = { ...meta.args, logoutFailed: true } satisfies ComponentProps<
  typeof AdminShellContent
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminShellContent {...meta.args} />
      <AdminShellContent {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = { args: { ...meta.args, logoutFailed: true } };
export const EditRecord: Story = {
  args: { location: readLocation("", "recipes", fixtureId), recordName: "番茄炒蛋" },
};
export const NewRecord: Story = {
  args: { location: readLocation("", "recipes", "new") },
};
export const RecordUnavailable: Story = {
  args: { location: readLocation("", "recipes", fixtureId), recordFailed: true },
};
