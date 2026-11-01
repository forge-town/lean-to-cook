import { createFormControl } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { ResultAsync } from "neverthrow";
import type { StateCreator } from "zustand";
import { LoginInputSchema, type LoginInput } from "../_schemas/LoginInput.schema";
import { navigation } from "../../../lib/navigation";
export interface LoginPageSlice {
  formControl: ReturnType<typeof createFormControl<LoginInput>>;
  handleFormSubmit: (values: LoginInput) => Promise<void>;
}
export const createLoginPageSlice =
  (
    login: (
      values: LoginInput,
    ) => Promise<{ success: boolean; error?: Error | { message: string } }>,
  ): StateCreator<LoginPageSlice> =>
  () => {
    const formControl = createFormControl<LoginInput>({
      resolver: zodResolver(LoginInputSchema),
      defaultValues: { password: "" },
    });

    return {
      formControl,
      handleFormSubmit: async (values) => {
        const result = await ResultAsync.fromPromise(
          login({ ...values }),
          () => new Error("无法连接后台，请稍后重试"),
        );
        result.match(
          (value) => {
            if (value.success) navigation.reload();
            else
              formControl.setError("root", { message: value.error?.message ?? "登录失败，请重试" });
          },
          (error) => formControl.setError("root", { message: error.message }),
        );
      },
    };
  };
