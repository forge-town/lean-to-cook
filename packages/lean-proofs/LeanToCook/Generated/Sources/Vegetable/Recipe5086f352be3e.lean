/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒲烧茄子 · dishes/vegetable_dish/蒲烧茄子.md -/
def recipe_5086f352be3e : Recipe := {
  id := "5086f352be3e"
  title := "蒲烧茄子"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蒲烧茄子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "蒲烧汁",
    "蜂蜜",
    "白糖",
    "生抽",
    "老抽",
    "料酒",
    "水"
  ]
  steps := [
    { index := 1, instruction := "茄子削皮、横着切成两段" },
    { index := 2, instruction := "蒸 5  分钟" },
    { index := 3, instruction := "纵向切开，不要切断，在两边切面各划 23 刀至可以摊平" },
    { index := 4, instruction := "煎至两面金黄" },
    { index := 5, instruction := "往茄子上浇蒲烧汁至没过 1/2 茄子高度" },
    { index := 6, instruction := "煎至背面上色，翻面" },
    { index := 7, instruction := "把剩下的蒲烧汁浇在茄子上" },
    { index := 8, instruction := "出锅，一份茄子烧蒲烧汁就烧好了" }
  ]
}

theorem recipe_5086f352be3e_ingredients_nonempty :
    recipe_5086f352be3e.ingredients.isEmpty = false := by decide

theorem recipe_5086f352be3e_steps_nonempty :
    recipe_5086f352be3e.steps.isEmpty = false := by decide

theorem recipe_5086f352be3e_step_count :
    recipe_5086f352be3e.steps.length = 8 := by decide

theorem recipe_5086f352be3e_steps_ordered :
    orderedFrom 1 recipe_5086f352be3e.steps = true := by decide

theorem recipe_5086f352be3e_executes_to_terminal :
    executesToTerminal recipe_5086f352be3e = true := by decide

theorem recipe_5086f352be3e_kernel_certificate :
    kernelCertified recipe_5086f352be3e = true := by decide

end LeanToCook.SourceCatalog
