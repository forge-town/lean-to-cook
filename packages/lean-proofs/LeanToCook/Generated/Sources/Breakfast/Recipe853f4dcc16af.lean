/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 水煮玉米 · dishes/breakfast/水煮玉米.md -/
def recipe_853f4dcc16af : Recipe := {
  id := "853f4dcc16af"
  title := "水煮玉米"
  category := "breakfast"
  sourcePath := "dishes/breakfast/水煮玉米.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜玉米",
    "放得下玉米的锅",
    "水",
    "盐",
    "糖（可选）"
  ]
  steps := [
    { index := 1, instruction := "将新鲜玉米剥去外皮，剩部分玉米皮入锅" },
    { index := 2, instruction := "加入淹过玉米约半节指头的水，加盐和糖" },
    { index := 3, instruction := "水煮开之后转至小火，加盖继续煮 15-20 分钟，玉米煮久点没事。" },
    { index := 4, instruction := "煮熟后沥干水分，冷却后食用。" }
  ]
}

theorem recipe_853f4dcc16af_ingredients_nonempty :
    recipe_853f4dcc16af.ingredients.isEmpty = false := by decide

theorem recipe_853f4dcc16af_steps_nonempty :
    recipe_853f4dcc16af.steps.isEmpty = false := by decide

theorem recipe_853f4dcc16af_step_count :
    recipe_853f4dcc16af.steps.length = 4 := by decide

theorem recipe_853f4dcc16af_steps_ordered :
    orderedFrom 1 recipe_853f4dcc16af.steps = true := by decide

theorem recipe_853f4dcc16af_executes_to_terminal :
    executesToTerminal recipe_853f4dcc16af = true := by decide

theorem recipe_853f4dcc16af_kernel_certificate :
    kernelCertified recipe_853f4dcc16af = true := by decide

end LeanToCook.SourceCatalog
