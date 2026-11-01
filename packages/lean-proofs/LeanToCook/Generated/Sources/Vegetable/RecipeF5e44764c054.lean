/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌黄瓜 · dishes/vegetable_dish/凉拌黄瓜.md -/
def recipe_f5e44764c054 : Recipe := {
  id := "f5e44764c054"
  title := "凉拌黄瓜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌黄瓜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黄瓜",
    "醋",
    "酱油",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "用菜刀将黄瓜拍扁，再剁成长 3 厘米的碎块" },
    { index := 2, instruction := "将碎黄瓜装入碗中" },
    { index := 3, instruction := "将蒜拍碎切成碎末" },
    { index := 4, instruction := "将碗中放入 5 克白糖，搅拌均匀腌制 15 分钟（用糖腌制更好吃，且成色更好不会蔫）" },
    { index := 5, instruction := "将醋，酱油，盐，蚝油和蒜依次倒入碗中搅拌均匀" },
    { index := 6, instruction := "将香油倒入碗中并均匀搅拌" }
  ]
}

theorem recipe_f5e44764c054_ingredients_nonempty :
    recipe_f5e44764c054.ingredients.isEmpty = false := by decide

theorem recipe_f5e44764c054_steps_nonempty :
    recipe_f5e44764c054.steps.isEmpty = false := by decide

theorem recipe_f5e44764c054_step_count :
    recipe_f5e44764c054.steps.length = 6 := by decide

theorem recipe_f5e44764c054_steps_ordered :
    orderedFrom 1 recipe_f5e44764c054.steps = true := by decide

theorem recipe_f5e44764c054_executes_to_terminal :
    executesToTerminal recipe_f5e44764c054 = true := by decide

theorem recipe_f5e44764c054_kernel_certificate :
    kernelCertified recipe_f5e44764c054 = true := by decide

end LeanToCook.SourceCatalog
