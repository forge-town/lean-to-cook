import type { ComponentPropsWithoutRef } from "react";
import { cn } from "@repo/ui/lib/utils";
export type OpeningSequenceProps = ComponentPropsWithoutRef<"div">;
export const OpeningSequence = ({ className, ...props }: OpeningSequenceProps) => (
  <div
    {...props}
    aria-hidden="true"
    className={cn(
      "pointer-events-none absolute inset-0 z-30 flex animate-kitchen-opening flex-col items-center justify-center overflow-hidden bg-paper motion-reduce:hidden",
      className
    )}
    data-testid="home-opening"
  >
    <div className="relative mb-8 flex size-52 items-center justify-center rounded-full bg-egg/35 sm:size-64">
      <img
        alt=""
        className="size-40 animate-kitchen-pop object-contain sm:size-48"
        height={192}
        src="/brand/cook-mark.png"
        width={192}
      />
      <img
        alt=""
        className="absolute -left-7 top-4 size-20 animate-kitchen-toss [animation-delay:100ms]"
        height={80}
        src="/ingredient-icons/fluent-flat/tomato.svg"
        width={80}
      />
      <img
        alt=""
        className="absolute -right-5 bottom-0 size-20 animate-kitchen-toss [animation-delay:220ms]"
        height={80}
        src="/ingredient-icons/fluent-flat/egg.svg"
        width={80}
      />
    </div>
    <div className="animate-kitchen-arrive font-display text-5xl font-semibold tracking-tight [animation-delay:250ms] sm:text-6xl">
      Lean to <em className="text-tomato">Cook.</em>
    </div>
    <div className="mt-5 animate-kitchen-arrive text-xl font-semibold text-leaf [animation-delay:400ms]">
      步步有数，道道靠谱
    </div>
  </div>
);
