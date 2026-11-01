/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 海边落日 · dishes/drink/海边落日/海边落日.md -/
def recipe_b261aa97c4ab : Recipe := {
  id := "b261aa97c4ab"
  title := "海边落日"
  category := "drink"
  sourcePath := "dishes/drink/海边落日/海边落日.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "红石榴糖浆",
    "NFC 橙汁",
    "苏打水",
    "白朗姆",
    "蓝橙力娇酒",
    "柠檬汁",
    "冰块",
    "柠檬",
    "大号的玻璃杯",
    "搅拌棒",
    "量酒器",
    "调酒杯",
    "吸管",
    "水果刀"
  ]
  steps := [
    { index := 1, instruction := "柠檬洗净切出一片" },
    { index := 2, instruction := "选择一个杯子，建议使用容量在 350400 毫升的透明玻璃杯" },
    { index := 3, instruction := "放入大冰块，用搅拌棒搅拌冰杯" },
    { index := 4, instruction := "加入红石榴糖浆" },
    { index := 5, instruction := "让橙汁沿搅拌棒导入酒杯，到就被一半就行" },
    { index := 6, instruction := "轻轻搅拌半圈" },
    { index := 7, instruction := "倒入苏打水" },
    { index := 8, instruction := "拿出调酒杯，加入白朗姆 + 蓝橙力娇酒 + 柠檬汁 + 冰块。然后 shake，shake" },
    { index := 9, instruction := "轻轻倒入酒杯中" },
    { index := 10, instruction := "插上柠檬和吸管" }
  ]
}

theorem recipe_b261aa97c4ab_ingredients_nonempty :
    recipe_b261aa97c4ab.ingredients.isEmpty = false := by decide

theorem recipe_b261aa97c4ab_steps_nonempty :
    recipe_b261aa97c4ab.steps.isEmpty = false := by decide

theorem recipe_b261aa97c4ab_step_count :
    recipe_b261aa97c4ab.steps.length = 10 := by decide

theorem recipe_b261aa97c4ab_steps_ordered :
    orderedFrom 1 recipe_b261aa97c4ab.steps = true := by decide

theorem recipe_b261aa97c4ab_executes_to_terminal :
    executesToTerminal recipe_b261aa97c4ab = true := by decide

theorem recipe_b261aa97c4ab_kernel_certificate :
    kernelCertified recipe_b261aa97c4ab = true := by decide

end LeanToCook.SourceCatalog
