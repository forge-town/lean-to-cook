import { useAppShellStore } from "../../AppShell/_store/appShellStore";
import { paneResizeLimits } from "../../AppShell/_store/paneResizeSlice";
export type WorkspaceDividerProps = { side: "left" | "right"; panelId: string };
export const WorkspaceDivider = ({ side, panelId }: WorkspaceDividerProps) => {
  const leftWidth = useAppShellStore((state) => state.leftWidth);
  const rightWidth = useAppShellStore((state) => state.rightWidth);
  const dragging = useAppShellStore((state) => state.paneDrag?.side === side);
  const handleDividerPointerDown = useAppShellStore((state) => state.handleDividerPointerDown);
  const handleDividerPointerMove = useAppShellStore((state) => state.handleDividerPointerMove);
  const handleDividerPointerUp = useAppShellStore((state) => state.handleDividerPointerUp);
  const handleDividerPointerCancel = useAppShellStore((state) => state.handleDividerPointerCancel);
  const handleDividerLostPointerCapture = useAppShellStore(
    (state) => state.handleDividerLostPointerCapture
  );
  const handleDividerKeyDown = useAppShellStore((state) => state.handleDividerKeyDown);
  const handleDividerDoubleClick = useAppShellStore((state) => state.handleDividerDoubleClick);

  return (
    <div
      aria-controls={panelId}
      aria-label={side === "left" ? "调整目录宽度" : "调整详情宽度"}
      aria-orientation="vertical"
      aria-valuemax={paneResizeLimits[side].max}
      aria-valuemin={paneResizeLimits[side].min}
      aria-valuenow={Math.round(side === "left" ? leftWidth : rightWidth)}
      aria-valuetext={`${Math.round(side === "left" ? leftWidth : rightWidth)}%`}
      className="relative z-30 hidden w-px touch-none cursor-col-resize bg-border outline-none before:absolute before:-inset-x-1 before:inset-y-0 hover:bg-leaf focus-visible:bg-leaf focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-leaf data-[dragging=true]:bg-leaf lg:block"
      data-dragging={dragging}
      data-side={side}
      role="separator"
      tabIndex={0}
      title="拖拽调整宽度，双击复位"
      onDoubleClick={handleDividerDoubleClick}
      onKeyDown={handleDividerKeyDown}
      onLostPointerCapture={handleDividerLostPointerCapture}
      onPointerCancel={handleDividerPointerCancel}
      onPointerDown={handleDividerPointerDown}
      onPointerMove={handleDividerPointerMove}
      onPointerUp={handleDividerPointerUp}
    />
  );
};
