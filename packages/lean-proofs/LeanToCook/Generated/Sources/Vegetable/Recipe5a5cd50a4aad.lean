/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 清炒花菜 · dishes/vegetable_dish/清炒花菜.md -/
def recipe_5a5cd50a4aad : Recipe := {
  id := "5a5cd50a4aad"
  title := "清炒花菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/清炒花菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "花菜",
    "大蒜",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "将 花菜 洗净，用刀或手掰成小朵，粗茎部分可以切片，备用。" },
    { index := 2, instruction := "将 大蒜 去皮，切成蒜片，备用。" },
    { index := 3, instruction := "锅中加入 1000 ml 饮用水，大火烧开。" },
    { index := 4, instruction := "放入 花菜 朵，煮 2-3 分钟，至花菜颜色变浅，口感稍微软化。" },
    { index := 5, instruction := "将 煮好的 花菜 捞出，沥干水分，备用。" },
    { index := 6, instruction := "热锅，加入 15 ml 食用油，大火烧热。" },
    { index := 7, instruction := "放入 蒜片，快速煸炒出香味。" },
    { index := 8, instruction := "放入 焯好水的 花菜 朵，转中大火，快速翻炒约 2 分钟，使花菜均匀受热。" },
    { index := 9, instruction := "加入 3 g 盐，继续翻炒均匀。" },
    { index := 10, instruction := "沿锅边淋入 50 ml 饮用水，盖上锅盖，焖 1 分钟，帮助花菜完全熟透入味。" },
    { index := 11, instruction := "开盖，快速翻炒均匀，即可出锅。" }
  ]
}

theorem recipe_5a5cd50a4aad_ingredients_nonempty :
    recipe_5a5cd50a4aad.ingredients.isEmpty = false := by decide

theorem recipe_5a5cd50a4aad_steps_nonempty :
    recipe_5a5cd50a4aad.steps.isEmpty = false := by decide

theorem recipe_5a5cd50a4aad_step_count :
    recipe_5a5cd50a4aad.steps.length = 11 := by decide

theorem recipe_5a5cd50a4aad_steps_ordered :
    orderedFrom 1 recipe_5a5cd50a4aad.steps = true := by decide

theorem recipe_5a5cd50a4aad_executes_to_terminal :
    executesToTerminal recipe_5a5cd50a4aad = true := by decide

theorem recipe_5a5cd50a4aad_kernel_certificate :
    kernelCertified recipe_5a5cd50a4aad = true := by decide

end LeanToCook.SourceCatalog
