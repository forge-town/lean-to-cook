/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 咕噜肉 · dishes/meat_dish/咕噜肉.md -/
def recipe_288b3f0b016a : Recipe := {
  id := "288b3f0b016a"
  title := "咕噜肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/咕噜肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "梅头猪肉",
    "青椒",
    "罐头菠萝片",
    "盐",
    "茄汁",
    "白醋",
    "蒜蓉",
    "生抽",
    "生粉",
    "白砂糖"
  ]
  steps := [
    { index := 1, instruction := "将梅头猪肉（100 克）洗净，然后用厨房纸抹干水份，将猪肉切成比想要的成品小一圈的大小。" },
    { index := 2, instruction := "用盐（1/2 茶匙）腌制梅头猪肉 20 分钟。" },
    { index := 3, instruction := "将青椒（25 克）切碎。" },
    { index := 4, instruction := "将菠萝片（75 克）切件。" },
    { index := 5, instruction := "在碗中加入茄汁（4 汤匙）﹑白醋（2 茶匙）﹑蒜蓉（1 汤匙）﹑生抽（½ 茶匙）﹑生粉（2½ 茶匙）﹑白砂糖（2 汤匙）﹑盐（¼ 茶匙）和水（200 毫升），拌匀成酱汁。" },
    { index := 6, instruction := "将梅头猪肉粒沾上生粉（6 汤匙）。" },
    { index := 7, instruction := "加入油（500 毫升）中火加热。" },
    { index := 8, instruction := "将梅头猪肉粒放至锅里中火炸 5 分钟，然后盛起。" },
    { index := 9, instruction := "加入梅头猪肉粒，再大火翻炸 1 分钟。" },
    { index := 10, instruction := "加入油（1 茶匙）和酱汁，中火加热 3 分钟。" },
    { index := 11, instruction := "加入青椒和菠萝，大火加热 2 分钟。" },
    { index := 12, instruction := "将已炸好的梅头猪肉粒与酱汁拌匀即可。" }
  ]
}

theorem recipe_288b3f0b016a_ingredients_nonempty :
    recipe_288b3f0b016a.ingredients.isEmpty = false := by decide

theorem recipe_288b3f0b016a_steps_nonempty :
    recipe_288b3f0b016a.steps.isEmpty = false := by decide

theorem recipe_288b3f0b016a_step_count :
    recipe_288b3f0b016a.steps.length = 12 := by decide

theorem recipe_288b3f0b016a_steps_ordered :
    orderedFrom 1 recipe_288b3f0b016a.steps = true := by decide

theorem recipe_288b3f0b016a_executes_to_terminal :
    executesToTerminal recipe_288b3f0b016a = true := by decide

theorem recipe_288b3f0b016a_kernel_certificate :
    kernelCertified recipe_288b3f0b016a = true := by decide

end LeanToCook.SourceCatalog
