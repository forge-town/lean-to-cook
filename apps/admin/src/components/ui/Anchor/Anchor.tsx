import type { AnchorHTMLAttributes } from "react";
import { Link, useRouter } from "@tanstack/react-router";
export const Anchor = ({ href, ...props }: AnchorHTMLAttributes<HTMLAnchorElement>) => {
  const router = useRouter({ warn: false });
  if (router && href?.startsWith("/") && !props.target && !props.download)
    return <Link {...props} to={href} />;

  return <a {...props} href={href} />;
};
