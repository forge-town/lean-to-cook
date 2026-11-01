import type { HTMLAttributes } from "react";
export const Typography = ({
  as: Tag = "p",
  ...props
}: HTMLAttributes<HTMLElement> & { as?: "h1" | "h2" | "h3" | "p" | "span" | "small" }) => (
  <Tag {...props} />
);
