import type { Recipe, SourceRecipe } from "@repo/schemas";
import { Link } from "@tanstack/react-router";

import { sourceRecipeCategoryLabels } from "@/sourceRecipePresentation";

import { parseRecipeSourceDocument } from "./recipeSourceDocument";

interface RecipeSourceDialogProperties {
  markdown: string;
  recipe: Recipe;
  sourceRecipe: SourceRecipe;
}

const getSectionKind = (heading: string) => {
  if (/操作|步骤|做法/.test(heading)) {
    return "steps";
  }

  if (/原料|材料|工具/.test(heading)) {
    return "ingredients";
  }

  if (/计算|用量/.test(heading)) {
    return "amounts";
  }

  return "notes";
};

export const RecipeSourceDialog = ({
  markdown,
  recipe,
  sourceRecipe,
}: RecipeSourceDialogProperties) => {
  const document = parseRecipeSourceDocument(markdown);

  return (
    <>
      <button className="recipe-source-trigger" popoverTarget="recipe-source-dialog" type="button">
        <span>菜谱档案</span>
        <small>原文 + 证明</small>
      </button>

      <section
        aria-describedby="recipe-source-description"
        aria-labelledby="recipe-source-title"
        className="recipe-source-dialog"
        id="recipe-source-dialog"
        popover="auto"
      >
        <header className="recipe-source-header">
          <div className="recipe-source-heading">
            <span>VERIFIED RECIPE DOSSIER · CASE {recipe.presentation.caseNumber}</span>
            <h2 id="recipe-source-title">{sourceRecipe.title}</h2>
          </div>
          <div className="recipe-source-header-meta">
            <span>LEAN VERIFIED</span>
            <button
              aria-label="关闭菜谱档案"
              popoverTarget="recipe-source-dialog"
              popoverTargetAction="hide"
              type="button"
            >
              关闭 ×
            </button>
          </div>
        </header>

        <div className="recipe-source-layout">
          <aside className="recipe-source-sidebar">
            <div aria-hidden="true" className="recipe-source-seal">
              <span>λ</span>
              <strong>PROVED</strong>
              <small>{recipe.proof.theorems.length} THEOREMS</small>
            </div>

            <p id="recipe-source-description">
              这是本证明案例对应的 HowToCook 原始菜谱。阅读版帮助实际下厨，右侧每一步由当前 Lean
              状态机与定理证书约束。
            </p>

            <dl>
              <div>
                <dt>分类</dt>
                <dd>{sourceRecipeCategoryLabels[sourceRecipe.category]}</dd>
              </div>
              <div>
                <dt>固定提交</dt>
                <dd>{sourceRecipe.upstreamCommit.slice(0, 8)}</dd>
              </div>
              <div>
                <dt>许可证</dt>
                <dd>{sourceRecipe.license}</dd>
              </div>
              <div>
                <dt>证明模块</dt>
                <dd>{recipe.proof.module}</dd>
              </div>
            </dl>

            <code>{sourceRecipe.sourcePath}</code>

            <div className="recipe-source-links">
              <Link
                params={{ sourceRecipeId: sourceRecipe.id }}
                to="/source-recipe/$sourceRecipeId"
              >
                查看收录原文 →
              </Link>
              <a href={sourceRecipe.sourceUrl} rel="noreferrer" target="_blank">
                GitHub 固定版本 ↗
              </a>
            </div>
          </aside>

          <div className="recipe-source-content">
            <fieldset className="recipe-source-view-switch">
              <legend>菜谱显示方式</legend>
              <input
                defaultChecked
                id="recipe-source-reader"
                name="recipe-source-view"
                type="radio"
              />
              <label htmlFor="recipe-source-reader">阅读菜谱</label>
              <input id="recipe-source-raw" name="recipe-source-view" type="radio" />
              <label htmlFor="recipe-source-raw">原始 Markdown</label>
            </fieldset>

            <article className="recipe-source-reader-view">
              <div className="recipe-source-intro">
                <span>HOW TO COOK / SOURCE EDITION</span>
                {document.introduction.map((paragraph) => (
                  <p key={paragraph}>{paragraph}</p>
                ))}
              </div>

              <div className="recipe-source-sections">
                {document.sections.map((section) => (
                  <section key={section.heading} data-kind={getSectionKind(section.heading)}>
                    <header>
                      <span>{String(document.sections.indexOf(section) + 1).padStart(2, "0")}</span>
                      <h3>{section.heading}</h3>
                    </header>
                    <div>
                      {section.lines.map((line) => (
                        <div key={`${line.kind}-${line.text}`} data-line-kind={line.kind}>
                          <i aria-hidden="true" />
                          <p>{line.text}</p>
                        </div>
                      ))}
                    </div>
                  </section>
                ))}
              </div>
            </article>

            <article className="recipe-source-raw-view">
              <header>
                <span>VENDORED MARKDOWN</span>
                <code>read-only · exact snapshot</code>
              </header>
              <pre>
                <code>{markdown}</code>
              </pre>
            </article>
          </div>
        </div>
      </section>
    </>
  );
};
