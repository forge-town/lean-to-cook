/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 煮泡面加蛋 · dishes/staple/煮泡面加蛋.md -/
def recipe_103a45a25456 : Recipe := {
  id := "103a45a25456"
  title := "煮泡面加蛋"
  category := "staple"
  sourcePath := "dishes/staple/煮泡面加蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "泡面",
    "鸡蛋",
    "水"
  ]
  steps := [
    { index := 1, instruction := "先将水加热至沸腾（火候不做严格要求，使用热水会更快）" },
    { index := 2, instruction := "将取出的面饼放入锅中" },
    { index := 3, instruction := "将泡面里附带的佐料放入锅中" },
    { index := 4, instruction := "取出筷子轻微拨动泡面，使佐料充分溶解，面饼充分浸泡受热" },
    { index := 5, instruction := "盖上锅盖等待约 1 分钟至锅内水再次沸腾" },
    { index := 6, instruction := "去壳鸡蛋，加入锅中" },
    { index := 7, instruction := "等待约 3 至 4 分钟，即可" }
  ]
}

theorem recipe_103a45a25456_ingredients_nonempty :
    recipe_103a45a25456.ingredients.isEmpty = false := by decide

theorem recipe_103a45a25456_steps_nonempty :
    recipe_103a45a25456.steps.isEmpty = false := by decide

theorem recipe_103a45a25456_step_count :
    recipe_103a45a25456.steps.length = 7 := by decide

theorem recipe_103a45a25456_steps_ordered :
    orderedFrom 1 recipe_103a45a25456.steps = true := by decide

theorem recipe_103a45a25456_executes_to_terminal :
    executesToTerminal recipe_103a45a25456 = true := by decide

theorem recipe_103a45a25456_kernel_certificate :
    kernelCertified recipe_103a45a25456 = true := by decide

end LeanToCook.SourceCatalog
