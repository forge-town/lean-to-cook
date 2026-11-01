import type { Meta, StoryObj } from "@storybook/react-vite";
import { RecordEditDrawer } from "./RecordEditDrawer";
import { DetailPageContent } from "../DetailPageContent";
import { AdminShell } from "../../../../components/AdminShell";
import { AdminApp } from "../../../../components/AdminApp";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureRecipe,
  fixtureProvider,
  fixtureAuth,
  recipeLocation,
  fixtureId,
} from "../../../../storybook/fixtures";
import { fixtureRouter } from "../../../../storybook/fixtureRouter";
const meta = {
  title: "Pages/DetailPage/Components/RecordEditDrawer",
  component: RecordEditDrawer,
  args: {
    record: fixtureRecipe,
    resource: "recipes",
    mutationPending: false,
    children: <DetailPageContent record={fixtureRecipe} />,
  },
  decorators: [
    (Story) => (
      <AdminShell location={{ ...recipeLocation, id: fixtureId }}>
        <EditorPageStoreProvider options={editorOptions}>
          <Story />
        </EditorPageStoreProvider>
      </AdminShell>
    ),
  ],
} satisfies Meta<typeof RecordEditDrawer>;
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
        routerInstance={fixtureRouter(`/ingredients/${fixtureId}`)}
      />
    </div>
  ),
};
export const Open: Story = {
  play: async ({ canvas }) => {
    canvas.getByRole("button", { name: "编辑" }).click();
  },
};
