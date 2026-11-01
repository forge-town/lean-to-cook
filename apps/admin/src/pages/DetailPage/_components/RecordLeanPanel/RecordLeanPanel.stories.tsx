import { leanStoryProvider } from "../../../../storybook/leanStoryProvider";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { RecordLeanPanel } from "./RecordLeanPanel";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  fixtureRecipe,
  fixtureAuth,
  editorOptions,
  detailFor,
} from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/DetailPage/Components/RecordLeanPanel",
  component: RecordLeanPanel,
  args: { record: fixtureRecipe, checking: false },
  decorators: [
    (Story, context) => (
      <Refine
        authProvider={fixtureAuth}
        dataProvider={leanStoryProvider(
          context.args.record,
          String(context.parameters.leanScenario ?? ""),
        )}
      >
        <EditorPageStoreProvider
          options={{
            ...editorOptions,
            resource: context.args.record.resource,
            record: context.args.record,
          }}
        >
          <Story />
        </EditorPageStoreProvider>
      </Refine>
    ),
  ],
} satisfies Meta<typeof RecordLeanPanel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Ingredient: Story = { args: { record: detailFor("ingredients") } };
export const Loading: Story = { parameters: { leanScenario: "loading" } };

export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <EditorPageStoreProvider options={editorOptions}>
        <RecordLeanPanel record={fixtureRecipe} />
      </EditorPageStoreProvider>
      <EditorPageStoreProvider
        options={{ ...editorOptions, resource: "ingredients", record: detailFor("ingredients") }}
      >
        <RecordLeanPanel record={detailFor("ingredients")} />
      </EditorPageStoreProvider>
    </>
  ),
};

export const LongContent: Story = { parameters: { leanScenario: "long" } };
