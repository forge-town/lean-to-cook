import type { Meta, StoryObj } from "@storybook/react-vite";
import { RouteNotFound } from "./RouteNotFound";
import { AdminApp } from "../AdminApp";
import { fixtureAuth, fixtureProvider } from "../../storybook/fixtures";
import { fixtureRouter } from "../../storybook/fixtureRouter";
const meta = { title: "Components/RouteNotFound", component: RouteNotFound } satisfies Meta<
  typeof RouteNotFound
>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <AdminApp
      authentication={fixtureAuth}
      dataSource={fixtureProvider}
      routerInstance={fixtureRouter("/missing-page")}
    />
  ),
};
