import type { Meta, StoryObj } from "@storybook/react-vite";
import { AppShellStoreProvider } from "./AppShellStoreProvider";
import { AppShell } from "../../AppShell";
const meta = {
  title: "Components/AppShell/StoreProvider",
  component: AppShellStoreProvider,
  args: {
    children: (
      <AppShell>
        <h1 className="p-8 text-3xl">菜谱</h1>
      </AppShell>
    ),
  },
} satisfies Meta<typeof AppShellStoreProvider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <AppShellStoreProvider>
        <AppShell>
          <h1 className="p-8">菜谱</h1>
        </AppShell>
      </AppShellStoreProvider>
      <AppShellStoreProvider>
        <AppShell>
          <h1 className="p-8">基础理论</h1>
        </AppShell>
      </AppShellStoreProvider>
    </>
  ),
};
