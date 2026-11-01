import { storyModuleCatalog } from "./storyModuleCatalog";

const tierLabels = {
  deep: "LEAN DEEP",
  hybrid: "HYBRID INDEX",
  structural: "LEAN STRUCTURAL",
  theory: "THEORY",
  visual: "VISUAL ENGINE",
} as const;

export const CodeModuleMap = () => (
  <main className="sb-code-map">
    <header className="sb-code-map__intro">
      <div>
        <span>LEAN TO COOK / CODE ATLAS</span>
        <h1>从网页模块反查每一份代码。</h1>
      </div>
      <p>
        每张卡片是一块真实的前端功能。Route 表示它在产品里的位置，React 表示可见界面来源，Lean
        表示内核证明来源，Support 表示数据、状态机或生成器。
      </p>
    </header>

    <div className="sb-code-map__legend">
      <span>373 LEAN STRUCTURAL</span>
      <span>20 LEAN DEEP</span>
      <span>18 THEORIES</span>
      <span>REACT + ZUSTAND + TANSTACK</span>
    </div>

    <div className="sb-code-map__grid">
      {storyModuleCatalog.map((module) => (
        <article key={module.id} className="sb-code-map__card">
          <header>
            <span>MODULE / {module.id}</span>
            <strong className="sb-code-map__badge">{tierLabels[module.tier]}</strong>
          </header>
          <h2>{module.title}</h2>
          <p>{module.summary}</p>
          <div className="sb-code-map__files">
            <section>
              <strong>REACT / FRONTEND</strong>
              {module.frontendFiles.map((file) => (
                <code key={file}>{file}</code>
              ))}
            </section>
            {module.leanFiles.length > 0 ? (
              <section>
                <strong>LEAN KERNEL</strong>
                {module.leanFiles.map((file) => (
                  <code key={file}>{file}</code>
                ))}
              </section>
            ) : null}
            <section>
              <strong>SCHEMA / STORE / GENERATOR</strong>
              {module.supportFiles.map((file) => (
                <code key={file}>{file}</code>
              ))}
            </section>
          </div>
          <footer>
            <span>PRODUCT ROUTE</span>
            <code>{module.route}</code>
          </footer>
        </article>
      ))}
    </div>
  </main>
);
