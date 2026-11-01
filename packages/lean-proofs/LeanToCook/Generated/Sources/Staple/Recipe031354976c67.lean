/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 螺蛳粉 · dishes/staple/螺蛳粉.md -/
def recipe_031354976c67 : Recipe := {
  id := "031354976c67"
  title := "螺蛳粉"
  category := "staple"
  sourcePath := "dishes/staple/螺蛳粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "袋装螺蛳粉一包，其中应该包含：",
    "米粉",
    "螺蛳肉包（可能放在配料包中）",
    "汤料包",
    "酸笋包、花生包、豆皮包、木耳包等配料包",
    "醋包、辣椒油等调味包",
    "煮锅",
    "电磁炉/灶台",
    "筷子一双"
  ]
  steps := [
    { index := 1, instruction := "锅中加水，将水烧开" },
    { index := 2, instruction := "下米粉，煮 3-5 分钟，期间用筷子搅拌，防止米粉粘在一起" },
    { index := 3, instruction := "下汤料包，按个人口味添加" },
    { index := 4, instruction := "下一部分配料包，如木耳，花生，螺蛳（这部分配料需要煮一会才入味）" },
    { index := 5, instruction := "下调味包，按个人口味添加" },
    { index := 6, instruction := "搅拌后捞出，放入碗中" },
    { index := 7, instruction := "下剩下的配料包，如酸笋，豆皮（这部分配料不适合被汤泡太久）" },
    { index := 8, instruction := "享用美食" }
  ]
}

theorem recipe_031354976c67_ingredients_nonempty :
    recipe_031354976c67.ingredients.isEmpty = false := by decide

theorem recipe_031354976c67_steps_nonempty :
    recipe_031354976c67.steps.isEmpty = false := by decide

theorem recipe_031354976c67_step_count :
    recipe_031354976c67.steps.length = 8 := by decide

theorem recipe_031354976c67_steps_ordered :
    orderedFrom 1 recipe_031354976c67.steps = true := by decide

theorem recipe_031354976c67_executes_to_terminal :
    executesToTerminal recipe_031354976c67 = true := by decide

theorem recipe_031354976c67_kernel_certificate :
    kernelCertified recipe_031354976c67 = true := by decide

end LeanToCook.SourceCatalog
