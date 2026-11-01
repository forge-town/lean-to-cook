/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 番茄牛肉蛋花汤 · dishes/soup/番茄牛肉蛋花汤.md -/
def recipe_28a9b2f06a8d : Recipe := {
  id := "28a9b2f06a8d"
  title := "番茄牛肉蛋花汤"
  category := "soup"
  sourcePath := "dishes/soup/番茄牛肉蛋花汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉",
    "番茄",
    "鸡蛋",
    "葱、姜、蒜",
    "盐",
    "胡椒粉"
  ]
  steps := [
    { index := 1, instruction := "牛肉切成薄片" },
    { index := 2, instruction := "番茄切成小块" },
    { index := 3, instruction := "葱切成葱花" },
    { index := 4, instruction := "姜切成姜片" },
    { index := 5, instruction := "蒜剁成蒜泥" },
    { index := 6, instruction := "牛肉放入碗中" },
    { index := 7, instruction := "加盐、胡椒粉腌制 15-20 分钟" },
    { index := 8, instruction := "加水煮开" },
    { index := 9, instruction := "加入姜片和牛肉片，煮至牛肉变色" },
    { index := 10, instruction := "加入番茄块，煮至番茄变软" },
    { index := 11, instruction := "打散鸡蛋液，缓慢地倒入锅中，用筷子搅拌形成蛋花" },
    { index := 12, instruction := "加入盐和胡椒粉调味" },
    { index := 13, instruction := "最后加入葱花，即可出锅" }
  ]
}

theorem recipe_28a9b2f06a8d_ingredients_nonempty :
    recipe_28a9b2f06a8d.ingredients.isEmpty = false := by decide

theorem recipe_28a9b2f06a8d_steps_nonempty :
    recipe_28a9b2f06a8d.steps.isEmpty = false := by decide

theorem recipe_28a9b2f06a8d_step_count :
    recipe_28a9b2f06a8d.steps.length = 13 := by decide

theorem recipe_28a9b2f06a8d_steps_ordered :
    orderedFrom 1 recipe_28a9b2f06a8d.steps = true := by decide

theorem recipe_28a9b2f06a8d_executes_to_terminal :
    executesToTerminal recipe_28a9b2f06a8d = true := by decide

theorem recipe_28a9b2f06a8d_kernel_certificate :
    kernelCertified recipe_28a9b2f06a8d = true := by decide

end LeanToCook.SourceCatalog
