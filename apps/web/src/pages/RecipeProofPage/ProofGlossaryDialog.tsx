const glossaryEntries = [
  {
    notation: "Sₙ",
    name: "厨房状态",
    definition: "执行第 n 步前后，食材、器具和火源等事实组成的不可变状态快照。",
    example: "S₄ 表示蛋液已经混合、但锅还未加热的状态。",
  },
  {
    notation: "Sₙ ⊢ a ⇓ Sₙ₊₁",
    name: "求值判断",
    definition: "在状态 Sₙ 下执行动作 a，能够终止并得到下一状态 Sₙ₊₁。",
    example: "S₄ ⊢ .heatPan ⇓ S₅",
  },
  {
    notation: "⊢",
    name: "可执行于",
    definition: "左侧状态满足右侧动作的全部前提，因此可以开始这一步。",
    example: "左侧写状态，右侧写动作，用来判断这一步能否执行。",
  },
  {
    notation: "⇓",
    name: "大步求值",
    definition: "动作经过完整求值后落到结果状态；这里同时表达执行成功与终止。",
    example: "与逻辑蕴含 → 不同。",
  },
  {
    notation: "≔",
    name: "定义为",
    definition: "给一个对象或结果状态下定义，不是在当前上下文中证明两个命题相等。",
    example: "S₅ ≔ applyStep S₄ .heatPan",
  },
  {
    notation: ".heatPan",
    name: "动作构造子",
    definition: "前导点表示 Lean 根据上下文推断所属类型；这里是 RecipeAction 的一个值。",
    example: "完整写法可理解为 RecipeAction.heatPan。",
  },
  {
    notation: "π(Sₙ)",
    name: "状态投影",
    definition: "只取当前证明关心、可以观察的谓词，隐藏与本步无关的实现细节。",
    example: "π(S₅) 包含 heat.on 与 pan.hot。",
  },
  {
    notation: "{ p, q, … }",
    name: "谓词集合",
    definition: "花括号内列出在当前厨房状态中为真的原子事实。",
    example: "{ tomato.clean, egg.mixed, pan.hot }",
  },
  {
    notation: "ready S .a",
    name: "前置条件判定",
    definition: "检查动作 a 在状态 S 中是否具备执行条件。只有结果为 true 才能归约。",
    example: "ready S₄ .heatPan = true",
  },
  {
    notation: "applyStep S .a",
    name: "状态转移函数",
    definition: "把动作应用到旧状态，生成新状态；旧状态自身不会被原地修改。",
    example: "applyStep S₄ .heatPan = S₅",
  },
  {
    notation: "requires / ensures",
    name: "前置 / 后置条件",
    definition: "分别描述执行前必须成立的事实，以及成功执行后保证成立的事实。",
    example: "requires heat.off；ensures heat.on ∧ pan.hot",
  },
  {
    notation: "✓  →  ·",
    name: "界面状态标记",
    definition: "分别表示已经完成、当前选中和尚未执行；它们只属于界面，不是 Lean 语法。",
    example: "点击任意推导行可以直接切换当前状态。",
  },
] as const;

export const ProofGlossaryDialog = () => {
  return (
    <>
      <button
        className="glossary-trigger"
        popoverTarget="proof-glossary"
        popoverTargetAction="show"
        type="button"
      >
        符号词典
      </button>
      <section
        aria-describedby="glossary-description"
        aria-labelledby="glossary-title"
        className="glossary-dialog"
        id="proof-glossary"
        popover="auto"
      >
        <header className="glossary-header">
          <div>
            <span className="glossary-index">Notation reference · 12 entries</span>
            <h2 className="glossary-title" id="glossary-title">
              形式化符号词典
            </h2>
          </div>
          <button
            className="glossary-close"
            popoverTarget="proof-glossary"
            popoverTargetAction="hide"
            type="button"
          >
            关闭 Esc
          </button>
        </header>
        <p className="glossary-description" id="glossary-description">
          本页采用大步操作语义描述做菜过程。以下解释以 Lean to Cook 的厨房状态模型为准。
        </p>

        <div className="glossary-grammar">
          <span>核心判断</span>
          <code>Sₙ ⊢ .action ⇓ Sₙ₊₁</code>
          <p>给定厨房状态，执行一个动作，得到下一个可验证状态。</p>
        </div>

        <dl className="glossary-list">
          {glossaryEntries.map((entry) => (
            <div key={entry.notation} className="glossary-entry">
              <dt>
                <code>{entry.notation}</code>
                <span>{entry.name}</span>
              </dt>
              <dd>
                <p>{entry.definition}</p>
                <code>{entry.example}</code>
              </dd>
            </div>
          ))}
        </dl>
      </section>
    </>
  );
};
