/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 半成品意面 · dishes/semi-finished/半成品意面.md -/
def recipe_72605b6e5df1 : Recipe := {
  id := "72605b6e5df1"
  title := "半成品意面"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/半成品意面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "1 袋 半成品意大利面（推荐品牌圃美多）",
    "50 ml 清水",
    "平底锅 或 微波炉"
  ]
  steps := [
    { index := 1, instruction := "热锅" },
    { index := 2, instruction := "将 50 ml 清水倒入平底锅" },
    { index := 3, instruction := "将面条放入，炒 1 分钟" },
    { index := 4, instruction := "将酱料倒入，翻炒 1 分钟" },
    { index := 5, instruction := "装盘即可" },
    { index := 6, instruction := "将面条放入「可用于微波炉加热」的盘子中" },
    { index := 7, instruction := "将附带的酱料倒在面条上" },
    { index := 8, instruction := "倒入 50 ml 清水" },
    { index := 9, instruction := "700W 加热 2 分钟" },
    { index := 10, instruction := "取出拌匀即可" }
  ]
}

theorem recipe_72605b6e5df1_ingredients_nonempty :
    recipe_72605b6e5df1.ingredients.isEmpty = false := by decide

theorem recipe_72605b6e5df1_steps_nonempty :
    recipe_72605b6e5df1.steps.isEmpty = false := by decide

theorem recipe_72605b6e5df1_step_count :
    recipe_72605b6e5df1.steps.length = 10 := by decide

theorem recipe_72605b6e5df1_steps_ordered :
    orderedFrom 1 recipe_72605b6e5df1.steps = true := by decide

theorem recipe_72605b6e5df1_executes_to_terminal :
    executesToTerminal recipe_72605b6e5df1 = true := by decide

theorem recipe_72605b6e5df1_kernel_certificate :
    kernelCertified recipe_72605b6e5df1 = true := by decide

end LeanToCook.SourceCatalog
