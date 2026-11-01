/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黄瓜炒肉 · dishes/meat_dish/黄瓜炒肉.md -/
def recipe_292d0a9d95d8 : Recipe := {
  id := "292d0a9d95d8"
  title := "黄瓜炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/黄瓜炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黄瓜",
    "猪瘦肉",
    "食用油",
    "生抽",
    "盐",
    "蒜",
    "小米辣"
  ]
  steps := [
    { index := 1, instruction := "将猪瘦肉切片，放入碗中，倒入食用油 10 克，生抽，搅拌均匀，腌制 10 分钟" },
    { index := 2, instruction := "将黄瓜切去 5 厘米的头尾，剩余部分斜着切成 0.5 厘米的薄片" },
    { index := 3, instruction := "将黄瓜倒入碗中，撒上盐 8 克，搅拌均匀，腌制 5 分钟" },
    { index := 4, instruction := "将蒜瓣去皮，压扁，切成蒜末备用" },
    { index := 5, instruction := "将小米辣去丁切分成均匀 0.5 厘米的段状" },
    { index := 6, instruction := "热锅，倒油 40 克，等油温到冒烟，放入蒜蓉小米辣翻炒 5 次" },
    { index := 7, instruction := "放入腌制好的猪瘦肉，翻炒至肉熟变色" },
    { index := 8, instruction := "放入黄瓜，加入盐 2 克，大火翻炒均匀半分钟，出锅" }
  ]
}

theorem recipe_292d0a9d95d8_ingredients_nonempty :
    recipe_292d0a9d95d8.ingredients.isEmpty = false := by decide

theorem recipe_292d0a9d95d8_steps_nonempty :
    recipe_292d0a9d95d8.steps.isEmpty = false := by decide

theorem recipe_292d0a9d95d8_step_count :
    recipe_292d0a9d95d8.steps.length = 8 := by decide

theorem recipe_292d0a9d95d8_steps_ordered :
    orderedFrom 1 recipe_292d0a9d95d8.steps = true := by decide

theorem recipe_292d0a9d95d8_executes_to_terminal :
    executesToTerminal recipe_292d0a9d95d8 = true := by decide

theorem recipe_292d0a9d95d8_kernel_certificate :
    kernelCertified recipe_292d0a9d95d8 = true := by decide

end LeanToCook.SourceCatalog
