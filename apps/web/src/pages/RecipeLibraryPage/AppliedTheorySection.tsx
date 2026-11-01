import appliedTheoryLeanSource from "@repo/lean-proofs/Verification/AppliedTheory.lean?raw";
import {
  appliedTheoryCatalog,
  getRecipeById,
  getTheoryById,
  type AppliedTheory,
} from "@repo/schemas";
import { Link } from "@tanstack/react-router";

const getRecipeTitle = (recipeId: string) => getRecipeById(recipeId)?.title ?? recipeId;
const getTheoryTitle = (theoryId: string) => getTheoryById(theoryId)?.title ?? theoryId;

const synthesisTheory = appliedTheoryCatalog.find(({ scale }) => scale === "synthesis");
const verticalTheories = appliedTheoryCatalog.filter(({ scale }) => scale === "vertical");

const getTheoremNumber = (application: AppliedTheory) =>
  String(appliedTheoryCatalog.findIndex(({ id }) => id === application.id) + 1).padStart(2, "0");

export const AppliedTheorySection = () => {
  return (
    <section aria-labelledby="applied-theory-title" className="applied-theory-section">
      <div className="library-section-heading">
        <span>01</span>
        <div>
          <h2 id="applied-theory-title">应用定理实验区</h2>
        </div>
      </div>

      {synthesisTheory ? (
        <article className="applied-synthesis-card">
          <div className="applied-synthesis-index">
            <span>META THEOREM</span>
            <strong>A-{getTheoremNumber(synthesisTheory)}</strong>
          </div>
          <div className="applied-synthesis-copy">
            <span>证明能说明什么 / MODEL LIMITS</span>
            <h3>{synthesisTheory.title}</h3>
            <p>{synthesisTheory.summary}</p>
            <code>⊢ {synthesisTheory.conclusion}</code>
          </div>
          <div aria-label="步骤通过检查不代表食品安全" className="applied-synthesis-equation">
            <strong>CERTIFIED FLOW</strong>
            <span>≠</span>
            <strong>SAFETY CHECKS</strong>
            <small>温度、容器、加热介质和原料安全仍要单独检查。</small>
          </div>
          <details className="applied-source-disclosure">
            <summary>查看 AppliedTheory.lean</summary>
            <pre>
              <code>{appliedTheoryLeanSource}</code>
            </pre>
          </details>
        </article>
      ) : null}

      <div className="applied-vertical-grid">
        {verticalTheories.map((application) => (
          <article key={application.id} className="applied-vertical-card">
            <div className="applied-vertical-meta">
              <span>A-{getTheoremNumber(application)}</span>
            </div>
            <h3>{application.title}</h3>
            <p>{application.statement}</p>
            <code className="applied-conclusion">⊢ {application.conclusion}</code>
            <div className="applied-reduction">
              <span>REDUCTION</span>
              <code>{application.reductions[0]?.expression}</code>
              <small>{application.reductions[0]?.reason}</small>
            </div>
            <div className="applied-inputs">
              <div>
                <span>CASES</span>
                {application.caseIds.map((recipeId) => (
                  <Link key={recipeId} params={{ recipeId }} to="/recipes/$recipeId">
                    {getRecipeTitle(recipeId)} →
                  </Link>
                ))}
              </div>
              <div>
                <span>THEORIES</span>
                {application.theoryIds.map((theoryId) => (
                  <Link key={theoryId} to="/theories">
                    {getTheoryTitle(theoryId)} ↗
                  </Link>
                ))}
              </div>
            </div>
            <footer>
              <code>{application.lean.theorem}</code>
            </footer>
          </article>
        ))}
      </div>
    </section>
  );
};
