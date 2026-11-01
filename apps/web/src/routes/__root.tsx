import { createRootRoute } from "@tanstack/react-router";
import appCss from "../tailwind.css?url";
import { NotFound } from "./-NotFound";
import { RootDocument } from "./-RootDocument";

export const Route = createRootRoute({
  head: () => ({
    meta: [
      { charSet: "utf8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { title: "Lean to Cook — 可证明的家常菜" },
      {
        name: "description",
        content: "Lean to Cook：用交互菜谱学做饭，用 Lean 推演烹饪过程。",
      },
    ],
    links: [
      { rel: "stylesheet", href: appCss },
      { rel: "icon", href: "/brand/cook-mark.png", type: "image/png" },
    ],
  }),

  notFoundComponent: NotFound,
  shellComponent: RootDocument,
});
