/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜香黄油虾 · dishes/aquatic/蒜香黄油虾/蒜香黄油虾.md -/
def recipe_65787a402898 : Recipe := {
  id := "65787a402898"
  title := "蒜香黄油虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/蒜香黄油虾/蒜香黄油虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大虾（推荐黑虎虾或基围虾）",
    "无盐黄油（推荐安佳）",
    "大蒜",
    "白葡萄酒（可选）",
    "柠檬",
    "平底煎锅",
    "厨房用夹"
  ]
  steps := [
    { index := 1, instruction := "大虾去头去壳留尾，用牙签挑去虾线，洗净后用厨房纸吸干水分" },
    { index := 2, instruction := "大蒜切成蒜末，备用" },
    { index := 3, instruction := "中火加热平底锅，放入 10ml 橄榄油" },
    { index := 4, instruction := "油热后放入大虾，每面煎 1-1.5 分钟至变色，取出备用" },
    { index := 5, instruction := "同一锅中加入黄油，融化后放入蒜末，小火炒香（约 30 秒）" },
    { index := 6, instruction := "如使用白葡萄酒，此时加入并煮至酒精挥发（约 1 分钟）" },
    { index := 7, instruction := "将虾放回锅中，与蒜香黄油酱汁翻炒均匀（约 1 分钟）" },
    { index := 8, instruction := "挤入柠檬汁，翻炒均匀后立即关火" },
    { index := 9, instruction := "装盘，淋上锅中剩余酱汁" }
  ]
}

theorem recipe_65787a402898_ingredients_nonempty :
    recipe_65787a402898.ingredients.isEmpty = false := by decide

theorem recipe_65787a402898_steps_nonempty :
    recipe_65787a402898.steps.isEmpty = false := by decide

theorem recipe_65787a402898_step_count :
    recipe_65787a402898.steps.length = 9 := by decide

theorem recipe_65787a402898_steps_ordered :
    orderedFrom 1 recipe_65787a402898.steps = true := by decide

theorem recipe_65787a402898_executes_to_terminal :
    executesToTerminal recipe_65787a402898 = true := by decide

theorem recipe_65787a402898_kernel_certificate :
    kernelCertified recipe_65787a402898 = true := by decide

end LeanToCook.SourceCatalog
