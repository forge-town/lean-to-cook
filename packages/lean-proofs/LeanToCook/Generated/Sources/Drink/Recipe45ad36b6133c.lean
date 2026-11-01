/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 长岛冰茶 · dishes/drink/长岛冰茶.md -/
def recipe_45ad36b6133c : Recipe := {
  id := "45ad36b6133c"
  title := "长岛冰茶"
  category := "drink"
  sourcePath := "dishes/drink/长岛冰茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金酒",
    "龙舌兰酒",
    "伏特加",
    "白朗姆酒",
    "橙味甜酒",
    "柠檬",
    "枫糖浆",
    "可乐",
    "冰块",
    "高球杯（容量 300ml）"
  ]
  steps := [
    { index := 1, instruction := "柠檬对半切，挤出 30ml 柠檬汁至杯中；" },
    { index := 2, instruction := "依次向杯中加入：" },
    { index := 3, instruction := "向杯中缓慢倒入 20ml 枫糖浆，边倒边搅拌；" },
    { index := 4, instruction := "向杯中加入 75ml 可乐；" },
    { index := 5, instruction := "向杯中加入冰块直至满杯；" },
    { index := 6, instruction := "轻轻搅拌 20 秒；" },
    { index := 7, instruction := "开始享用." }
  ]
}

theorem recipe_45ad36b6133c_ingredients_nonempty :
    recipe_45ad36b6133c.ingredients.isEmpty = false := by decide

theorem recipe_45ad36b6133c_steps_nonempty :
    recipe_45ad36b6133c.steps.isEmpty = false := by decide

theorem recipe_45ad36b6133c_step_count :
    recipe_45ad36b6133c.steps.length = 7 := by decide

theorem recipe_45ad36b6133c_steps_ordered :
    orderedFrom 1 recipe_45ad36b6133c.steps = true := by decide

theorem recipe_45ad36b6133c_executes_to_terminal :
    executesToTerminal recipe_45ad36b6133c = true := by decide

theorem recipe_45ad36b6133c_kernel_certificate :
    kernelCertified recipe_45ad36b6133c = true := by decide

end LeanToCook.SourceCatalog
