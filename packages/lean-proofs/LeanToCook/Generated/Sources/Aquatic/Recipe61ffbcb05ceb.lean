/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 白灼虾 · dishes/aquatic/白灼虾/白灼虾.md -/
def recipe_61ffbcb05ceb : Recipe := {
  id := "61ffbcb05ceb"
  title := "白灼虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/白灼虾/白灼虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "活虾",
    "洋葱",
    "姜",
    "蒜",
    "葱",
    "食用油",
    "酱油",
    "料酒",
    "芝麻",
    "蚝油",
    "香醋"
  ]
  steps := [
    { index := 1, instruction := "洋葱切小块，姜切片，平铺平底锅。" },
    { index := 2, instruction := "活虾冲洗一下（去除虾线、剪刀减掉虾腿虾须子都是可选操作），控水，铺在平底锅的洋葱、姜片之上。" },
    { index := 3, instruction := "锅内倒入料酒，盖上锅盖，中火 1 分钟，小火 5 分钟，关火 5 分钟。" },
    { index := 4, instruction := "和上一步并行操作，制作蘸料：" },
    { index := 5, instruction := "虾出锅，用干净的盘子装好。" }
  ]
}

theorem recipe_61ffbcb05ceb_ingredients_nonempty :
    recipe_61ffbcb05ceb.ingredients.isEmpty = false := by decide

theorem recipe_61ffbcb05ceb_steps_nonempty :
    recipe_61ffbcb05ceb.steps.isEmpty = false := by decide

theorem recipe_61ffbcb05ceb_step_count :
    recipe_61ffbcb05ceb.steps.length = 5 := by decide

theorem recipe_61ffbcb05ceb_steps_ordered :
    orderedFrom 1 recipe_61ffbcb05ceb.steps = true := by decide

theorem recipe_61ffbcb05ceb_executes_to_terminal :
    executesToTerminal recipe_61ffbcb05ceb = true := by decide

theorem recipe_61ffbcb05ceb_kernel_certificate :
    kernelCertified recipe_61ffbcb05ceb = true := by decide

end LeanToCook.SourceCatalog
