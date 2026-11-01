import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { LoginPageStoreProvider } from "./LoginPageStoreProvider";
const meta = {
  title: "Pages/LoginPage/Components/LoginPageStoreProvider",
  component: LoginPageStoreProvider,
  args: { login: async () => ({ success: false }), children: "登录表单状态" },
} satisfies Meta<typeof LoginPageStoreProvider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { login: async () => ({ success: false }), children: "登录表单状态" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  login: async () => ({ success: false }),
  children: "登录表单状态",
} satisfies ComponentProps<typeof LoginPageStoreProvider>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <LoginPageStoreProvider {...meta.args} />
      <LoginPageStoreProvider {...alternateArgs} />
    </div>
  ),
};
