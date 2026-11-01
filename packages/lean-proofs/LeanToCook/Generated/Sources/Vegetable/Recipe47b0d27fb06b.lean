/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 芹菜拌茶树菇 · dishes/vegetable_dish/芹菜拌茶树菇/芹菜拌茶树菇.md -/
def recipe_47b0d27fb06b : Recipe := {
  id := "47b0d27fb06b"
  title := "芹菜拌茶树菇"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/芹菜拌茶树菇/芹菜拌茶树菇.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "闽星茶树菇",
    "芹菜",
    "香油",
    "蚝油",
    "味极鲜",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "（如果是芹菜苗这一步略过）用热水壶烧一壶热水，备用" },
    { index := 2, instruction := "新鲜的芹菜苗或者芹菜摘去黄叶清洗，备用" },
    { index := 3, instruction := "（如果是芹菜苗这一步略过）将芹菜摘去叶子单独放一个盆中，将芹菜茎用刀划成 2-3 毫米宽的芹菜条备用，这一步的目的是让芹菜断生的更快更均匀，吃起来更脆更爽口" },
    { index := 4, instruction := "芹菜苗切成 4cm 的芹菜段，备用" },
    { index := 5, instruction := "（如果是芹菜苗这一步略过）起锅开火，将热水壶的开水倒入锅中待水起泡沸腾" },
    { index := 6, instruction := "（如果是芹菜苗这一步略过）将切好的芹菜条放入锅中焯水，大约 20 秒放入芹菜叶,5 秒后关火全部捞出过凉水，备用" },
    { index := 7, instruction := "将盆中焯好的芹菜或者芹菜苗撒上准备好的食盐，香油，蚝油和味极鲜搅拌均匀" },
    { index := 8, instruction := "将茶树菇倒入盆中搅拌均匀" },
    { index := 9, instruction := "装盘" },
    { index := 10, instruction := "开吃" }
  ]
}

theorem recipe_47b0d27fb06b_ingredients_nonempty :
    recipe_47b0d27fb06b.ingredients.isEmpty = false := by decide

theorem recipe_47b0d27fb06b_steps_nonempty :
    recipe_47b0d27fb06b.steps.isEmpty = false := by decide

theorem recipe_47b0d27fb06b_step_count :
    recipe_47b0d27fb06b.steps.length = 10 := by decide

theorem recipe_47b0d27fb06b_steps_ordered :
    orderedFrom 1 recipe_47b0d27fb06b.steps = true := by decide

theorem recipe_47b0d27fb06b_executes_to_terminal :
    executesToTerminal recipe_47b0d27fb06b = true := by decide

theorem recipe_47b0d27fb06b_kernel_certificate :
    kernelCertified recipe_47b0d27fb06b = true := by decide

end LeanToCook.SourceCatalog
