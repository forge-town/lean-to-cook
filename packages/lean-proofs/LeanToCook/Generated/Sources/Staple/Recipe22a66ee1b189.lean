/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 咸肉菜饭 · dishes/staple/咸肉菜饭.md -/
def recipe_22a66ee1b189 : Recipe := {
  id := "22a66ee1b189"
  title := "咸肉菜饭"
  category := "staple"
  sourcePath := "dishes/staple/咸肉菜饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大米",
    "青菜（推荐矮脚青菜，又称上海青）",
    "咸肉（淡咸肉）",
    "冬笋（可选）",
    "猪油",
    "料酒（可选）",
    "白糖（可选）",
    "白胡椒粉（可选）"
  ]
  steps := [
    { index := 1, instruction := "如果加入冬笋，切薄片后冷水下锅煮 10 分钟去涩味" },
    { index := 2, instruction := "咸肉切 1 cm 小丁" },
    { index := 3, instruction := "咸肉和冬笋冷锅下 10 g 猪油、料酒、白糖，中小火煸炒到透明冒泡" },
    { index := 4, instruction := "青菜切碎，菜梗和菜叶分开放，菜梗切成 0.5 cm 边长的正方形小块，菜叶切成长 2-3 cm，宽 1-1.5 cm 的长方形小块" },
    { index := 5, instruction := "菜梗下锅炒到翡翠色" },
    { index := 6, instruction := "米淘净后倒进电饭煲，加水" },
    { index := 7, instruction := "把炒好的咸肉和菜梗铺在米上" },
    { index := 8, instruction := "正常煮饭模式启动，最后 10 分钟开盖快速铺入菜叶" },
    { index := 9, instruction := "煮好后焖 5 分钟，再淋 5 g 猪油、白胡椒粉疯狂翻拌均匀" }
  ]
}

theorem recipe_22a66ee1b189_ingredients_nonempty :
    recipe_22a66ee1b189.ingredients.isEmpty = false := by decide

theorem recipe_22a66ee1b189_steps_nonempty :
    recipe_22a66ee1b189.steps.isEmpty = false := by decide

theorem recipe_22a66ee1b189_step_count :
    recipe_22a66ee1b189.steps.length = 9 := by decide

theorem recipe_22a66ee1b189_steps_ordered :
    orderedFrom 1 recipe_22a66ee1b189.steps = true := by decide

theorem recipe_22a66ee1b189_executes_to_terminal :
    executesToTerminal recipe_22a66ee1b189 = true := by decide

theorem recipe_22a66ee1b189_kernel_certificate :
    kernelCertified recipe_22a66ee1b189 = true := by decide

end LeanToCook.SourceCatalog
