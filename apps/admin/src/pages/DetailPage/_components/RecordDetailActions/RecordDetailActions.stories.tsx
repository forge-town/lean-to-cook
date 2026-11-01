import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { Sheet } from "@repo/ui/sheet";
import { RecordDetailActions } from "./RecordDetailActions";
import { AdminShell } from "../../../../components/AdminShell";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureRecipe,
  fixtureAuth,
  fixtureProvider,
  recipeLocation,
} from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/DetailPage/Components/RecordDetailActions",
  component: RecordDetailActions,
  args: { record: fixtureRecipe, busy: false },
  decorators: [
    (Story, context) => (
      <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
        <AdminShell location={{ ...recipeLocation, id: fixtureRecipe.id }}>
          <EditorPageStoreProvider options={{ ...editorOptions, record: context.args.record }}>
            <Sheet>
              <Story />
            </Sheet>
          </EditorPageStoreProvider>
        </AdminShell>
      </Refine>
    ),
  ],
} satisfies Meta<typeof RecordDetailActions>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <RecordDetailActions record={fixtureRecipe} />
      <RecordDetailActions record={{ ...fixtureRecipe, publication: "published" }} />
    </>
  ),
};
export const Busy: Story = { args: { busy: true } };
