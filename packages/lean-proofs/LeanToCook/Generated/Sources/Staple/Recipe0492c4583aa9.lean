/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 空气炸锅照烧鸡饭 · dishes/staple/空气炸锅照烧鸡饭/空气炸锅照烧鸡饭.md -/
def recipe_0492c4583aa9 : Recipe := {
  id := "0492c4583aa9"
  title := "空气炸锅照烧鸡饭"
  category := "staple"
  sourcePath := "dishes/staple/空气炸锅照烧鸡饭/空气炸锅照烧鸡饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "丽滋饼干(Ritz crackers)",
    "酱油",
    "糖（白沙糖）"
  ]
  steps := [
    { index := 1, instruction := "将酱油、糖和醋混合在一起,搅匀料汁备用" },
    { index := 2, instruction := "另一个碗中加入鸡肉、鸡蛋、1/2 料汁和压碎的丽滋饼干。搅拌均匀" },
    { index := 3, instruction := "空气炸锅用箔纸碗铺底，加入肉饼混合物，将剩余的料汁均匀的倒在上面" },
    { index := 4, instruction := "350°F(177°C) 炸40 分钟。最好在米饭上食用" },
    { index := 5, instruction := "在外观呈金黄酥脆后出锅，切块盛盘" }
  ]
}

theorem recipe_0492c4583aa9_ingredients_nonempty :
    recipe_0492c4583aa9.ingredients.isEmpty = false := by decide

theorem recipe_0492c4583aa9_steps_nonempty :
    recipe_0492c4583aa9.steps.isEmpty = false := by decide

theorem recipe_0492c4583aa9_step_count :
    recipe_0492c4583aa9.steps.length = 5 := by decide

theorem recipe_0492c4583aa9_steps_ordered :
    orderedFrom 1 recipe_0492c4583aa9.steps = true := by decide

theorem recipe_0492c4583aa9_executes_to_terminal :
    executesToTerminal recipe_0492c4583aa9 = true := by decide

theorem recipe_0492c4583aa9_kernel_certificate :
    kernelCertified recipe_0492c4583aa9 = true := by decide

end LeanToCook.SourceCatalog
