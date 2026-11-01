import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine, type BaseRecord } from "@refinedev/core";
import { StorybookRouter } from "../../storybook/StorybookRouter";
import { PublishedRecipePage } from "./PublishedRecipePage";
import { publishedRecipeFixture, publishedRecipeFixtureProvider } from "./publishedRecipeFixtures";
const meta = {
  title: "Pages/PublishedRecipePage",
  component: PublishedRecipePage,
  args: { id: publishedRecipeFixture.id },
  decorators: [
    (Story) => (
      <StorybookRouter>
        <Refine dataProvider={publishedRecipeFixtureProvider} options={{ disableTelemetry: true }}>
          <Story />
        </Refine>
      </StorybookRouter>
    ),
  ],
} satisfies Meta<typeof PublishedRecipePage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const Unavailable: Story = {
  decorators: [
    (Story) => (
      <Refine
        dataProvider={{
          ...publishedRecipeFixtureProvider,
          getOne: async () => {
            throw new Error("这道菜谱尚未发布");
          },
        }}
      >
        <Story />
      </Refine>
    ),
  ],
};

export const BaseUsage: Story = {
  render: () => (
    <>
      <PublishedRecipePage id={publishedRecipeFixture.id} />
      <Refine
        dataProvider={{
          ...publishedRecipeFixtureProvider,
          getOne: async () => {
            throw new Error("这道菜谱尚未发布");
          },
        }}
      >
        <PublishedRecipePage id="4a5514f4-0e67-45a1-ac6a-00646c8a8a69" />
      </Refine>
    </>
  ),
};

export const Loading: Story = {
  decorators: [
    (Story) => (
      <Refine
        dataProvider={{
          ...publishedRecipeFixtureProvider,
          getOne: async () => new Promise<never>(() => undefined),
        }}
      >
        <Story />
      </Refine>
    ),
  ],
};
export const LongContent: Story = {
  decorators: [
    (Story) => (
      <Refine
        dataProvider={{
          ...publishedRecipeFixtureProvider,
          getOne: async <T extends BaseRecord>() => ({
            data: {
              ...publishedRecipeFixture,
              values: {
                ...publishedRecipeFixture.values,
                notes: "倒入奶油时放低高度，让奶油均匀漂浮在饮料表面。".repeat(80),
              },
            } as BaseRecord as T,
          }),
        }}
      >
        <Story />
      </Refine>
    ),
  ],
};
