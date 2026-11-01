import type { ChangeEvent, ClipboardEvent } from "react";
import type { ControllerRenderProps, FieldValues, UseFormReturn } from "react-hook-form";
import { QuantityAmountSchema, RecipeInputSchema } from "@repo/schemas/catalog";

/** RHF input adapters; no persistence or independent field state. */
export const createNumericBindings = (
  form: UseFormReturn<FieldValues>,
  field: ControllerRenderProps,
  mode: "integer" | "decimal",
) => {
  const name = field.name;
  const change = field.onChange;
  const blur = field.onBlur;
  const draftPattern = /^\d*(\.\d*)?$/;
  const errorFor = (value: string): string | null => {
    if (value === "") return null;
    if (mode === "integer" && !/^\d+$/.test(value)) return "份数必须是整数";
    const parsed =
      mode === "integer"
        ? RecipeInputSchema.shape.servings.safeParse(Number(value))
        : QuantityAmountSchema.safeParse(value);

    return parsed.success ? null : (parsed.error.issues[0]?.message ?? "请填写有效数字");
  };
  const validate = (value: string) => {
    const message = errorFor(value);
    if (message) form.setError(name, { type: "validate", message });
    else form.clearErrors(name);
  };
  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const value = event.target.value;
    if (!draftPattern.test(value)) {
      form.setError(name, {
        type: "validate",
        message: "请只输入数字，小数用小数点分隔",
      });

      return;
    }
    change(event);
    if (value === "" || value.endsWith(".")) form.clearErrors(name);
    else validate(value);
  };
  const handleBlur = () => {
    blur();
    validate(String(form.getValues(name)));
  };
  const handlePaste = (event: ClipboardEvent<HTMLInputElement>) => {
    const pasted = event.clipboardData.getData("text");
    const input = event.currentTarget;
    const value = String(field.value ?? "");
    const next =
      value.slice(0, input.selectionStart ?? value.length) +
      pasted +
      value.slice(input.selectionEnd ?? value.length);
    if (!draftPattern.test(pasted) || errorFor(next)) {
      event.preventDefault();
      form.setError(name, {
        type: "validate",
        message: "请只粘贴数字，不要包含文字或其他符号",
      });
    }
  };

  return { onChange: handleChange, onBlur: handleBlur, onPaste: handlePaste };
};
