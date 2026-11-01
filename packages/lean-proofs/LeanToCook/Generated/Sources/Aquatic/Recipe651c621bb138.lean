/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 清蒸生蚝 · dishes/aquatic/清蒸生蚝.md -/
def recipe_651c621bb138 : Recipe := {
  id := "651c621bb138"
  title := "清蒸生蚝"
  category := "aquatic"
  sourcePath := "dishes/aquatic/清蒸生蚝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "生蚝",
    "葱",
    "蒜",
    "姜",
    "酱油",
    "刷子"
  ]
  steps := [
    { index := 1, instruction := "将生蚝用刷子刷干净（没有刷子用牙刷）。" },
    { index := 2, instruction := "蒸锅中放水，将蒸屉放上之后，将 6 个生蚝平铺在蒸屉，使用 50%功率，蒸 3 分钟。" },
    { index := 3, instruction := "用右手拿着湿抹布掀开烫锅盖，将每个生蚝的外壳掀开一半去掉，生蚝的凸面向下，平面向上，每个放 1 根姜丝,10g 蒜末放到生蚝上。" },
    { index := 4, instruction := "关上烫锅盖，100%功率蒸 3.5 分钟。" },
    { index := 5, instruction := "停火，用右手拿着抹布掀开烫锅盖，每个放 5ml 酱油。" },
    { index := 6, instruction := "盛盘。" }
  ]
}

theorem recipe_651c621bb138_ingredients_nonempty :
    recipe_651c621bb138.ingredients.isEmpty = false := by decide

theorem recipe_651c621bb138_steps_nonempty :
    recipe_651c621bb138.steps.isEmpty = false := by decide

theorem recipe_651c621bb138_step_count :
    recipe_651c621bb138.steps.length = 6 := by decide

theorem recipe_651c621bb138_steps_ordered :
    orderedFrom 1 recipe_651c621bb138.steps = true := by decide

theorem recipe_651c621bb138_executes_to_terminal :
    executesToTerminal recipe_651c621bb138 = true := by decide

theorem recipe_651c621bb138_kernel_certificate :
    kernelCertified recipe_651c621bb138 = true := by decide

end LeanToCook.SourceCatalog
