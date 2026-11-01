import type { Meta, StoryObj } from "@storybook/react-vite";
import { AdminApp } from "./AdminApp";
import { fixtureProvider, fixtureAuth, fixtureId } from "../../storybook/fixtures";
import { fixtureRouter } from "../../storybook/fixtureRouter";
const meta = {
  title: "Components/AdminApp",
  component: AdminApp,
  args: {
    dataSource: fixtureProvider,
    authentication: fixtureAuth,
    routerInstance: fixtureRouter(),
  },
} satisfies Meta<typeof AdminApp>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminApp {...meta.args} routerInstance={fixtureRouter("/ingredients")} />
      <AdminApp {...meta.args} routerInstance={fixtureRouter(`/recipes/${fixtureId}`)} />
    </div>
  ),
};
export const Detail: Story = { args: { routerInstance: fixtureRouter(`/recipes/${fixtureId}`) } };
