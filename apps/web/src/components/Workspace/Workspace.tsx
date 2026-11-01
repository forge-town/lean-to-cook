import { useId, type CSSProperties, type PropsWithChildren, type ReactNode } from "react";
import { cn } from "@repo/ui/lib/utils";
import { useAppShellStore } from "../AppShell/_store/appShellStore";
import { WorkspaceDivider } from "./WorkspaceDivider";
export type WorkspaceProps = PropsWithChildren<{
  left?: ReactNode;
  right?: ReactNode;
  className?: string;
}>;
export const Workspace = ({ left, right, children, className }: WorkspaceProps) => {
  const id = useId();
  const leftOpen = useAppShellStore((state) => state.left);
  const rightOpen = useAppShellStore((state) => state.right);
  const focus = useAppShellStore((state) => state.focus);
  const leftWidth = useAppShellStore((state) => state.leftWidth);
  const rightWidth = useAppShellStore((state) => state.rightWidth);
  const dragging = useAppShellStore((state) => state.paneDrag !== null);
  const showLeft = !!left && leftOpen && !focus;
  const showRight = !!right && rightOpen && !focus;
  const columns = `${showLeft ? `${leftWidth}% 1px ` : ""}minmax(0,1fr)${showRight ? ` 1px ${rightWidth}%` : ""}`;

  return (
    <div
      className={cn(
        "relative grid h-full min-h-0 min-w-0 grid-cols-1 gap-0 overflow-hidden p-0 lg:grid-cols-[var(--workspace-columns)]",
        dragging && "cursor-col-resize select-none [&_*]:cursor-col-resize",
        className
      )}
      data-workspace=""
      style={{ "--workspace-columns": columns } as CSSProperties}
    >
      {left && (
        <aside
          aria-label="目录"
          className={cn(
            "absolute inset-y-0 left-0 z-20 hidden w-[min(85vw,18rem)] min-w-0 flex-col overflow-y-auto border-r border-border bg-surface lg:relative lg:z-0 lg:w-auto lg:border-0 max-lg:group-data-[mobile-panel=left]/shell:flex max-lg:group-data-[mobile-panel=left]/shell:motion-safe:animate-kitchen-arrive",
            showLeft ? "lg:flex" : "lg:hidden"
          )}
          id={`${id}-left`}
        >
          {left}
        </aside>
      )}
      {showLeft && <WorkspaceDivider panelId={`${id}-left`} side="left" />}
      <section
        aria-label="工作区"
        className="flex min-h-0 min-w-0 flex-col overflow-hidden bg-surface/60"
      >
        {children}
      </section>
      {showRight && <WorkspaceDivider panelId={`${id}-right`} side="right" />}
      {right && (
        <aside
          aria-label="详情面板"
          className={cn(
            "absolute inset-y-0 right-0 z-20 hidden w-[min(85vw,22rem)] min-w-0 flex-col overflow-y-auto border-l border-border bg-surface lg:relative lg:z-0 lg:w-auto lg:border-0 max-lg:group-data-[mobile-panel=right]/shell:flex max-lg:group-data-[mobile-panel=right]/shell:motion-safe:animate-kitchen-arrive",
            showRight ? "lg:flex" : "lg:hidden"
          )}
          id={`${id}-right`}
        >
          {right}
        </aside>
      )}
    </div>
  );
};
