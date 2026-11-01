/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 太阳蛋 · dishes/breakfast/太阳蛋.md -/
def recipe_09402d43ecdf : Recipe := {
  id := "09402d43ecdf"
  title := "太阳蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/太阳蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "盐",
    "油",
    "分可控火候微波炉或不可控火候微波炉（定义和分辨方式请见附加内容）",
    "筷子或牙签"
  ]
  steps := [
    { index := 1, instruction := "准备一个小碗，倒入在上一步计算好的油，撒盐，搅拌均匀。倾斜碗使油沾在碗表面。" },
    { index := 2, instruction := "取出一个鸡蛋，打入小碗。" },
    { index := 3, instruction := "蛋黄表面戳孔。牙签戳 5 个或筷子戳 1 个。" },
    { index := 4, instruction := "放入微波炉，中火 3 分钟。" },
    { index := 5, instruction := "准备一个小碗，倒入在上一步计算好的油，撒盐，搅拌均匀。倾斜碗使油沾在碗表面。" },
    { index := 6, instruction := "取出一个鸡蛋，打入小碗。" },
    { index := 7, instruction := "蛋黄表面戳孔。牙签戳 5 个或筷子戳 1 个。" },
    { index := 8, instruction := "放入微波炉，1 分钟。" },
    { index := 9, instruction := "while（太阳蛋 否 大面积成固体状） 用微波炉打(30s);" }
  ]
}

theorem recipe_09402d43ecdf_ingredients_nonempty :
    recipe_09402d43ecdf.ingredients.isEmpty = false := by decide

theorem recipe_09402d43ecdf_steps_nonempty :
    recipe_09402d43ecdf.steps.isEmpty = false := by decide

theorem recipe_09402d43ecdf_step_count :
    recipe_09402d43ecdf.steps.length = 9 := by decide

theorem recipe_09402d43ecdf_steps_ordered :
    orderedFrom 1 recipe_09402d43ecdf.steps = true := by decide

theorem recipe_09402d43ecdf_executes_to_terminal :
    executesToTerminal recipe_09402d43ecdf = true := by decide

theorem recipe_09402d43ecdf_kernel_certificate :
    kernelCertified recipe_09402d43ecdf = true := by decide

end LeanToCook.SourceCatalog
