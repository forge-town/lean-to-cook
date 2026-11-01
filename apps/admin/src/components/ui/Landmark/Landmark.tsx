import type { HTMLAttributes } from "react";
export const Landmark = ({
  as: Tag = "main",
  ...props
}: HTMLAttributes<HTMLElement> & {
  as?: "main" | "aside" | "header" | "nav" | "section" | "footer";
}) => <Tag {...props} />;
