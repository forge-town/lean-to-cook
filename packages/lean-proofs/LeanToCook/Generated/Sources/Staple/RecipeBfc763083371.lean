/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 火腿饭团 · dishes/staple/火腿饭团/火腿饭团.md -/
def recipe_bfc763083371 : Recipe := {
  id := "bfc763083371"
  title := "火腿饭团"
  category := "staple"
  sourcePath := "dishes/staple/火腿饭团/火腿饭团.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "火腿",
    "米饭",
    "水",
    "冷冻青豆（可选）",
    "冷冻玉米粒（可选）",
    "海苔碎（可选）",
    "喜欢的沙拉酱（推荐日式 mayo！）"
  ]
  steps := [
    { index := 1, instruction := "将米饭和水放到电饭锅里，点击米饭模式，等待完成" },
    { index := 2, instruction := "冷冻玉米粒和青豆放到锅里，加水没过所有食材，沸腾后静待 2 分钟后，捞出。" },
    { index := 3, instruction := "火腿切成 1cm 的方块" },
    { index := 4, instruction := "与此同时，加入 10ml 食用油，加入火腿翻炒至火腿上色" },
    { index := 5, instruction := "将米饭，火腿，海苔碎，青豆，玉米粒，沙拉酱放入碗中，混合均匀即可" },
    { index := 6, instruction := "装盘（如果有的话）" }
  ]
}

theorem recipe_bfc763083371_ingredients_nonempty :
    recipe_bfc763083371.ingredients.isEmpty = false := by decide

theorem recipe_bfc763083371_steps_nonempty :
    recipe_bfc763083371.steps.isEmpty = false := by decide

theorem recipe_bfc763083371_step_count :
    recipe_bfc763083371.steps.length = 6 := by decide

theorem recipe_bfc763083371_steps_ordered :
    orderedFrom 1 recipe_bfc763083371.steps = true := by decide

theorem recipe_bfc763083371_executes_to_terminal :
    executesToTerminal recipe_bfc763083371 = true := by decide

theorem recipe_bfc763083371_kernel_certificate :
    kernelCertified recipe_bfc763083371 = true := by decide

end LeanToCook.SourceCatalog
