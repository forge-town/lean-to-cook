import { sourceRecipeCatalog } from "@repo/schemas";
import { Link } from "@tanstack/react-router";

import {
  getFormalizedRecipe,
  sourceRecipeCategoryLabels,
  sourceRecipeCategoryOrder,
} from "@/sourceRecipePresentation";

import { useRecipeLibraryPageStore } from "./_store";

const sourceRecipeIndexById = new Map(
  sourceRecipeCatalog.map((sourceRecipe, index) => [sourceRecipe.id, index + 1] as const)
);

export const RecipeWorkbenchCatalog = () => {
  const categoryFilter = useRecipeLibraryPageStore((store) => store.categoryFilter);
  const certificationFilter = useRecipeLibraryPageStore((store) => store.certificationFilter);
  const query = useRecipeLibraryPageStore((store) => store.query);
  const handleQueryInputChange = useRecipeLibraryPageStore((store) => store.handleQueryInputChange);
  const handleCategorySelectChange = useRecipeLibraryPageStore(
    (store) => store.handleCategorySelectChange
  );
  const handleAllCertificationButtonClick = useRecipeLibraryPageStore(
    (store) => store.handleAllCertificationButtonClick
  );
  const handleDeepCertificationButtonClick = useRecipeLibraryPageStore(
    (store) => store.handleDeepCertificationButtonClick
  );
  const handleStructuralCertificationButtonClick = useRecipeLibraryPageStore(
    (store) => store.handleStructuralCertificationButtonClick
  );
  const normalizedQuery = query.trim().toLocaleLowerCase("zh-CN");
  const visibleRecipes = sourceRecipeCatalog.filter((sourceRecipe) => {
    const formalizedRecipe = getFormalizedRecipe(sourceRecipe);
    const matchesCategory = categoryFilter === "all" || sourceRecipe.category === categoryFilter;
    const matchesCertification =
      certificationFilter === "all" ||
      (certificationFilter === "deep" && Boolean(formalizedRecipe)) ||
      (certificationFilter === "structural" && !formalizedRecipe);
    const matchesQuery =
      !normalizedQuery ||
      sourceRecipe.title.toLocaleLowerCase("zh-CN").includes(normalizedQuery) ||
      sourceRecipe.sourcePath.toLocaleLowerCase("zh-CN").includes(normalizedQuery);

    return matchesCategory && matchesCertification && matchesQuery;
  });

  return (
    <section aria-labelledby="case-index-title" className="library-cases workbench-catalog">
      <div className="library-section-heading workbench-catalog-heading">
        <span>02</span>
        <div>
          <h2 id="case-index-title">全部菜谱工作台</h2>
        </div>
      </div>

      <div className="workbench-catalog-controls">
        <label>
          <span>搜索菜谱</span>
          <input
            placeholder="输入菜名或源文件路径…"
            type="search"
            value={query}
            onChange={handleQueryInputChange}
          />
        </label>

        <label>
          <span>菜谱分类</span>
          <select value={categoryFilter} onChange={handleCategorySelectChange}>
            <option value="all">全部分类 · {sourceRecipeCatalog.length}</option>
            {sourceRecipeCategoryOrder.map((category) => (
              <option key={category} value={category}>
                {sourceRecipeCategoryLabels[category]} ·{" "}
                {sourceRecipeCatalog.filter((recipe) => recipe.category === category).length}
              </option>
            ))}
          </select>
        </label>

        <div aria-label="认证状态" className="workbench-certification-filter" role="group">
          <span>认证状态</span>
          <div>
            <button
              aria-pressed={certificationFilter === "all"}
              type="button"
              onClick={handleAllCertificationButtonClick}
            >
              全部
            </button>
            <button
              aria-pressed={certificationFilter === "deep"}
              type="button"
              onClick={handleDeepCertificationButtonClick}
            >
              Lean 深度
            </button>
            <button
              aria-pressed={certificationFilter === "structural"}
              type="button"
              onClick={handleStructuralCertificationButtonClick}
            >
              Lean 结构
            </button>
          </div>
        </div>

        <output className="workbench-catalog-result">
          <strong>{visibleRecipes.length}</strong>
          <span>results</span>
        </output>
      </div>

      {visibleRecipes.length > 0 ? (
        <div className="workbench-catalog-grid">
          {visibleRecipes.map((sourceRecipe) => {
            const formalizedRecipe = getFormalizedRecipe(sourceRecipe);

            return (
              <article
                key={sourceRecipe.id}
                className="workbench-catalog-card"
                data-certification={formalizedRecipe ? "deep" : "structural"}
              >
                <div className="workbench-catalog-card-meta">
                  <span>
                    CASE {String(sourceRecipeIndexById.get(sourceRecipe.id)).padStart(3, "0")}
                  </span>
                  <strong>{formalizedRecipe ? "LEAN DEEP" : "LEAN STRUCTURAL"}</strong>
                </div>

                <div aria-hidden="true" className="workbench-catalog-glyph">
                  <span />
                  <span />
                  <i>λ</i>
                </div>

                <div className="workbench-catalog-card-copy">
                  <small>{sourceRecipeCategoryLabels[sourceRecipe.category]}</small>
                  <h3>{sourceRecipe.title}</h3>
                  <code>{sourceRecipe.sourcePath}</code>
                </div>

                <footer>
                  <div>
                    <code>{sourceRecipe.upstreamCommit.slice(0, 8)}</code>
                  </div>
                  {formalizedRecipe ? (
                    <div className="workbench-catalog-card-actions">
                      <Link search={{ recipe: formalizedRecipe.id }} to="/simulator">
                        ▶ 打开模拟器
                      </Link>
                      <Link params={{ recipeId: formalizedRecipe.id }} to="/recipes/$recipeId">
                        深度证明 →
                      </Link>
                    </div>
                  ) : (
                    <Link
                      params={{ sourceRecipeId: sourceRecipe.id }}
                      to="/source-workbench/$sourceRecipeId"
                    >
                      打开结构证明 →
                    </Link>
                  )}
                </footer>
              </article>
            );
          })}
        </div>
      ) : (
        <div className="workbench-catalog-empty">
          <strong>没有匹配的菜谱</strong>
          <p>请调整搜索词、分类或认证状态。</p>
        </div>
      )}
    </section>
  );
};
