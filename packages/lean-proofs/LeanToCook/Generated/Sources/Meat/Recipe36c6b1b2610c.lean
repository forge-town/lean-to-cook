/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 意式烤鸡 · dishes/meat_dish/意式烤鸡.md -/
def recipe_36c6b1b2610c : Recipe := {
  id := "36c6b1b2610c"
  title := "意式烤鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/意式烤鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿肉",
    "盐",
    "黑胡椒",
    "橄榄油",
    "蒜",
    "柠檬汁",
    "欧芹"
  ]
  steps := [
    { index := 1, instruction := "鸡腿肉涂上盐、黑胡椒、橄榄油和蒜末" },
    { index := 2, instruction := "放入预热至 180 度的烤箱中，烤 30-40 分钟或至熟" },
    { index := 3, instruction := "欧芹切成碎末备用" },
    { index := 4, instruction := "柠檬挤出汁备用" },
    { index := 5, instruction := "烤好的鸡肉取出，淋上柠檬汁" },
    { index := 6, instruction := "撒上欧芹碎即可" }
  ]
}

theorem recipe_36c6b1b2610c_ingredients_nonempty :
    recipe_36c6b1b2610c.ingredients.isEmpty = false := by decide

theorem recipe_36c6b1b2610c_steps_nonempty :
    recipe_36c6b1b2610c.steps.isEmpty = false := by decide

theorem recipe_36c6b1b2610c_step_count :
    recipe_36c6b1b2610c.steps.length = 6 := by decide

theorem recipe_36c6b1b2610c_steps_ordered :
    orderedFrom 1 recipe_36c6b1b2610c.steps = true := by decide

theorem recipe_36c6b1b2610c_executes_to_terminal :
    executesToTerminal recipe_36c6b1b2610c = true := by decide

theorem recipe_36c6b1b2610c_kernel_certificate :
    kernelCertified recipe_36c6b1b2610c = true := by decide

end LeanToCook.SourceCatalog
