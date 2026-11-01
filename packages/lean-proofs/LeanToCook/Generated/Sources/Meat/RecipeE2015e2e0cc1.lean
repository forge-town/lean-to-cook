/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 乡村啤酒鸭 · dishes/meat_dish/乡村啤酒鸭.md -/
def recipe_e2015e2e0cc1 : Recipe := {
  id := "e2015e2e0cc1"
  title := "乡村啤酒鸭"
  category := "meat"
  sourcePath := "dishes/meat_dish/乡村啤酒鸭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸭肉",
    "啤酒",
    "32 厘米以上的炒锅一个(锅太小难炒",
    "青椒",
    "红椒",
    "大蒜",
    "生姜",
    "小米椒",
    "蒜苗",
    "大葱",
    "草果",
    "桂皮",
    "八角",
    "香叶",
    "干辣椒"
  ]
  steps := [
    { index := 1, instruction := "鸭肉清洗一遍放进锅中" },
    { index := 2, instruction := "加清水淹没鸭肉" },
    { index := 3, instruction := "加 20 ml 料酒" },
    { index := 4, instruction := "加备用的 1 根 大葱" },
    { index := 5, instruction := "加生姜 ,拍散的 2 厘米" },
    { index := 6, instruction := "开火烧滚" },
    { index := 7, instruction := "捞出浮沫" },
    { index := 8, instruction := "鸭肉捞出，清水洗干净备用" },
    { index := 9, instruction := "锅清洗干净烧热，加 60ml 的花生油" },
    { index := 10, instruction := "油温到 60 度的时候，加一把花椒（ 30 颗）" },
    { index := 11, instruction := "加鸭肉翻炒 4 分钟" },
    { index := 12, instruction := "加入 1000 ml 的啤酒" },
    { index := 13, instruction := "烧鸭肉 30 分钟" },
    { index := 14, instruction := "出锅" }
  ]
}

theorem recipe_e2015e2e0cc1_ingredients_nonempty :
    recipe_e2015e2e0cc1.ingredients.isEmpty = false := by decide

theorem recipe_e2015e2e0cc1_steps_nonempty :
    recipe_e2015e2e0cc1.steps.isEmpty = false := by decide

theorem recipe_e2015e2e0cc1_step_count :
    recipe_e2015e2e0cc1.steps.length = 14 := by decide

theorem recipe_e2015e2e0cc1_steps_ordered :
    orderedFrom 1 recipe_e2015e2e0cc1.steps = true := by decide

theorem recipe_e2015e2e0cc1_executes_to_terminal :
    executesToTerminal recipe_e2015e2e0cc1 = true := by decide

theorem recipe_e2015e2e0cc1_kernel_certificate :
    kernelCertified recipe_e2015e2e0cc1 = true := by decide

end LeanToCook.SourceCatalog
