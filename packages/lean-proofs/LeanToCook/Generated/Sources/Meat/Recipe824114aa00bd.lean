/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小炒黄牛肉 · dishes/meat_dish/小炒黄牛肉/小炒黄牛肉.md -/
def recipe_824114aa00bd : Recipe := {
  id := "824114aa00bd"
  title := "小炒黄牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/小炒黄牛肉/小炒黄牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛里脊",
    "芹菜",
    "小米椒",
    "野山椒",
    "香菜"
  ]
  steps := [
    { index := 1, instruction := "牛里脊切成不超过 3cm 宽，3mm 厚的薄片，倒入 6ml 酱油，用手抓匀备用" },
    { index := 2, instruction := "芹菜切成不超过 5cm 的小段，备用" },
    { index := 3, instruction := "小米椒切成丝状，备用" },
    { index := 4, instruction := "野山椒切成颗粒，备用" },
    { index := 5, instruction := "香菜切成成不超过 3cm 的小段，备用" },
    { index := 6, instruction := "热锅，锅内放入 15ml 食用油，大火等待 30 秒让油温升高" },
    { index := 7, instruction := "放入小米椒和野山椒爆香" },
    { index := 8, instruction := "放入牛里脊和芹菜，然后大火翻炒 1 分钟" },
    { index := 9, instruction := "关火，撒上香菜，盛盘" }
  ]
}

theorem recipe_824114aa00bd_ingredients_nonempty :
    recipe_824114aa00bd.ingredients.isEmpty = false := by decide

theorem recipe_824114aa00bd_steps_nonempty :
    recipe_824114aa00bd.steps.isEmpty = false := by decide

theorem recipe_824114aa00bd_step_count :
    recipe_824114aa00bd.steps.length = 9 := by decide

theorem recipe_824114aa00bd_steps_ordered :
    orderedFrom 1 recipe_824114aa00bd.steps = true := by decide

theorem recipe_824114aa00bd_executes_to_terminal :
    executesToTerminal recipe_824114aa00bd = true := by decide

theorem recipe_824114aa00bd_kernel_certificate :
    kernelCertified recipe_824114aa00bd = true := by decide

end LeanToCook.SourceCatalog
