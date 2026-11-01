/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酸奶意式奶冻 · dishes/dessert/酸奶意式奶冻/酸奶意式奶冻.md -/
def recipe_545e3a3e64c9 : Recipe := {
  id := "545e3a3e64c9"
  title := "酸奶意式奶冻"
  category := "dessert"
  sourcePath := "dishes/dessert/酸奶意式奶冻/酸奶意式奶冻.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "淡奶油",
    "糖",
    "原味酸奶",
    "吉利丁片",
    "筛网"
  ]
  steps := [
    { index := 1, instruction := "吉利丁片剪成小片，泡入冷水中" },
    { index := 2, instruction := "淡奶油和糖放入锅中，加热至 60 度" },
    { index := 3, instruction := "关火，吉利丁从水中取出，控干水份，加入热淡奶油中，搅拌均匀" },
    { index := 4, instruction := "淡奶油降温至 40 度，加入原味酸奶，搅拌均匀" },
    { index := 5, instruction := "将上述步骤得到的混合物过两遍筛网" },
    { index := 6, instruction := "分装入合适的容器，放入冰箱冷藏 4 小时以上" }
  ]
}

theorem recipe_545e3a3e64c9_ingredients_nonempty :
    recipe_545e3a3e64c9.ingredients.isEmpty = false := by decide

theorem recipe_545e3a3e64c9_steps_nonempty :
    recipe_545e3a3e64c9.steps.isEmpty = false := by decide

theorem recipe_545e3a3e64c9_step_count :
    recipe_545e3a3e64c9.steps.length = 6 := by decide

theorem recipe_545e3a3e64c9_steps_ordered :
    orderedFrom 1 recipe_545e3a3e64c9.steps = true := by decide

theorem recipe_545e3a3e64c9_executes_to_terminal :
    executesToTerminal recipe_545e3a3e64c9 = true := by decide

theorem recipe_545e3a3e64c9_kernel_certificate :
    kernelCertified recipe_545e3a3e64c9 = true := by decide

end LeanToCook.SourceCatalog
