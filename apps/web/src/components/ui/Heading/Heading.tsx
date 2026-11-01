import type { ComponentPropsWithRef } from "react";

export interface HeadingProps extends ComponentPropsWithRef<"h1"> {
  level?: 1 | 2;
}

export const Heading = ({ level = 1, ...props }: HeadingProps) =>
  level === 1 ? <h1 {...props} /> : <h2 {...props} />;
