/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 淄博烧烤 · dishes/meat_dish/淄博烧烤/淄博烧烤.md -/
def recipe_abe023d49637 : Recipe := {
  id := "abe023d49637"
  title := "淄博烧烤"
  category := "meat"
  sourcePath := "dishes/meat_dish/淄博烧烤/淄博烧烤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪五花肉",
    "小薄饼（市售现成）",
    "大葱",
    "芝麻酱",
    "甜面酱",
    "芝麻盐",
    "烧烤炉",
    "烤网",
    "炭火或燃气"
  ]
  steps := [
    { index := 1, instruction := "五花肉切成厚度不超过 2cm 长的块，并串成串。（五花肉可以预先腌制一下，味道更佳）" },
    { index := 2, instruction := "大葱切成 5cm 长的葱段，备用" },
    { index := 3, instruction := "芝麻酱加 10ml 温水调稀，与甜面酱混合均匀，备用（可以换成\"芝麻盐\"）" },
    { index := 4, instruction := "点燃炭火，等待炭火烧至通红无明火状态（约 15 分钟）" },
    { index := 5, instruction := "将五花肉串均匀摆在在烤网上，烤至底面焦黄出油后翻面" },
    { index := 6, instruction := "继续烤制约 2 - 3 分钟，至两面焦黄、边缘微焦后取下" },
    { index := 7, instruction := "取一张小薄面饼平铺，抹上 3 - 4g 混合酱料" },
    { index := 8, instruction := "放上烤好的肉片和 1 - 2 段大葱，卷起即可食用" }
  ]
}

theorem recipe_abe023d49637_ingredients_nonempty :
    recipe_abe023d49637.ingredients.isEmpty = false := by decide

theorem recipe_abe023d49637_steps_nonempty :
    recipe_abe023d49637.steps.isEmpty = false := by decide

theorem recipe_abe023d49637_step_count :
    recipe_abe023d49637.steps.length = 8 := by decide

theorem recipe_abe023d49637_steps_ordered :
    orderedFrom 1 recipe_abe023d49637.steps = true := by decide

theorem recipe_abe023d49637_executes_to_terminal :
    executesToTerminal recipe_abe023d49637 = true := by decide

theorem recipe_abe023d49637_kernel_certificate :
    kernelCertified recipe_abe023d49637 = true := by decide

end LeanToCook.SourceCatalog
