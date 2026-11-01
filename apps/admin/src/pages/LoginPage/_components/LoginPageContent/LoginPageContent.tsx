import { useForm } from "react-hook-form";
import { Form } from "@repo/ui/form";
import { Button } from "@repo/ui/button";
import { Typography } from "../../../../components/ui/Typography";
import { SurfaceForm } from "../../../../components/ui/SurfaceForm";
import { Landmark } from "../../../../components/ui/Landmark";
import { TextField } from "../../../../components/TextField";
import { useLoginPageStore } from "../../_store";
export const LoginPageContent = () => {
  const formControl = useLoginPageStore((s) => s.formControl);
  const handleFormSubmit = useLoginPageStore((s) => s.handleFormSubmit);
  const form = useForm({ formControl: formControl.formControl });

  return (
    <Landmark className="login-layout">
      <div className="login-story">
        <Typography className="brand-wordmark">
          Lean to Cook
          <Typography as="span" className="brand-dot">
            .
          </Typography>
        </Typography>
        <div>
          <Typography as="h1">菜谱与食材</Typography>
        </div>
      </div>
      <div className="login-panel">
        <Typography as="h2">后台登录</Typography>
        <Form {...form}>
          <SurfaceForm onSubmit={form.handleSubmit(handleFormSubmit)}>
            <TextField label="管理员密码" name="password" type="password" />
            {form.formState.errors.root?.message && (
              <div className="error-banner" role="alert">
                {form.formState.errors.root.message}
              </div>
            )}
            <Button disabled={form.formState.isSubmitting} type="submit">
              {form.formState.isSubmitting ? "正在登录…" : "登录"}
            </Button>
          </SurfaceForm>
        </Form>
      </div>
    </Landmark>
  );
};
