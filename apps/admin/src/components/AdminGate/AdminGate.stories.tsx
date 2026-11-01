import type { Meta, StoryObj } from "@storybook/react-vite";
import { AdminGate } from "./AdminGate";
import { AdminApp } from "../AdminApp";
import { fixtureProvider, fixtureAuth, fixtureId } from "../../storybook/fixtures";
import { fixtureRouter } from "../../storybook/fixtureRouter";
const meta = {
  title: "Components/AdminGate",
  component: AdminGate,
  render: () => (
    <AdminApp
      authentication={fixtureAuth}
      dataSource={fixtureProvider}
      routerInstance={fixtureRouter()}
    />
  ),
} satisfies Meta<typeof AdminGate>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminApp
        authentication={fixtureAuth}
        dataSource={fixtureProvider}
        routerInstance={fixtureRouter("/ingredients")}
      />
      <AdminApp
        authentication={fixtureAuth}
        dataSource={fixtureProvider}
        routerInstance={fixtureRouter(`/recipes/${fixtureId}`)}
      />
    </div>
  ),
};
