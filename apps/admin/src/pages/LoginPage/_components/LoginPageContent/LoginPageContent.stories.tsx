import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { LoginPageContent } from "./LoginPageContent";
import { LoginPageStoreProvider } from "../../_store";
const meta = {
  title: "Pages/LoginPage/Components/LoginPageContent",
  component: LoginPageContent,
  args: {},
  decorators: [
    (Story) => (
      <LoginPageStoreProvider login={async () => ({ success: false })}>
        <Story />
      </LoginPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof LoginPageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
const alternateArgs = {} satisfies ComponentProps<typeof LoginPageContent>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <LoginPageContent {...meta.args} />
      <LoginPageContent {...alternateArgs} />
    </div>
  ),
};
