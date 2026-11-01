/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 清蒸南瓜 · dishes/vegetable_dish/清蒸南瓜.md -/
def recipe_d1ede91e3649 : Recipe := {
  id := "d1ede91e3649"
  title := "清蒸南瓜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/清蒸南瓜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "南瓜",
    "蒸锅"
  ]
  steps := [
    { index := 1, instruction := "将 南瓜 外皮洗净，去除瓜瓤和籽。" },
    { index := 2, instruction := "将 南瓜 切成厚度大约 2 cm 的片，备用。" },
    { index := 3, instruction := "在 蒸锅 的锅中加入 1000 ml 饮用水。" },
    { index := 4, instruction := "将切好的 南瓜 片均匀摆放在盘中。" },
    { index := 5, instruction := "待蒸锅中的水烧开后，将装有 南瓜 的盘子放入蒸锅中。" },
    { index := 6, instruction := "盖上锅盖，保持大火蒸 15-20 分钟，直至南瓜变软，可以用筷子轻松穿透。" },
    { index := 7, instruction := "关火，小心取出盘子。" }
  ]
}

theorem recipe_d1ede91e3649_ingredients_nonempty :
    recipe_d1ede91e3649.ingredients.isEmpty = false := by decide

theorem recipe_d1ede91e3649_steps_nonempty :
    recipe_d1ede91e3649.steps.isEmpty = false := by decide

theorem recipe_d1ede91e3649_step_count :
    recipe_d1ede91e3649.steps.length = 7 := by decide

theorem recipe_d1ede91e3649_steps_ordered :
    orderedFrom 1 recipe_d1ede91e3649.steps = true := by decide

theorem recipe_d1ede91e3649_executes_to_terminal :
    executesToTerminal recipe_d1ede91e3649 = true := by decide

theorem recipe_d1ede91e3649_kernel_certificate :
    kernelCertified recipe_d1ede91e3649 = true := by decide

end LeanToCook.SourceCatalog
