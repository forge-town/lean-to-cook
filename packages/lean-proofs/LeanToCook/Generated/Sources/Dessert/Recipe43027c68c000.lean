/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 龟苓膏 · dishes/dessert/龟苓膏/龟苓膏.md -/
def recipe_43027c68c000 : Recipe := {
  id := "43027c68c000"
  title := "龟苓膏"
  category := "dessert"
  sourcePath := "dishes/dessert/龟苓膏/龟苓膏.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "龟苓膏粉 25 克",
    "冷水 120 毫升",
    "开水 500 毫升",
    "白砂糖 100 克",
    "小锅",
    "搅拌工具",
    "模具或碗"
  ]
  steps := [
    { index := 1, instruction := "在锅中倒入龟苓膏粉 25 克与冷水 120 毫升，充分搅拌至无颗粒感。" },
    { index := 2, instruction := "在另一个容器中加入白砂糖 100 克，倒入沸水 500 毫升，搅拌至糖完全溶解。" },
    { index := 3, instruction := "将糖水缓慢倒入龟苓膏粉液中，立即搅拌均匀，避免结块。" },
    { index := 4, instruction := "将混合液体放入锅中，加热时保持中小火，并持续搅拌以防粘锅。" },
    { index := 5, instruction := "加热至液体变粘稠并开始冒小泡，即可关火。" },
    { index := 6, instruction := "快速将液体倒入模具中，自然冷却凝固。建议冷藏 12 小时后食用，口感更佳。" }
  ]
}

theorem recipe_43027c68c000_ingredients_nonempty :
    recipe_43027c68c000.ingredients.isEmpty = false := by decide

theorem recipe_43027c68c000_steps_nonempty :
    recipe_43027c68c000.steps.isEmpty = false := by decide

theorem recipe_43027c68c000_step_count :
    recipe_43027c68c000.steps.length = 6 := by decide

theorem recipe_43027c68c000_steps_ordered :
    orderedFrom 1 recipe_43027c68c000.steps = true := by decide

theorem recipe_43027c68c000_executes_to_terminal :
    executesToTerminal recipe_43027c68c000 = true := by decide

theorem recipe_43027c68c000_kernel_certificate :
    kernelCertified recipe_43027c68c000 = true := by decide

end LeanToCook.SourceCatalog
