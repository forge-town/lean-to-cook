/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 水油焖蔬菜 · dishes/vegetable_dish/水油焖蔬菜.md -/
def recipe_946a3f88bdec : Recipe := {
  id := "946a3f88bdec"
  title := "水油焖蔬菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/水油焖蔬菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "食用油",
    "盐",
    "蚝油（可选）",
    "叶菜类蔬菜"
  ]
  steps := [
    { index := 1, instruction := "洗净蔬菜" },
    { index := 2, instruction := "锅中加入 150ml 水，并烧开。（水不需要能完全没过蔬菜）" },
    { index := 3, instruction := "加入 3g 盐" },
    { index := 4, instruction := "（可选）加入 3ml 蚝油" },
    { index := 5, instruction := "加入 2ml 食用油" },
    { index := 6, instruction := "下菜， 翻拌一下，然后盖上锅盖焖 1 分钟" },
    { index := 7, instruction := "盛盘" }
  ]
}

theorem recipe_946a3f88bdec_ingredients_nonempty :
    recipe_946a3f88bdec.ingredients.isEmpty = false := by decide

theorem recipe_946a3f88bdec_steps_nonempty :
    recipe_946a3f88bdec.steps.isEmpty = false := by decide

theorem recipe_946a3f88bdec_step_count :
    recipe_946a3f88bdec.steps.length = 7 := by decide

theorem recipe_946a3f88bdec_steps_ordered :
    orderedFrom 1 recipe_946a3f88bdec.steps = true := by decide

theorem recipe_946a3f88bdec_executes_to_terminal :
    executesToTerminal recipe_946a3f88bdec = true := by decide

theorem recipe_946a3f88bdec_kernel_certificate :
    kernelCertified recipe_946a3f88bdec = true := by decide

end LeanToCook.SourceCatalog
