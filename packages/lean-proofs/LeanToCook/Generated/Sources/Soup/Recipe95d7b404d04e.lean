/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奶油蘑菇汤 · dishes/soup/奶油蘑菇汤.md -/
def recipe_95d7b404d04e : Recipe := {
  id := "95d7b404d04e"
  title := "奶油蘑菇汤"
  category := "soup"
  sourcePath := "dishes/soup/奶油蘑菇汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白蘑菇",
    "洋葱",
    "黄油",
    "面粉",
    "牛奶",
    "淡奶油",
    "黑胡椒碎",
    "盐",
    "清水"
  ]
  steps := [
    { index := 1, instruction := "白蘑菇切片备用，洋葱切末备用。" },
    { index := 2, instruction := "平底锅中放入黄油，小火融化后加入洋葱炒至透明。" },
    { index := 3, instruction := "加入白蘑菇翻炒至出水变软，撒入面粉搅拌均匀。" },
    { index := 4, instruction := "加入牛奶和清水，搅拌均匀后小火煮沸，保持搅拌防止糊底。" },
    { index := 5, instruction := "转小火煮约 10 分钟，汤汁浓稠。" },
    { index := 6, instruction := "倒入淡奶油继续加热 1 分钟，加入盐和黑胡椒调味。" },
    { index := 7, instruction := "熄火后可用料理机打成细腻浓汤（可选）。" }
  ]
}

theorem recipe_95d7b404d04e_ingredients_nonempty :
    recipe_95d7b404d04e.ingredients.isEmpty = false := by decide

theorem recipe_95d7b404d04e_steps_nonempty :
    recipe_95d7b404d04e.steps.isEmpty = false := by decide

theorem recipe_95d7b404d04e_step_count :
    recipe_95d7b404d04e.steps.length = 7 := by decide

theorem recipe_95d7b404d04e_steps_ordered :
    orderedFrom 1 recipe_95d7b404d04e.steps = true := by decide

theorem recipe_95d7b404d04e_executes_to_terminal :
    executesToTerminal recipe_95d7b404d04e = true := by decide

theorem recipe_95d7b404d04e_kernel_certificate :
    kernelCertified recipe_95d7b404d04e = true := by decide

end LeanToCook.SourceCatalog
