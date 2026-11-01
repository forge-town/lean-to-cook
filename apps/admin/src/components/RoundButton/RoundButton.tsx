import { forwardRef, type ComponentPropsWithoutRef } from "react";
import { Button } from "@repo/ui/button";
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from "@repo/ui/tooltip";
import { cn } from "@repo/ui/lib/utils";
export type RoundButtonProps = Omit<
  ComponentPropsWithoutRef<typeof Button>,
  "aria-label" | "size"
> & { label: string };
export const RoundButton = forwardRef<HTMLButtonElement, RoundButtonProps>(
  ({ label, children, className, variant = "outline", type = "button", ...props }, ref) => (
    <TooltipProvider delay={250}>
      <Tooltip>
        <TooltipTrigger
          render={
            <Button
              {...props}
              ref={ref}
              aria-label={label}
              className={cn("detail-action-button", className)}
              size="icon"
              type={type}
              variant={variant}
            />
          }
        >
          {children}
        </TooltipTrigger>
        <TooltipContent side="bottom">{label}</TooltipContent>
      </Tooltip>
    </TooltipProvider>
  ),
);
RoundButton.displayName = "RoundButton";
