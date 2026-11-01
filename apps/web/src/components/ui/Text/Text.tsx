import type { ComponentPropsWithRef } from "react";

export type TextProps = ComponentPropsWithRef<"p">;

export const Text = (props: TextProps) => <p {...props} />;
