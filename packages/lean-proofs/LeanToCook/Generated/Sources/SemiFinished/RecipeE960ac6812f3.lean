/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 懒人蛋挞 · dishes/semi-finished/懒人蛋挞/懒人蛋挞.md -/
def recipe_e960ac6812f3 : Recipe := {
  id := "e960ac6812f3"
  title := "懒人蛋挞"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/懒人蛋挞/懒人蛋挞.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "需要烤箱 1 个（有上下火功能的最佳，也可以没有）",
    "隔热手套 1 双",
    "网购蛋挞液 1 盒，蛋挞皮 1 盒（附近的大超市也可以，比如家乐福、沃尔玛等等）"
  ]
  steps := [
    { index := 1, instruction := "烤箱 200 度，预热 10 分钟" },
    { index := 2, instruction := "在烤盘上放上蛋挞皮，蛋挞皮中倒入蛋挞液约 10ml，具体分量需要看蛋挞皮大小，通常倒入 4/5 即可" },
    { index := 3, instruction := "将烤盘放入烤箱内，上下火 190 度，烤 10 - 20 分。如果想快速烤出蛋挞液上的焦褐斑点，需要上火更高一些，通常是 200 - 210 度" },
    { index := 4, instruction := "蛋挞液烤出焦褐斑点，蛋挞皮完全蓬松冒油即可" }
  ]
}

theorem recipe_e960ac6812f3_ingredients_nonempty :
    recipe_e960ac6812f3.ingredients.isEmpty = false := by decide

theorem recipe_e960ac6812f3_steps_nonempty :
    recipe_e960ac6812f3.steps.isEmpty = false := by decide

theorem recipe_e960ac6812f3_step_count :
    recipe_e960ac6812f3.steps.length = 4 := by decide

theorem recipe_e960ac6812f3_steps_ordered :
    orderedFrom 1 recipe_e960ac6812f3.steps = true := by decide

theorem recipe_e960ac6812f3_executes_to_terminal :
    executesToTerminal recipe_e960ac6812f3 = true := by decide

theorem recipe_e960ac6812f3_kernel_certificate :
    kernelCertified recipe_e960ac6812f3 = true := by decide

end LeanToCook.SourceCatalog
