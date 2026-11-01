/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 松仁玉米 · dishes/vegetable_dish/松仁玉米.md -/
def recipe_b9ce9dd13400 : Recipe := {
  id := "b9ce9dd13400"
  title := "松仁玉米"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/松仁玉米.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "玉米粒（建议使用甜玉米）",
    "熟松子仁",
    "胡萝卜（可选，增加色彩）",
    "食用油",
    "白砂糖",
    "盐",
    "淀粉",
    "水"
  ]
  steps := [
    { index := 1, instruction := "玉米粒和胡萝卜丁提前焯水 1 分钟，捞出沥干备用" },
    { index := 2, instruction := "热锅凉油，放入胡萝卜丁略炒，再加入玉米粒翻炒" },
    { index := 3, instruction := "加入白砂糖和盐，炒匀" },
    { index := 4, instruction := "混合水与淀粉成水淀粉，倒入锅中快速翻炒使汤汁略稠" },
    { index := 5, instruction := "加入熟松仁翻炒均匀" },
    { index := 6, instruction := "出锅装盘" }
  ]
}

theorem recipe_b9ce9dd13400_ingredients_nonempty :
    recipe_b9ce9dd13400.ingredients.isEmpty = false := by decide

theorem recipe_b9ce9dd13400_steps_nonempty :
    recipe_b9ce9dd13400.steps.isEmpty = false := by decide

theorem recipe_b9ce9dd13400_step_count :
    recipe_b9ce9dd13400.steps.length = 6 := by decide

theorem recipe_b9ce9dd13400_steps_ordered :
    orderedFrom 1 recipe_b9ce9dd13400.steps = true := by decide

theorem recipe_b9ce9dd13400_executes_to_terminal :
    executesToTerminal recipe_b9ce9dd13400 = true := by decide

theorem recipe_b9ce9dd13400_kernel_certificate :
    kernelCertified recipe_b9ce9dd13400 = true := by decide

end LeanToCook.SourceCatalog
