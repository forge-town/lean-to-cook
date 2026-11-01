import type { PropsWithChildren } from "react";
import { useAppShellStore } from "./_store/appShellStore";
import { Link, useRouterState } from "@tanstack/react-router";
import { Maximize2, Minimize2, PanelLeft, PanelRight, ChevronDown } from "lucide-react";
import { Button } from "@repo/ui/button";
import {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
} from "@repo/ui/dropdown-menu";
import { cn } from "@repo/ui/lib/utils";
export type AppShellProps = PropsWithChildren;
const pages = [
  { to: "/", label: "首页" },
  { to: "/source-recipes", label: "菜谱" },
  { to: "/library", label: "证明库" },
  { to: "/simulator", label: "操作台" },
  { to: "/theories", label: "基础理论" },
] as const;
const scrollbarClass =
  "[&_*]:[scrollbar-width:thin] [&_*]:[scrollbar-color:#a1b19e80_transparent] supports-[selector(::-webkit-scrollbar)]:[&_*]:[scrollbar-width:auto] supports-[selector(::-webkit-scrollbar)]:[&_*]:[scrollbar-color:auto] [&_*::-webkit-scrollbar]:w-1 [&_*::-webkit-scrollbar]:h-1 [&_*::-webkit-scrollbar-track]:bg-transparent [&_*::-webkit-scrollbar-thumb]:rounded-full [&_*::-webkit-scrollbar-thumb]:bg-[#a1b19e]/50 [&_*::-webkit-scrollbar-thumb:hover]:bg-[#6e8b78]/70 [&_*::-webkit-scrollbar-button]:hidden [&_*::-webkit-scrollbar-corner]:bg-transparent";
const controlClass =
  "size-9 rounded-full border-0 bg-transparent p-0 text-leaf shadow-none transition-[background-color,transform] duration-150 ease-kitchen hover:bg-egg/50 active:scale-90 aria-pressed:bg-egg/55 focus-visible:ring-tomato motion-reduce:transition-none";
export const AppShell = ({ children }: AppShellProps) => {
  const pathname = useRouterState({ select: (state) => state.location.pathname });
  const toolbarActive = useAppShellStore((s) => s.headerToolbarActive);
  const handleHeaderTitleRef = useAppShellStore((s) => s.handleHeaderTitleTargetRef);
  const handleHeaderTargetRef = useAppShellStore((s) => s.handleHeaderToolbarTargetRef);
  const left = useAppShellStore((s) => s.left);
  const right = useAppShellStore((s) => s.right);
  const focus = useAppShellStore((s) => s.focus);
  const mobilePanel = useAppShellStore((s) => s.mobilePanel);
  const handleLeftButtonClick = useAppShellStore((s) => s.handleLeftButtonClick);
  const handleRightButtonClick = useAppShellStore((s) => s.handleRightButtonClick);
  const handleFocusButtonClick = useAppShellStore((s) => s.handleFocusButtonClick);
  const handleBackdropButtonClick = useAppShellStore((s) => s.handleBackdropButtonClick);
  const handleShellClickCapture = useAppShellStore((s) => s.handleShellClickCapture);
  const currentPage =
    pathname === "/"
      ? "首页"
      : pathname === "/theories"
        ? "基础理论"
        : pathname === "/library" || pathname.startsWith("/recipes/")
          ? "证明库"
          : pathname === "/simulator" || pathname.startsWith("/source-workbench/")
            ? "操作台"
            : "菜谱";
  const hasLeft = pathname !== "/" && !pathname.startsWith("/catalog/");
  const hasRight =
    pathname === "/theories" ||
    pathname === "/simulator" ||
    pathname.startsWith("/recipes/") ||
    pathname.startsWith("/source-workbench/") ||
    pathname.startsWith("/source-recipe/");

  return (
    <div
      className={cn(
        scrollbarClass,
        "group/shell flex h-dvh min-h-0 flex-col overflow-hidden bg-paper font-sans text-ink motion-reduce:[&_*]:animate-none motion-reduce:[&_*]:transition-none [&:has(:focus-visible)_[data-decorative-motion]]:animate-none [&:has(:focus-visible)_[data-decorative-motion]_*]:animate-none [&:has(:focus-visible)_*]:transition-none [&:has(:focus-visible)_[data-testid=home-opening]]:hidden",
      )}
      data-focus={focus}
      data-left={!focus && left}
      data-mobile-panel={mobilePanel}
      data-right={!focus && right}
      data-testid="app-shell"
      onClickCapture={handleShellClickCapture}
    >
      <header
        className={cn(
          "relative z-40 grid shrink-0 grid-cols-[1fr_auto_1fr] items-center border-b border-border/70 bg-paper px-3 sm:px-6",
          focus ? "h-14" : "h-16",
        )}
      >
        <Link
          aria-label="Lean to Cook 首页"
          className={cn(
            "group/brand flex w-fit min-w-0 items-center gap-2 text-ink no-underline",
            focus && "invisible",
          )}
          to="/"
        >
          <img
            alt=""
            className="size-10 object-contain transition-transform duration-200 ease-kitchen group-hover/brand:-rotate-12 motion-reduce:transition-none"
            height={40}
            src="/brand/cook-mark.png"
            width={40}
          />
          <span
            className={cn(
              "hidden whitespace-nowrap font-display text-2xl font-semibold",
              toolbarActive ? "xl:block" : "sm:block",
            )}
          >
            Lean to Cook
          </span>
        </Link>
        <div className="flex min-w-0 items-center justify-center gap-3">
          <div ref={handleHeaderTitleRef} className="min-w-0" />
          <div
            aria-label={toolbarActive ? "菜谱操作与布局" : "操作台布局"}
            className={cn(
              "flex items-center gap-1 rounded-full border border-border bg-surface p-1 shadow-[0_3px_0_#eadfca]",
              toolbarActive && "max-sm:gap-0.5",
            )}
            role="toolbar"
          >
            <div
              ref={handleHeaderTargetRef}
              className="flex items-center"
              data-testid="workspace-header-slot"
            />
            {toolbarActive && <span aria-hidden="true" className="mx-1 h-5 w-px bg-border" />}
            <Button
              aria-label="切换左侧栏"
              aria-pressed={left}
              className={cn(controlClass, toolbarActive && "max-sm:size-8")}
              disabled={!hasLeft || focus}
              title="切换左侧栏"
              variant="ghost"
              onClick={handleLeftButtonClick}
            >
              <PanelLeft aria-hidden="true" className="size-4" />
            </Button>
            <Button
              aria-label={focus ? "退出专注模式" : "专注模式"}
              aria-pressed={focus}
              className={cn(controlClass, toolbarActive && "max-sm:size-8")}
              title={focus ? "退出专注模式" : "专注模式"}
              variant="ghost"
              onClick={handleFocusButtonClick}
            >
              {focus ? (
                <Minimize2 aria-hidden="true" className="size-4" />
              ) : (
                <Maximize2 aria-hidden="true" className="size-4" />
              )}
            </Button>
            <Button
              aria-label="切换右侧栏"
              aria-pressed={right}
              className={cn(controlClass, toolbarActive && "max-sm:size-8")}
              disabled={!hasRight || focus}
              title="切换右侧栏"
              variant="ghost"
              onClick={handleRightButtonClick}
            >
              <PanelRight aria-hidden="true" className="size-4" />
            </Button>
          </div>
        </div>
        <div className="flex items-center justify-self-end gap-2 sm:gap-4">
          <div className={cn(focus && "invisible")}>
            <DropdownMenu>
              <DropdownMenuTrigger
                render={
                  <Button
                    aria-label="切换页面"
                    className="gap-2 rounded-full border-border bg-surface px-2 sm:px-4 text-ink shadow-none hover:border-leaf/25 hover:bg-leaf/8 hover:text-leaf aria-expanded:border-leaf/25 aria-expanded:bg-leaf/10 aria-expanded:text-leaf transition-transform duration-150 active:scale-95 motion-reduce:transition-none"
                    variant="outline"
                  />
                }
              >
                <span className={cn(toolbarActive && "sr-only sm:not-sr-only")}>{currentPage}</span>
                <ChevronDown aria-hidden="true" className="size-3.5" />
              </DropdownMenuTrigger>
              <DropdownMenuContent
                align="end"
                className="min-w-40 origin-[var(--transform-origin)] rounded-2xl border border-border bg-surface p-2 text-ink shadow-lg transition-[opacity,transform] duration-180 ease-kitchen data-[starting-style]:scale-95 data-[starting-style]:opacity-0 data-[ending-style]:scale-95 data-[ending-style]:opacity-0 motion-reduce:transition-none"
              >
                {pages.map((page) => (
                  <DropdownMenuItem
                    key={page.to}
                    className="rounded-xl px-3 py-2.5 text-sm focus:bg-leaf/8 focus:text-leaf data-highlighted:bg-leaf/8 data-highlighted:text-leaf aria-[current=page]:bg-leaf/10 aria-[current=page]:font-medium aria-[current=page]:text-leaf"
                    render={
                      <Link
                        aria-current={currentPage === page.label ? "page" : undefined}
                        to={page.to}
                      />
                    }
                  >
                    {page.label}
                  </DropdownMenuItem>
                ))}
              </DropdownMenuContent>
            </DropdownMenu>
          </div>
        </div>
      </header>
      <main
        key={pathname}
        className="relative min-h-0 min-w-0 flex-1 overflow-hidden motion-safe:animate-kitchen-arrive"
      >
        {mobilePanel !== "none" && (
          <Button
            aria-label="关闭侧栏"
            className="absolute inset-0 z-10 size-full rounded-none bg-ink/25 lg:hidden"
            variant="ghost"
            onClick={handleBackdropButtonClick}
          />
        )}{" "}
        {children}
      </main>
    </div>
  );
};
