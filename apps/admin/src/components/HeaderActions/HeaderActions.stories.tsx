import type { Meta, StoryObj } from "@storybook/react-vite";
import { Button } from "@repo/ui/button";
import { HeaderActions } from "./HeaderActions";
import { AdminShellStoreProvider } from "../AdminShell/_store";
import { AdminShellContent } from "../AdminShell/_components/AdminShellContent";
import { recipeLocation } from "../../storybook/fixtures";
const meta = {
  title: "Components/HeaderActions",
  component: HeaderActions,
  args: { children: <Button>编辑</Button> },
  decorators: [
    (Story) => (
      <AdminShellStoreProvider logout={async () => ({ success: true })}>
        <AdminShellContent location={{ ...recipeLocation, id: "record" }} recordName="番茄炒蛋">
          <Story />
        </AdminShellContent>
      </AdminShellStoreProvider>
    ),
  ],
} satisfies Meta<typeof HeaderActions>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <HeaderActions>
      <Button>编辑</Button>
      <Button disabled variant="outline">
        发布
      </Button>
    </HeaderActions>
  ),
};
