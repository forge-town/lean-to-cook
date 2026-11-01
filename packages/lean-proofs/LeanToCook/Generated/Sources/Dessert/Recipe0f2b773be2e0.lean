/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 咖啡椰奶冻 · dishes/dessert/咖啡椰奶冻/咖啡椰奶冻.md -/
def recipe_0f2b773be2e0 : Recipe := {
  id := "0f2b773be2e0"
  title := "咖啡椰奶冻"
  category := "dessert"
  sourcePath := "dishes/dessert/咖啡椰奶冻/咖啡椰奶冻.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "125ml 淡奶油",
    "250ml 椰树牌椰汁",
    "35ml espresso 意式浓缩",
    "50ml 椰子水",
    "10g 吉利丁(gelatin)",
    "过滤网（可选）",
    "（那个...有摆盘需求的话，可以来点蓝莓 and/or 咖啡粉）"
  ]
  steps := [
    { index := 1, instruction := "将定量淡奶油，椰树牌椰汁，espresso，椰子水混合备用。" },
    { index := 2, instruction := "将以上液体加热 1 分钟，温度达到 50-60 度即可。" },
    { index := 3, instruction := "（可选）如果格外嗜甜可以加额外的糖。" },
    { index := 4, instruction := "倒入吉利丁，搅拌至融化，煮 1 分钟。" },
    { index := 5, instruction := "（可选）过筛 （这一步可以让椰奶冻口感更佳顺畅）。" },
    { index := 6, instruction := "放入模具。" },
    { index := 7, instruction := "（可选）过滤掉表层的泡泡。这一步可以让椰奶冻口感更好，并且看着也会更棒。" },
    { index := 8, instruction := "放入冰箱冷藏区，等待 3 小时。" }
  ]
}

theorem recipe_0f2b773be2e0_ingredients_nonempty :
    recipe_0f2b773be2e0.ingredients.isEmpty = false := by decide

theorem recipe_0f2b773be2e0_steps_nonempty :
    recipe_0f2b773be2e0.steps.isEmpty = false := by decide

theorem recipe_0f2b773be2e0_step_count :
    recipe_0f2b773be2e0.steps.length = 8 := by decide

theorem recipe_0f2b773be2e0_steps_ordered :
    orderedFrom 1 recipe_0f2b773be2e0.steps = true := by decide

theorem recipe_0f2b773be2e0_executes_to_terminal :
    executesToTerminal recipe_0f2b773be2e0 = true := by decide

theorem recipe_0f2b773be2e0_kernel_certificate :
    kernelCertified recipe_0f2b773be2e0 = true := by decide

end LeanToCook.SourceCatalog
