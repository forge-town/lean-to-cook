/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 茄子炖土豆 · dishes/vegetable_dish/茄子炖土豆.md -/
def recipe_150f56720d90 : Recipe := {
  id := "150f56720d90"
  title := "茄子炖土豆"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/茄子炖土豆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "土豆",
    "肉",
    "辣椒（是青辣椒，而不是辣椒面或辣椒油）",
    "酱油",
    "盐",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "将茄子、土豆、辣椒洗净，蒜扒皮并拍碎。" },
    { index := 2, instruction := "将茄子、土豆切成约 6 立方厘米的块，辣椒切成 5 克的小块，肉切成 3 厘米的丝。" },
    { index := 3, instruction := "开火，热锅，加入份数  13 毫升的油。" },
    { index := 4, instruction := "当能看到锅里的油冒出一丝烟时，放入辣椒。" },
    { index := 5, instruction := "煸出辣椒香气后，立刻放入肉，用铲子翻炒 30 秒。" },
    { index := 6, instruction := "放入土豆，翻炒 30 秒。" },
    { index := 7, instruction := "放入茄子，翻炒 30 秒。" },
    { index := 8, instruction := "放入酱油和盐，继续翻炒 5 分钟。" },
    { index := 9, instruction := "加入水，水面高度为锅内食材高度的 0.9 倍，并盖上锅盖。" },
    { index := 10, instruction := "等待，直到锅内水的高度剩余食材高度的 0.1 倍时，开盖，放入蒜，搅拌均匀，关火。" }
  ]
}

theorem recipe_150f56720d90_ingredients_nonempty :
    recipe_150f56720d90.ingredients.isEmpty = false := by decide

theorem recipe_150f56720d90_steps_nonempty :
    recipe_150f56720d90.steps.isEmpty = false := by decide

theorem recipe_150f56720d90_step_count :
    recipe_150f56720d90.steps.length = 10 := by decide

theorem recipe_150f56720d90_steps_ordered :
    orderedFrom 1 recipe_150f56720d90.steps = true := by decide

theorem recipe_150f56720d90_executes_to_terminal :
    executesToTerminal recipe_150f56720d90 = true := by decide

theorem recipe_150f56720d90_kernel_certificate :
    kernelCertified recipe_150f56720d90 = true := by decide

end LeanToCook.SourceCatalog
