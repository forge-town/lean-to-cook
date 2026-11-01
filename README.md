<p align="center">
  <img src="apps/web/public/brand/cook-mark.png" alt="Lean to Cook 项目图标" width="128" />
</p>

<h1 align="center">Lean to Cook</h1>

<p align="center"><strong>用数学模型描述烹饪过程，把“凭感觉”变成“按标准”。</strong></p>

<p align="center">
  <a href="https://github.com/forge-town/lean-to-cook/actions/workflows/ci.yml?query=branch%3Amain"><img src="https://github.com/forge-town/lean-to-cook/actions/workflows/ci.yml/badge.svg?branch=main" alt="main 分支 CI 状态" /></a>
  <a href="packages/lean-proofs/lean-toolchain"><img src="https://img.shields.io/badge/Lean-4.25.0-1D4D3C?style=flat" alt="Lean 4.25.0" /></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache--2.0-1D4D3C?style=flat" alt="Apache License 2.0" /></a>
</p>

<p align="center">
  <a href="#项目功能">项目功能</a> ·
  <a href="#本地运行">快速开始</a> ·
  <a href="#技术组成">技术组成</a> ·
  <a href="#致谢">致谢</a> ·
  <a href="https://github.com/forge-town/lean-to-cook/issues">问题反馈</a>
</p>

---

Lean to Cook 是一个结合交互菜谱、烹饪动画与 Lean 形式化验证的开源项目。你可以选一道菜，跟着动画查看每一步操作，也可以打开对应的 Lean 代码，了解步骤之间的条件、用量关系和最终状态。

项目包含菜谱前台、独立内容后台和 Lean 证明库，支持菜谱浏览、步骤演示、食材配置与模型检查。

## 项目功能

| 模块        | 可以做什么                                                                           |
| ----------- | ------------------------------------------------------------------------------------ |
| 菜谱库      | 按分类浏览菜谱和配图，查看食材、用量与完整做法。                                     |
| 烹饪工作台  | 用动画展示清洗、切配、加热、搅拌和装盘等动作，逐步操作并回看已完成的步骤。           |
| Lean 证明库 | 对照烹饪步骤阅读模型、命题与证明，检查操作条件、执行顺序和结束状态。                 |
| 基础理论    | 查看厨房操作与数量关系的形式化表达，包括“适量”等常见菜谱概念。                       |
| 内容后台    | 管理菜谱、食材、分类和计量单位，维护食材图片及菜谱关联，并查看 Lean 代码与校验结果。 |
| 组件预览    | 在 Storybook 中单独查看页面、动画场景和食材组件，定位对应源码与 Lean 模块。          |

## 使用入口

本地启动后，可以通过以下地址访问：

| 入口       | 地址                                   |
| ---------- | -------------------------------------- |
| 首页       | <http://localhost:7201>                |
| 菜谱库     | <http://localhost:7201/source-recipes> |
| 烹饪工作台 | <http://localhost:7201/simulator>      |
| 证明库     | <http://localhost:7201/library>        |
| 基础理论   | <http://localhost:7201/theories>       |
| 内容后台   | <http://localhost:7202>                |

## 本地运行

准备 Bun 1.3.11+、Docker，以及用于安装 Lean 的 [Elan](https://github.com/leanprover/elan)。证明包已固定使用 Lean 4.25.0。

```bash
bun install
bun run db:setup
bun run db:migrate
bun run db:seed
bun run dev
```

`db:setup` 会创建本地 PostgreSQL 容器并生成环境配置。首次生成的后台密码保存在本地 `.env.local` 中；该文件不会提交到 Git。

组件预览单独启动：

```bash
bun run storybook
# http://localhost:6006
```

## 技术组成

| 部分         | 技术                                | 代码位置                                                                         |
| ------------ | ----------------------------------- | -------------------------------------------------------------------------------- |
| 菜谱前台     | React、TanStack Start、Tailwind CSS | [apps/web](apps/web)                                                             |
| 内容后台     | React、TanStack Router、Refine      | [apps/admin](apps/admin)                                                         |
| 服务接口     | Bun、tRPC                           | [apps/api](apps/api)                                                             |
| 数据与业务   | PostgreSQL、Drizzle ORM             | [packages/db-schema](packages/db-schema)、[packages/services](packages/services) |
| 菜谱数据模型 | Zod                                 | [packages/schemas](packages/schemas)                                             |
| 形式化验证   | Lean 4、Lake                        | [packages/lean-proofs](packages/lean-proofs)                                     |
| 菜谱与配图   | 固定版本的 HowToCook 内容快照       | [content/how-to-cook](content/how-to-cook)                                       |

## Lean 验证范围

| 模型         | 检查内容                                                                   |
| ------------ | -------------------------------------------------------------------------- |
| 菜谱结构     | 原料与步骤非空、步骤数量与索引连续，以及模型中的有序执行。                 |
| 独立状态模型 | 六道菜分别定义操作条件和状态变化，例如先清洗再切配、完成后装盘并关闭火源。 |
| 共享阶段模型 | 另外十四道菜使用准备、加工、完成等共享阶段检查执行顺序。                   |
| 动作映射     | 核对前端动作列表与 Lean 模型计划的顺序是否一致。                           |

证明的结论适用于代码中定义的模型。真实烹饪中的熟度、口感、营养与食品安全需要在实际操作中判断；动画展示和 TypeScript 状态执行的完整等价性也不在这些证明的范围内。

<details>
<summary>开发与验证命令</summary>

```bash
# 应用检查
bun run test
bun run check-types
bun run lint
bun run build

# 在证明包目录中编译 Lean
cd packages/lean-proofs
lake build
cd ../..

# 目录约束、生成一致性与证明契约
bun run check-anatomy
bun run generate-source-proofs --check
bun run generate-lean-metadata --check
bun run test:lean-architecture
bun run check-lean-contracts
bun run check-source-coverage
```

Lean 源码按共享核心、基础理论、菜谱模型、生成证书和数据契约划分。菜谱单元内分别维护 `Model.lean`、`Spec.lean` 与 `Proofs.lean`，目录约束见 [anatomy.json](anatomy.json)。

更新菜谱快照后运行 `bun run generate-source-proofs`；修改模型或前端步骤后运行 `bun run generate-lean-metadata`。后台保存的内容不会自动写回菜谱源码或 Lean 证明文件。

</details>

## 参与贡献

欢迎通过 [Issues](https://github.com/forge-town/lean-to-cook/issues) 反馈问题、提出菜谱或动画改进建议，也欢迎提交 Pull Request。修改烹饪动作或 Lean 模型时，请一并检查动作映射和相关证明；验证命令见上方“开发与验证命令”。

## 致谢

感谢 **[HowToCook](https://github.com/Anduin2017/HowToCook)** 项目及所有贡献者，整理并开放菜谱、用量和配图，为 Lean to Cook 提供了内容基础。

本项目收录的是 HowToCook **截至 2026 年 10 月 26 日**的菜谱与配图快照，固定到提交 [`308cc8b7`](https://github.com/Anduin2017/HowToCook/commit/308cc8b7dab1da84b20e7fafdf836a715437f582)。上游此后的修改不包含在这份快照中，也不会自动同步。

来源记录见 [UPSTREAM.md](content/how-to-cook/UPSTREAM.md)，相关内容保留上游的 [Unlicense](content/how-to-cook/LICENSE)。

## 许可证

项目自有代码、Lean 证明和文档采用 **[Apache License 2.0](LICENSE)**。第三方内容及依赖保留各自的许可证，详见 [NOTICE](NOTICE)。
