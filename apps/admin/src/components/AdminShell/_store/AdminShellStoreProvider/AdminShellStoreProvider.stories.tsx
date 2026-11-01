import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { AdminShellStoreProvider } from "./AdminShellStoreProvider";
const meta = {
  title: "Components/AdminShellStoreProvider",
  component: AdminShellStoreProvider,
  args: { logout: async () => ({ success: false }), children: "后台布局状态" },
} satisfies Meta<typeof AdminShellStoreProvider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { logout: async () => ({ success: false }), children: "后台布局状态" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  logout: async () => ({ success: false }),
  children: "后台布局状态",
} satisfies ComponentProps<typeof AdminShellStoreProvider>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminShellStoreProvider {...meta.args} />
      <AdminShellStoreProvider {...alternateArgs} />
    </div>
  ),
};
