import { z } from "zod/v4";

/** Exact positive quantity, at most six fractional digits, up to one billion. */
export const QuantityAmountSchema = z
  .string()
  .trim()
  .regex(/^(0|[1-9]\d{0,9})(\.\d{1,6})?$/, "数量需为普通十进制数字，最多六位小数")
  .refine((value) => {
    if (!/^(0|[1-9]\d{0,9})(\.\d{1,6})?$/.test(value)) return false;
    const [whole = "0", fraction = ""] = value.split(".");
    const scaled = BigInt(whole) * 1_000_000n + BigInt(fraction.padEnd(6, "0"));

    return scaled > 0n && scaled <= 1_000_000_000_000_000n;
  }, "数量需大于 0，且不超过 1000000000")
  .transform((value) =>
    value.includes(".") ? value.replace(/0+$/, "").replace(/\.$/, "") : value,
  );
export type QuantityAmount = z.infer<typeof QuantityAmountSchema>;
