/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烤鸡翅 · dishes/meat_dish/烤鸡翅.md -/
def recipe_f13ea0db41d8 : Recipe := {
  id := "f13ea0db41d8"
  title := "烤鸡翅"
  category := "meat"
  sourcePath := "dishes/meat_dish/烤鸡翅.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡翅中",
    "盐",
    "黑胡椒粉",
    "酱油",
    "料酒",
    "烤箱"
  ]
  steps := [
    { index := 1, instruction := "鸡翅放入碗中" },
    { index := 2, instruction := "加盐、黑胡椒粉、酱油、料酒进行腌制 30-40 分钟" },
    { index := 3, instruction := "将烤箱预热至 200℃" },
    { index := 4, instruction := "将腌制好的鸡翅均匀地放在烤盘上" },
    { index := 5, instruction := "将烤盘放入烤箱中层，烤 15-20 分钟" },
    { index := 6, instruction := "取出烤盘，将鸡翅翻面，再烤 15-20 分钟，直到熟透" }
  ]
}

theorem recipe_f13ea0db41d8_ingredients_nonempty :
    recipe_f13ea0db41d8.ingredients.isEmpty = false := by decide

theorem recipe_f13ea0db41d8_steps_nonempty :
    recipe_f13ea0db41d8.steps.isEmpty = false := by decide

theorem recipe_f13ea0db41d8_step_count :
    recipe_f13ea0db41d8.steps.length = 6 := by decide

theorem recipe_f13ea0db41d8_steps_ordered :
    orderedFrom 1 recipe_f13ea0db41d8.steps = true := by decide

theorem recipe_f13ea0db41d8_executes_to_terminal :
    executesToTerminal recipe_f13ea0db41d8 = true := by decide

theorem recipe_f13ea0db41d8_kernel_certificate :
    kernelCertified recipe_f13ea0db41d8 = true := by decide

end LeanToCook.SourceCatalog
