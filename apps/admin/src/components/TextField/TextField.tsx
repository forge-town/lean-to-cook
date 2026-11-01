import { useId } from "react";
import { useFormContext } from "react-hook-form";
import { FormField, FormItem, FormControl, FormLabel, FormMessage } from "@repo/ui/form";
import { Input } from "@repo/ui/input";
import { Textarea } from "@repo/ui/textarea";
export const TextField = ({
  name,
  label,
  multiline = false,
  type = "text",
  placeholder,
  disabled = false,
}: {
  name: string;
  label: string;
  multiline?: boolean;
  type?: string;
  placeholder?: string;
  disabled?: boolean;
}) => {
  const form = useFormContext();
  const id = useId();

  return (
    <FormField
      control={form.control}
      name={name}
      render={({ field, fieldState }) => (
        <FormItem>
          <FormLabel htmlFor={id}>{label}</FormLabel>
          <FormControl>
            {multiline ? (
              <Textarea
                {...field}
                aria-invalid={fieldState.invalid}
                disabled={disabled}
                id={id}
                placeholder={placeholder}
              />
            ) : (
              <Input
                {...field}
                aria-invalid={fieldState.invalid}
                autoComplete={type === "password" ? "current-password" : undefined}
                disabled={disabled}
                id={id}
                placeholder={placeholder}
                type={type}
              />
            )}
          </FormControl>
          <FormMessage />
        </FormItem>
      )}
    />
  );
};
