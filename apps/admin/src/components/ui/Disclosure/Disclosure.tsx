import type { ReactNode } from "react";
export const Disclosure = ({ title, children }: { title: string; children: ReactNode }) => (
  <details className="source-disclosure">
    <summary>{title}</summary>
    {children}
  </details>
);
