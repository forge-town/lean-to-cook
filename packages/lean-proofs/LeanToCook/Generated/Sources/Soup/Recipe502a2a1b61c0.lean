/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黄瓜皮蛋汤 · dishes/soup/黄瓜皮蛋汤.md -/
def recipe_502a2a1b61c0 : Recipe := {
  id := "502a2a1b61c0"
  title := "黄瓜皮蛋汤"
  category := "soup"
  sourcePath := "dishes/soup/黄瓜皮蛋汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黄瓜",
    "皮蛋",
    "大蒜",
    "小葱",
    "食用油（推荐猪油）",
    "盐",
    "鸡精（可选）"
  ]
  steps := [
    { index := 1, instruction := "黄瓜洗净，切成 0.5-1.2 mm 厚的薄片" },
    { index := 2, instruction := "葱洗净切成末，蒜用刀拍几下去皮，对半切一下" },
    { index := 3, instruction := "皮蛋剥去壳，然后每个切成 6-8 份。锅里倒入油，放入切好的皮蛋和大蒜" },
    { index := 4, instruction := "小火炒至皮蛋和大蒜表面有些焦黄，加入水，转大火烧开" },
    { index := 5, instruction := "放入黄瓜片。水再次沸腾以后立马关火，放入盐、鸡精调味即可出锅" },
    { index := 6, instruction := "装入碗中，再撒上葱花即可" }
  ]
}

theorem recipe_502a2a1b61c0_ingredients_nonempty :
    recipe_502a2a1b61c0.ingredients.isEmpty = false := by decide

theorem recipe_502a2a1b61c0_steps_nonempty :
    recipe_502a2a1b61c0.steps.isEmpty = false := by decide

theorem recipe_502a2a1b61c0_step_count :
    recipe_502a2a1b61c0.steps.length = 6 := by decide

theorem recipe_502a2a1b61c0_steps_ordered :
    orderedFrom 1 recipe_502a2a1b61c0.steps = true := by decide

theorem recipe_502a2a1b61c0_executes_to_terminal :
    executesToTerminal recipe_502a2a1b61c0 = true := by decide

theorem recipe_502a2a1b61c0_kernel_certificate :
    kernelCertified recipe_502a2a1b61c0 = true := by decide

end LeanToCook.SourceCatalog
