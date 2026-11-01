/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 醪糟小汤圆 · dishes/staple/醪糟小汤圆.md -/
def recipe_4de3928e6efa : Recipe := {
  id := "4de3928e6efa"
  title := "醪糟小汤圆"
  category := "staple"
  sourcePath := "dishes/staple/醪糟小汤圆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "小汤圆",
    "醪糟",
    "白糖",
    "枸杞（可选）"
  ]
  steps := [
    { index := 1, instruction := "将水倒入锅中并煮沸" },
    { index := 2, instruction := "放入小汤圆煮 8 分钟" },
    { index := 3, instruction := "放入醪糟和枸杞再煮 2 分钟" },
    { index := 4, instruction := "盛入碗中根据个人口味加入白糖并搅拌均匀" },
    { index := 5, instruction := "吃" }
  ]
}

theorem recipe_4de3928e6efa_ingredients_nonempty :
    recipe_4de3928e6efa.ingredients.isEmpty = false := by decide

theorem recipe_4de3928e6efa_steps_nonempty :
    recipe_4de3928e6efa.steps.isEmpty = false := by decide

theorem recipe_4de3928e6efa_step_count :
    recipe_4de3928e6efa.steps.length = 5 := by decide

theorem recipe_4de3928e6efa_steps_ordered :
    orderedFrom 1 recipe_4de3928e6efa.steps = true := by decide

theorem recipe_4de3928e6efa_executes_to_terminal :
    executesToTerminal recipe_4de3928e6efa = true := by decide

theorem recipe_4de3928e6efa_kernel_certificate :
    kernelCertified recipe_4de3928e6efa = true := by decide

end LeanToCook.SourceCatalog
