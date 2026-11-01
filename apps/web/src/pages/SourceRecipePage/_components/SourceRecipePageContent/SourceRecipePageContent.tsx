import type { SourceRecipe } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import Markdown from "react-markdown";
import remarkGfm from "remark-gfm";
import rehypeSlug from "rehype-slug";
import { Workspace } from "@/components/Workspace";
import { panelTitleClass } from "@/components/Workspace/workspaceClasses";
import { getFormalizedRecipe, sourceRecipeCategoryLabels } from "@/sourceRecipePresentation";
import { getSourceRecipeThumbnail } from "../../../SourceRecipeLibraryPage/sourceRecipeThumbnails";
import { createSourceRecipeUrlTransform } from "../../_lib/sourceRecipeUrls";
export type SourceRecipePageContentProps = { markdown: string; sourceRecipe: SourceRecipe };
export const SourceRecipePageContent = ({
  markdown,
  sourceRecipe,
}: SourceRecipePageContentProps) => {
  const formal = getFormalizedRecipe(sourceRecipe);
  const cover = getSourceRecipeThumbnail(sourceRecipe);
  const firstImage = markdown.indexOf("![");
  const firstSection = markdown.search(/^##\s/m);
  const hasIntroImage = firstImage >= 0 && (firstSection < 0 || firstImage < firstSection);

  return (
    <Workspace
      left={
        <>
          <h2 className={panelTitleClass}>{sourceRecipeCategoryLabels[sourceRecipe.category]}</h2>
          <nav className="flex flex-col gap-3 p-4 text-sm font-medium">
            <Link
              className="rounded-xl px-4 py-3 transition-colors hover:bg-egg/35"
              to="/source-recipes"
            >
              菜谱库
            </Link>
            <Link
              className="rounded-2xl bg-tomato px-4 py-3.5 text-center font-semibold text-white shadow-[0_3px_0_#b94025] transition-transform duration-150 ease-kitchen active:translate-y-1 active:shadow-none motion-reduce:transition-none"
              params={{ sourceRecipeId: sourceRecipe.id }}
              to="/source-workbench/$sourceRecipeId"
            >
              逐步试做
            </Link>
            {formal && (
              <Link params={{ recipeId: formal.id }} to="/recipes/$recipeId">
                查看证明
              </Link>
            )}
          </nav>
        </>
      }
      right={
        <>
          <h2 className={panelTitleClass}>菜谱信息</h2>
          <dl className="space-y-6 p-5 text-sm">
            <div>
              <dt className="mb-2 text-muted">分类</dt>
              <dd>{sourceRecipeCategoryLabels[sourceRecipe.category]}</dd>
            </div>
            <div>
              <dt className="mb-2 text-muted">许可</dt>
              <dd>{sourceRecipe.license}</dd>
            </div>
            <div>
              <dt className="mb-2 text-muted">来源</dt>
              <dd>
                <a
                  className="underline underline-offset-4"
                  href={sourceRecipe.sourceUrl}
                  rel="noreferrer"
                  target="_blank"
                >
                  查看原文
                </a>
              </dd>
            </div>
          </dl>
        </>
      }
    >
      <article className="min-h-0 flex-1 overflow-y-auto p-6 sm:p-9 [&_a]:text-leaf [&_a]:underline [&_code]:rounded [&_code]:bg-border/30 [&_code]:px-1 [&_h1]:my-6 [&_h1]:font-bold [&_h1]:tracking-tight [&_h1]:text-4xl [&_h1]:text-tomato [&_h2]:my-6 [&_h2]:font-bold [&_h2]:text-2xl [&_h2]:text-leaf [&_h3]:my-5 [&_h3]:text-lg [&_img]:my-6 [&_img]:max-h-96 [&_img]:max-w-full [&_img]:rounded-3xl [&_img]:shadow-[0_5px_0_#eee2c9] [&_img]:object-contain [&_li]:my-2 [&_ol]:list-decimal [&_ol]:pl-6 [&_p]:my-4 [&_p]:leading-8 [&_pre]:overflow-x-auto [&_pre]:rounded-lg [&_pre]:border [&_pre]:border-border [&_pre]:bg-surface [&_pre]:p-4 [&_table]:w-full [&_td]:border [&_td]:border-border [&_td]:p-3 [&_th]:border [&_th]:border-border [&_th]:bg-surface [&_th]:p-3 [&_ul]:list-disc [&_ul]:pl-6">
        {cover.isPhotograph && !hasIntroImage && (
          <img
            alt={`${sourceRecipe.title}成品`}
            className="aspect-[16/7] w-full object-cover"
            height={480}
            src={cover.src}
            width={960}
          />
        )}
        <Markdown
          skipHtml
          rehypePlugins={[rehypeSlug]}
          remarkPlugins={[remarkGfm]}
          urlTransform={createSourceRecipeUrlTransform(sourceRecipe)}
        >
          {markdown}
        </Markdown>
      </article>
    </Workspace>
  );
};
