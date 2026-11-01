/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱油 · dishes/condiment/葱油.md -/
def recipe_53fc0a69484a : Recipe := {
  id := "53fc0a69484a"
  title := "葱油"
  category := "condiment"
  sourcePath := "dishes/condiment/葱油.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "油",
    "葱（大葱小葱都可以）",
    "姜",
    "洋葱",
    "料酒",
    "香菜（可选）",
    "开洋（可选）"
  ]
  steps := [
    { index := 1, instruction := "开洋泡入 50 度温水中，加入 10ml 料酒去腥，泡 10 分钟后取出沥干水分" },
    { index := 2, instruction := "葱，香菜洗净，切成 5cm 长的段，擦干表面水份" },
    { index := 3, instruction := "洋葱切成丝，在锅里用热水煮 5 分钟，取出沥干水份" },
    { index := 4, instruction := "姜去皮，切成片" },
    { index := 5, instruction := "锅里倒入全部油，放入上述预处理好的材料，开中小火炸 20 分钟" }
  ]
}

theorem recipe_53fc0a69484a_ingredients_nonempty :
    recipe_53fc0a69484a.ingredients.isEmpty = false := by decide

theorem recipe_53fc0a69484a_steps_nonempty :
    recipe_53fc0a69484a.steps.isEmpty = false := by decide

theorem recipe_53fc0a69484a_step_count :
    recipe_53fc0a69484a.steps.length = 5 := by decide

theorem recipe_53fc0a69484a_steps_ordered :
    orderedFrom 1 recipe_53fc0a69484a.steps = true := by decide

theorem recipe_53fc0a69484a_executes_to_terminal :
    executesToTerminal recipe_53fc0a69484a = true := by decide

theorem recipe_53fc0a69484a_kernel_certificate :
    kernelCertified recipe_53fc0a69484a = true := by decide

end LeanToCook.SourceCatalog
