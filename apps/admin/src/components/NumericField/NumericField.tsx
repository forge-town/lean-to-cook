import { useId } from "react";
import { useFormContext } from "react-hook-form";
import { FormField, FormItem, FormControl, FormLabel, FormMessage } from "@repo/ui/form";
import { Input } from "@repo/ui/input";
import { createNumericBindings } from "./numericFieldBindings";
export type NumericFieldProps = {
  name: string;
  label: string;
  mode: "integer" | "decimal";
  placeholder?: string;
};
export const NumericField = ({ name, label, mode, placeholder }: NumericFieldProps) => {
  const form = useFormContext();
  const id = useId();

  return (
    <FormField
      control={form.control}
      name={name}
      render={({ field, fieldState }) => {
        const bindings = createNumericBindings(form, field, mode);

        return (
          <FormItem>
            <FormLabel htmlFor={id}>{label}</FormLabel>
            <FormControl>
              <Input
                {...field}
                aria-invalid={fieldState.invalid}
                id={id}
                inputMode={mode === "integer" ? "numeric" : "decimal"}
                placeholder={placeholder}
                type="text"
                {...bindings}
              />
            </FormControl>
            <FormMessage />
          </FormItem>
        );
      }}
    />
  );
};
