/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒意大利面 · dishes/staple/炒意大利面/炒意大利面.md -/
def recipe_392047faad04 : Recipe := {
  id := "392047faad04"
  title := "炒意大利面"
  category := "staple"
  sourcePath := "dishes/staple/炒意大利面/炒意大利面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "意大利面",
    "肥牛片",
    "番茄酱 / 黑胡椒酱（选其一即可）",
    "菜籽油（其他植物油也可）"
  ]
  steps := [
    { index := 1, instruction := "加入 250 克水 / 人" },
    { index := 2, instruction := "待水烧开，下入面条，中火煮 15 - 20 分钟（这个面通常比较硬，捞起来之前最好尝一下，中心如果有一点硬，需要继续煮）" },
    { index := 3, instruction := "捞出面条，盛入盘中备用" },
    { index := 4, instruction := "热锅倒入食用油，待油温中热，下入面条翻炒一分钟（如果太干，加入少量水）" },
    { index := 5, instruction := "放入 10 克番茄酱、肥牛、加入 2g 食盐，继续翻炒一分钟" },
    { index := 6, instruction := "起锅" }
  ]
}

theorem recipe_392047faad04_ingredients_nonempty :
    recipe_392047faad04.ingredients.isEmpty = false := by decide

theorem recipe_392047faad04_steps_nonempty :
    recipe_392047faad04.steps.isEmpty = false := by decide

theorem recipe_392047faad04_step_count :
    recipe_392047faad04.steps.length = 6 := by decide

theorem recipe_392047faad04_steps_ordered :
    orderedFrom 1 recipe_392047faad04.steps = true := by decide

theorem recipe_392047faad04_executes_to_terminal :
    executesToTerminal recipe_392047faad04 = true := by decide

theorem recipe_392047faad04_kernel_certificate :
    kernelCertified recipe_392047faad04 = true := by decide

end LeanToCook.SourceCatalog
