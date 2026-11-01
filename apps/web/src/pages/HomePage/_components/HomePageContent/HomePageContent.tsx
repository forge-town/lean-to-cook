import { Link } from "@tanstack/react-router";
import { OpeningSequence } from "../OpeningSequence";
export const HomePageContent = () => (
  <div
    data-decorative-motion
    className="relative grid h-full min-h-0 overflow-auto lg:grid-cols-[1.15fr_1fr]"
  >
    <OpeningSequence />
    <section className="relative z-10 flex min-h-0 flex-col justify-center px-7 py-10 sm:px-12 lg:px-16">
      <div className="font-display text-[clamp(3.5rem,6.5vw,7rem)] leading-none tracking-tight text-ink motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:1000ms]">
        Lean to <em className="text-tomato">Cook.</em>
      </div>
      <h1 className="mt-8 text-3xl font-bold tracking-tight motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:1100ms] sm:text-4xl">
        步步有数，道道靠谱
      </h1>
      <p className="mt-5 text-base leading-8 text-muted motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:1150ms]">
        用交互菜谱学做饭，用 Lean 推演烹饪过程。
      </p>
      <div className="mt-9 flex flex-wrap items-center gap-6 motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:1200ms]">
        <Link
          className="rounded-full bg-tomato px-7 py-4 text-base font-semibold text-white shadow-[0_5px_0_#b94025] transition-transform duration-150 ease-kitchen hover:-translate-y-1 active:translate-y-1 active:shadow-none motion-reduce:transform-none motion-reduce:transition-none"
          to="/source-recipes"
        >
          打开菜谱库
        </Link>
        <Link
          className="border-b-2 border-egg py-3 text-sm font-medium text-ink transition-colors hover:text-tomato"
          search={{ recipe: "tomato-scrambled-eggs" }}
          to="/simulator"
        >
          先试一道西红柿炒鸡蛋
        </Link>
      </div>
      <div className="mt-12 flex flex-wrap gap-3 text-sm font-medium text-leaf motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:1250ms]">
        <Link
          aria-label="进入证明库"
          className="rounded-full bg-leaf/8 px-5 py-2.5 transition-colors hover:bg-egg/40"
          to="/library"
        >
          证明库
        </Link>
        <Link
          className="rounded-full bg-leaf/8 px-5 py-2.5 transition-colors hover:bg-egg/40"
          to="/theories"
        >
          基础理论
        </Link>
      </div>
    </section>
    <section
      aria-label="烹饪与校验"
      className="relative hidden min-h-0 items-center justify-center overflow-hidden p-12 lg:flex"
    >
      <div className="relative flex aspect-square w-full max-w-lg items-center justify-center rounded-full border-[14px] border-surface bg-egg/35 shadow-[0_16px_0_#efdfb6] motion-safe:animate-kitchen-pop motion-safe:[animation-delay:900ms]">
        <div
          aria-hidden="true"
          className="absolute inset-5 rounded-full border-2 border-dashed border-egg/80"
        />
        <img
          alt="烹饪锅具与校验标记"
          className="relative w-[76%] object-contain"
          height={1024}
          src="/brand/cook-mark.png"
          width={1024}
        />
        <img
          alt=""
          className="absolute -left-3 top-[12%] size-24 -rotate-12 drop-shadow-lg motion-safe:animate-kitchen-float"
          height={96}
          src="/ingredient-icons/fluent-flat/tomato.svg"
          width={96}
        />
        <img
          alt=""
          className="absolute -right-1 bottom-[10%] size-24 rotate-12 drop-shadow-lg motion-safe:animate-kitchen-float motion-safe:[animation-delay:-2200ms]"
          height={96}
          src="/ingredient-icons/fluent-flat/egg.svg"
          width={96}
        />
        <span aria-hidden="true" className="absolute right-7 top-4 size-5 rounded-full bg-tomato" />
      </div>
    </section>
  </div>
);
