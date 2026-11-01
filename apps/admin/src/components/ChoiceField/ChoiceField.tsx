import { useId } from "react";
import { useFormContext } from "react-hook-form";
import { FormField, FormItem, FormControl, FormLabel, FormMessage } from "@repo/ui/form";
import { Select, SelectTrigger, SelectValue, SelectContent, SelectItem } from "@repo/ui/select";
export const ChoiceField = ({
  name,
  label,
  options,
  disabled = false,
}: {
  name: string;
  label: string;
  options: { value: string; label: string }[];
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
            <Select
              disabled={disabled}
              items={options}
              name={field.name}
              value={field.value}
              // eslint-disable-next-line react/jsx-handler-names -- React Hook Form owns field.onChange.
              onValueChange={field.onChange}
            >
              <SelectTrigger aria-invalid={fieldState.invalid} id={id}>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {options.map((option) => (
                  <SelectItem key={option.value} value={option.value}>
                    {option.label}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </FormControl>
          <FormMessage />
        </FormItem>
      )}
    />
  );
};
