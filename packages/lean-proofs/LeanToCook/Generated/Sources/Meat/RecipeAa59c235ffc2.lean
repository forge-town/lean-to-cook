/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 尖椒炒牛肉 · dishes/meat_dish/尖椒炒牛肉.md -/
def recipe_aa59c235ffc2 : Recipe := {
  id := "aa59c235ffc2"
  title := "尖椒炒牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/尖椒炒牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉",
    "葱、姜、蒜",
    "尖椒",
    "酱油",
    "盐",
    "糖"
  ]
  steps := [
    { index := 1, instruction := "蒜剁成蒜泥" },
    { index := 2, instruction := "葱切段" },
    { index := 3, instruction := "姜切成姜片" },
    { index := 4, instruction := "尖椒切成段" },
    { index := 5, instruction := "牛肉放入碗中" },
    { index := 6, instruction := "加姜、盐、酱油、糖进行腌制 30-40 分钟" },
    { index := 7, instruction := "腌制完姜可以去掉" },
    { index := 8, instruction := "冷油下锅，待油变热至偶有气泡" },
    { index := 9, instruction := "加入蒜泥" },
    { index := 10, instruction := "蒜泥变金黄后加入尖椒" },
    { index := 11, instruction := "待尖椒表皮微皱，加入腌制好的牛肉翻炒" },
    { index := 12, instruction := "翻炒变熟之前加入葱，继续翻炒" },
    { index := 13, instruction := "翻炒至牛肉变熟，关火出锅" }
  ]
}

theorem recipe_aa59c235ffc2_ingredients_nonempty :
    recipe_aa59c235ffc2.ingredients.isEmpty = false := by decide

theorem recipe_aa59c235ffc2_steps_nonempty :
    recipe_aa59c235ffc2.steps.isEmpty = false := by decide

theorem recipe_aa59c235ffc2_step_count :
    recipe_aa59c235ffc2.steps.length = 13 := by decide

theorem recipe_aa59c235ffc2_steps_ordered :
    orderedFrom 1 recipe_aa59c235ffc2.steps = true := by decide

theorem recipe_aa59c235ffc2_executes_to_terminal :
    executesToTerminal recipe_aa59c235ffc2 = true := by decide

theorem recipe_aa59c235ffc2_kernel_certificate :
    kernelCertified recipe_aa59c235ffc2 = true := by decide

end LeanToCook.SourceCatalog
