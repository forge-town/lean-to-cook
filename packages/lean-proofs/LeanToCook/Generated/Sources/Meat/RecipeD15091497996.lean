/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小炒肉 · dishes/meat_dish/小炒肉.md -/
def recipe_d15091497996 : Recipe := {
  id := "d15091497996"
  title := "小炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/小炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉",
    "朝天椒",
    "小米椒",
    "豆豉",
    "豆瓣酱",
    "老抽",
    "淀粉",
    "盐",
    "葱",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "五花肉切片" },
    { index := 2, instruction := "把肉放入器皿内，加入淀粉、老抽、盐搅拌腌制半小时" },
    { index := 3, instruction := "葱切段" },
    { index := 4, instruction := "小米椒、朝天椒斜刀切好" },
    { index := 5, instruction := "热锅、倒油" },
    { index := 6, instruction := "油热后加入五花肉煸炒。炒至变色后盛出来" },
    { index := 7, instruction := "向锅中加蒜，煸出香味，加入豆豉，翻炒均匀" },
    { index := 8, instruction := "加入豆瓣酱翻炒均匀" },
    { index := 9, instruction := "加入炒好的五花肉继续的翻炒均匀" },
    { index := 10, instruction := "加入小米椒、朝天椒、葱段翻炒 40 秒" },
    { index := 11, instruction := "出锅。" }
  ]
}

theorem recipe_d15091497996_ingredients_nonempty :
    recipe_d15091497996.ingredients.isEmpty = false := by decide

theorem recipe_d15091497996_steps_nonempty :
    recipe_d15091497996.steps.isEmpty = false := by decide

theorem recipe_d15091497996_step_count :
    recipe_d15091497996.steps.length = 11 := by decide

theorem recipe_d15091497996_steps_ordered :
    orderedFrom 1 recipe_d15091497996.steps = true := by decide

theorem recipe_d15091497996_executes_to_terminal :
    executesToTerminal recipe_d15091497996 = true := by decide

theorem recipe_d15091497996_kernel_certificate :
    kernelCertified recipe_d15091497996 = true := by decide

end LeanToCook.SourceCatalog
