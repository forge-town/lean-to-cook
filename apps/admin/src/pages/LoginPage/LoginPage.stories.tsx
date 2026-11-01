import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { LoginPage } from "./LoginPage";
const meta = {
  title: "Pages/LoginPage/Components/LoginPage",
  component: LoginPage,
  args: {},
} satisfies Meta<typeof LoginPage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
const alternateArgs = {} satisfies ComponentProps<typeof LoginPage>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <LoginPage {...meta.args} />
      <LoginPage {...alternateArgs} />
    </div>
  ),
};
