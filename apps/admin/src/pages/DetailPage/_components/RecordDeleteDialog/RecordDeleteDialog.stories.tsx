import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { RecordDeleteDialog } from "./RecordDeleteDialog";
import { RecordEditDrawer } from "../RecordEditDrawer";
import { AdminShell } from "../../../../components/AdminShell";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureRecipe,
  detailFor,
  fixtureAuth,
  fixtureProvider,
  recipeLocation,
} from "../../../../storybook/fixtures";
const ingredient = {
  ...detailFor("ingredients"),
  references: [{ kind: "recipe" as const, id: fixtureRecipe.id, name: "番茄炒蛋", code: null }],
};
const meta = {
  title: "Pages/DetailPage/Components/RecordDeleteDialog",
  component: RecordDeleteDialog,
  args: { record: fixtureRecipe, busy: false },
  decorators: [
    (Story, context) => (
      <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
        <AdminShell
          location={{
            ...recipeLocation,
            resource: context.args.record.resource,
            id: fixtureRecipe.id,
          }}
        >
          <EditorPageStoreProvider
            options={{
              ...editorOptions,
              resource: context.args.record.resource,
              record: context.args.record,
            }}
          >
            <RecordEditDrawer record={context.args.record} resource={context.args.record.resource}>
              <div>基本信息</div>
            </RecordEditDrawer>
            <Story />
          </EditorPageStoreProvider>
        </AdminShell>
      </Refine>
    ),
  ],
} satisfies Meta<typeof RecordDeleteDialog>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { ...meta.args },
  play: async ({ canvas }) => {
    await canvas.getByRole("button", { name: "删除" }).click();
  },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <RecordDeleteDialog record={fixtureRecipe} />
      <RecordDeleteDialog record={ingredient} />
    </>
  ),
};
export const InUse: Story = { args: { record: ingredient }, play: Base.play };
export const Busy: Story = { args: { busy: true }, play: Base.play };
