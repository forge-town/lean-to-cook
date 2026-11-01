import type { Meta, StoryObj } from "@storybook/react-vite";
import { DetailPage } from "./DetailPage";
import { AdminShell } from "../../components/AdminShell";
import { AdminApp } from "../../components/AdminApp";
import { fixtureId, fixtureAuth, fixtureProvider, recipeLocation } from "../../storybook/fixtures";
import { fixtureRouter } from "../../storybook/fixtureRouter";
const meta = {
  title: "Pages/DetailPage",
  component: DetailPage,
  args: { resource: "recipes", id: fixtureId },
  decorators: [
    (Story, context) => (
      <AdminShell
        location={{ ...recipeLocation, resource: context.args.resource, id: context.args.id }}
      >
        <Story />
      </AdminShell>
    ),
  ],
} satisfies Meta<typeof DetailPage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <AdminApp
        authentication={fixtureAuth}
        dataSource={fixtureProvider}
        routerInstance={fixtureRouter(`/recipes/${fixtureId}`)}
      />
      <AdminApp
        authentication={fixtureAuth}
        dataSource={fixtureProvider}
        routerInstance={fixtureRouter(`/units/${fixtureId}`)}
      />
    </div>
  ),
};
export const Ingredient: Story = { args: { resource: "ingredients" } };
