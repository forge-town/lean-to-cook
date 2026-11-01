/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 豉汁排骨 · dishes/meat_dish/豉汁排骨.md -/
def recipe_ba3ce0d2e767 : Recipe := {
  id := "ba3ce0d2e767"
  title := "豉汁排骨"
  category := "meat"
  sourcePath := "dishes/meat_dish/豉汁排骨.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "肋排",
    "阳江豆豉",
    "蒜蓉",
    "姜末",
    "生抽",
    "老抽",
    "蚝油",
    "白砂糖",
    "生粉",
    "食用油",
    "清水",
    "葱花（可选）",
    "白芝麻（可选）"
  ]
  steps := [
    { index := 1, instruction := "将排骨用冷水浸泡 10 分钟泡去血水，换水重复 2 次，用厨房纸吸干" },
    { index := 2, instruction := "将豆豉放入水中浸泡 5 分钟" },
    { index := 3, instruction := "将所有食材混合（食用油放 10 ml），腌制 8-30 分钟" },
    { index := 4, instruction := "水开后上锅蒸 18 分钟" },
    { index := 5, instruction := "焖 2 分钟" },
    { index := 6, instruction := "锅中倒入 10 ml 热油，加热到 180-200 ℃" },
    { index := 7, instruction := "均匀撒上葱花和白芝麻，热油浇在撒料上" }
  ]
}

theorem recipe_ba3ce0d2e767_ingredients_nonempty :
    recipe_ba3ce0d2e767.ingredients.isEmpty = false := by decide

theorem recipe_ba3ce0d2e767_steps_nonempty :
    recipe_ba3ce0d2e767.steps.isEmpty = false := by decide

theorem recipe_ba3ce0d2e767_step_count :
    recipe_ba3ce0d2e767.steps.length = 7 := by decide

theorem recipe_ba3ce0d2e767_steps_ordered :
    orderedFrom 1 recipe_ba3ce0d2e767.steps = true := by decide

theorem recipe_ba3ce0d2e767_executes_to_terminal :
    executesToTerminal recipe_ba3ce0d2e767 = true := by decide

theorem recipe_ba3ce0d2e767_kernel_certificate :
    kernelCertified recipe_ba3ce0d2e767 = true := by decide

end LeanToCook.SourceCatalog
