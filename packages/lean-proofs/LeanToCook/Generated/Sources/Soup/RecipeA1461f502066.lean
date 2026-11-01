/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 白萝卜丝清汤 · dishes/soup/白萝卜丝清汤.md -/
def recipe_a1461f502066 : Recipe := {
  id := "a1461f502066"
  title := "白萝卜丝清汤"
  category := "soup"
  sourcePath := "dishes/soup/白萝卜丝清汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白萝卜",
    "食盐",
    "白胡椒粉",
    "味精",
    "猪油（或芝麻香油）",
    "擦丝器"
  ]
  steps := [
    { index := 1, instruction := "白萝卜去皮，用擦丝器擦成细丝，备用" },
    { index := 2, instruction := "锅内加入 800ml 饮用水，同时放入白萝卜丝" },
    { index := 3, instruction := "加入食盐 3g、白胡椒粉 2g、味精 3g，用勺子搅拌均匀" },
    { index := 4, instruction := "开大火将水烧至沸腾" },
    { index := 5, instruction := "沸腾后将火调至中小火，继续煮 5 分钟至白萝卜丝变软呈半透明状" },
    { index := 6, instruction := "关火前加入猪油 3g（或芝麻香油 3g），搅拌均匀后关火出锅" }
  ]
}

theorem recipe_a1461f502066_ingredients_nonempty :
    recipe_a1461f502066.ingredients.isEmpty = false := by decide

theorem recipe_a1461f502066_steps_nonempty :
    recipe_a1461f502066.steps.isEmpty = false := by decide

theorem recipe_a1461f502066_step_count :
    recipe_a1461f502066.steps.length = 6 := by decide

theorem recipe_a1461f502066_steps_ordered :
    orderedFrom 1 recipe_a1461f502066.steps = true := by decide

theorem recipe_a1461f502066_executes_to_terminal :
    executesToTerminal recipe_a1461f502066 = true := by decide

theorem recipe_a1461f502066_kernel_certificate :
    kernelCertified recipe_a1461f502066 = true := by decide

end LeanToCook.SourceCatalog
