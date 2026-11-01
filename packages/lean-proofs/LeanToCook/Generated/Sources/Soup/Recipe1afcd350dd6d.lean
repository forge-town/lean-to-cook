/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 排骨山药玉米汤 · dishes/soup/排骨山药玉米汤/排骨山药玉米汤.md -/
def recipe_1afcd350dd6d : Recipe := {
  id := "1afcd350dd6d"
  title := "排骨山药玉米汤"
  category := "soup"
  sourcePath := "dishes/soup/排骨山药玉米汤/排骨山药玉米汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨（推荐精排）",
    "山药（推荐铁棍山药）",
    "胡萝卜",
    "玉米（推荐甜玉米或糯玉米）",
    "生姜",
    "小葱",
    "料酒",
    "食盐",
    "砂锅或深汤锅"
  ]
  steps := [
    { index := 1, instruction := "食材预处理：" },
    { index := 2, instruction := "排骨焯水：" },
    { index := 3, instruction := "翻炒排骨：" },
    { index := 4, instruction := "炖煮过程：" },
    { index := 5, instruction := "调味与出锅：" }
  ]
}

theorem recipe_1afcd350dd6d_ingredients_nonempty :
    recipe_1afcd350dd6d.ingredients.isEmpty = false := by decide

theorem recipe_1afcd350dd6d_steps_nonempty :
    recipe_1afcd350dd6d.steps.isEmpty = false := by decide

theorem recipe_1afcd350dd6d_step_count :
    recipe_1afcd350dd6d.steps.length = 5 := by decide

theorem recipe_1afcd350dd6d_steps_ordered :
    orderedFrom 1 recipe_1afcd350dd6d.steps = true := by decide

theorem recipe_1afcd350dd6d_executes_to_terminal :
    executesToTerminal recipe_1afcd350dd6d = true := by decide

theorem recipe_1afcd350dd6d_kernel_certificate :
    kernelCertified recipe_1afcd350dd6d = true := by decide

end LeanToCook.SourceCatalog
