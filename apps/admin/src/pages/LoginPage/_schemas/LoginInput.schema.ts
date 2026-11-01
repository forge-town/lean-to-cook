import { z } from "zod/v4";
/** Administrator password input; never persisted to browser storage. */
export const LoginInputSchema = z.object({
  /** Current administrator secret. */ password: z.string().min(1, "请填写管理员密码").max(256),
});
export type LoginInput = z.infer<typeof LoginInputSchema>;
