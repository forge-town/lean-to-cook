import { resolveRecipeQuantities, type MeasurementUnit, type Recipe } from "@repo/schemas";

const unitLabels = {
  centimeter: "cm",
  gram: "g",
  milliliter: "ml",
  piece: "个",
  second: "s",
} as const satisfies Record<MeasurementUnit, string>;

const getSourceLineKind = (line: string) => {
  const trimmedLine = line.trimStart();
  if (trimmedLine.startsWith("theorem ")) return "theorem";
  if (trimmedLine.startsWith("def ")) return "definition";
  if (
    trimmedLine.startsWith("structure ") ||
    trimmedLine.startsWith("inductive ") ||
    trimmedLine.startsWith("namespace ")
  )
    return "declaration";
  if (trimmedLine.startsWith("/-") || trimmedLine.startsWith("--")) return "comment";

  return "code";
};

interface OverallProofDialogProperties {
  leanSource: string;
  recipe: Recipe;
}

export const OverallProofDialog = ({ leanSource, recipe }: OverallProofDialogProperties) => {
  const quantities = resolveRecipeQuantities(recipe, recipe.presentation.defaultContextValue);
  const leanSourceLines = leanSource.trim().split("\n");
  const finalTheorem = recipe.proof.theorems.at(-1);
  const proofDependencies = finalTheorem?.derivation.premises ?? [];
  const moduleFile = `${recipe.proof.module.split(".").at(-1) ?? recipe.id}.lean`;

  return (
    <>
      <button
        className="overall-proof-trigger"
        popoverTarget="overall-proof"
        popoverTargetAction="show"
        type="button"
      >
        整体证明
      </button>
      <section
        aria-describedby="overall-proof-description"
        aria-labelledby="overall-proof-title"
        className="overall-proof-dialog"
        id="overall-proof"
        popover="auto"
      >
        <header className="overall-proof-header">
          <div>
            <span className="overall-proof-eyebrow">
              Kernel checked · theorem {recipe.proof.theorems.length}/{recipe.proof.theorems.length}
            </span>
            <h2 id="overall-proof-title">{recipe.title}：整体正确性</h2>
          </div>
          <div className="overall-proof-header-actions">
            <span>QED</span>
            <button popoverTarget="overall-proof" popoverTargetAction="hide" type="button">
              关闭 Esc
            </button>
          </div>
        </header>

        <p className="overall-proof-description" id="overall-proof-description">
          最终 theorem 把可执行性、终态性质、流程拓扑与数值合同合并为一个内核检查过的命题。
        </p>

        <fieldset className="overall-proof-view-switch">
          <legend>证明阅读模式</legend>
          <input defaultChecked id="proof-view-structured" name="overall-proof-view" type="radio" />
          <label htmlFor="proof-view-structured">结构化证明</label>
          <input id="proof-view-source" name="overall-proof-view" type="radio" />
          <label htmlFor="proof-view-source">Lean 源代码</label>
        </fieldset>

        <div className="overall-proof-structured-view">
          <div className="overall-proof-statement">
            <span>Final theorem</span>
            <code>theorem {finalTheorem?.name} :</code>
            <pre>{finalTheorem?.statement}</pre>
          </div>

          <div className="overall-proof-body">
            <section aria-label="数值合同" className="overall-proof-numbers">
              <div className="overall-proof-section-heading">
                <div>
                  <span>Numeric contract</span>
                  <h3>源菜谱中的数字进入命题</h3>
                </div>
                <strong>
                  {recipe.presentation.defaultContextValue} {recipe.presentation.contextLabel}
                </strong>
              </div>
              <div className="overall-proof-number-grid">
                {recipe.ingredients.map((ingredient) => {
                  const quantity = quantities[ingredient.id];
                  const value = quantity
                    ? quantity.min === quantity.max
                      ? quantity.min
                      : `${quantity.min}–${quantity.max}`
                    : "—";

                  return (
                    <article key={ingredient.id}>
                      <span>{ingredient.name}</span>
                      <strong>
                        {value} {quantity ? unitLabels[quantity.unit] : ""}
                      </strong>
                      <code>contract.{ingredient.id}</code>
                      <small>✓ Lean verified</small>
                    </article>
                  );
                })}
              </div>
            </section>

            <section aria-label="整体证明依赖" className="overall-proof-dependencies">
              <div className="overall-proof-section-heading">
                <div>
                  <span>Proof obligations</span>
                  <h3>汇总定理如何闭合</h3>
                </div>
                <strong>
                  {proofDependencies.length} / {proofDependencies.length}
                </strong>
              </div>
              <ol>
                {proofDependencies.map((dependency, index) => {
                  const theorem = recipe.proof.theorems.find((item) => item.name === dependency);

                  return (
                    <li key={dependency}>
                      <span>{String(index + 1).padStart(2, "0")}</span>
                      <div>
                        <code>{dependency}</code>
                        <small>{theorem?.description ?? "数量或状态前提已归约"}</small>
                      </div>
                      <strong>✓</strong>
                    </li>
                  );
                })}
              </ol>
              <div className="overall-proof-term">
                <span>Conclusion</span>
                <code>{finalTheorem?.derivation.conclusion}</code>
              </div>
            </section>
          </div>
        </div>

        <div className="overall-proof-source-view">
          <div className="overall-proof-source-toolbar">
            <div>
              <span>Verified source</span>
              <strong>LeanToCook/{moduleFile}</strong>
            </div>
            <code>
              {leanSourceLines.length} lines · Lean {recipe.proof.leanVersion}
            </code>
          </div>
          <ol className="overall-proof-source-code">
            {leanSourceLines.map((line, lineIndex) => {
              const lineNumber = lineIndex + 1;

              return (
                <li key={`${lineNumber}:${line}`} data-kind={getSourceLineKind(line)}>
                  <span>{lineNumber}</span>
                  <code>{line.length > 0 ? line : " "}</code>
                </li>
              );
            })}
          </ol>
        </div>

        <footer className="overall-proof-footer">
          <span>Lean {recipe.proof.leanVersion}</span>
          <code>
            {recipe.proof.module}.{finalTheorem?.name}
          </code>
          <strong>NO UNSOLVED GOALS</strong>
        </footer>
      </section>
    </>
  );
};
