import { createPortal } from "react-dom";
import { ChevronLeft, ChevronRight, RotateCcw } from "lucide-react";
import { Button } from "@repo/ui/button";
import { useAppShellStore } from "../AppShell/_store/appShellStore";
export interface WorkspaceHeaderProps {
  title: string;
  previousDisabled: boolean;
  nextDisabled: boolean;
  onResetButtonClick: () => void;
  onPreviousButtonClick: () => void;
  onNextButtonClick: () => void;
}
const buttonClass =
  "size-8 rounded-full border-0 bg-transparent p-0 text-leaf shadow-none transition-[background-color,transform] duration-150 ease-kitchen hover:bg-egg/50 active:scale-90 disabled:opacity-35 focus-visible:ring-tomato motion-reduce:transition-none sm:size-9";
export const WorkspaceHeader = ({
  title,
  previousDisabled,
  nextDisabled,
  onResetButtonClick: handleResetButtonClick,
  onPreviousButtonClick: handlePreviousButtonClick,
  onNextButtonClick: handleNextButtonClick,
}: WorkspaceHeaderProps) => {
  const target = useAppShellStore((state) => state.headerToolbarTarget);
  const titleTarget = useAppShellStore((state) => state.headerTitleTarget);
  const handleContentRef = useAppShellStore((state) => state.handleHeaderToolbarContentRef);
  if (!target || !titleTarget) return null;

  return (
    <>
      {createPortal(
        <h1
          className="hidden max-w-32 truncate font-['Kaiti_SC',STKaiti,KaiTi,serif] text-xl font-medium tracking-wide sm:block lg:max-w-40"
          title={title}
        >
          {title}
        </h1>,
        titleTarget
      )}
      {createPortal(
        <div
          ref={handleContentRef}
          aria-label="菜谱操作"
          className="flex items-center gap-1"
          data-testid="workspace-header-controls"
          role="group"
        >
          <Button
            aria-label="重置"
            className={buttonClass}
            title="重置"
            variant="ghost"
            onClick={handleResetButtonClick}
          >
            <RotateCcw aria-hidden="true" className="size-4" />
          </Button>
          <Button
            aria-label="上一步"
            className={buttonClass}
            disabled={previousDisabled}
            title="上一步"
            variant="ghost"
            onClick={handlePreviousButtonClick}
          >
            <ChevronLeft aria-hidden="true" className="size-4" />
          </Button>
          <Button
            aria-label="下一步"
            className={buttonClass}
            disabled={nextDisabled}
            title="下一步"
            variant="ghost"
            onClick={handleNextButtonClick}
          >
            <ChevronRight aria-hidden="true" className="size-4" />
          </Button>
        </div>,
        target
      )}
    </>
  );
};
