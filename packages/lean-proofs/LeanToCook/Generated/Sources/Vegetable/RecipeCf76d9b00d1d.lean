/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 韭菜炒蛋 · dishes/vegetable_dish/韭菜炒蛋/韭菜炒蛋.md -/
def recipe_cf76d9b00d1d : Recipe := {
  id := "cf76d9b00d1d"
  title := "韭菜炒蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/韭菜炒蛋/韭菜炒蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "韭菜",
    "鸡蛋",
    "食用油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "韭菜洗净，沥干水分" },
    { index := 2, instruction := "韭菜切成约 3cm 长的小段，即为 韭菜段" },
    { index := 3, instruction := "将鸡蛋打入碗中，搅匀，即为 鸡蛋液" },
    { index := 4, instruction := "热锅，加入食用油" },
    { index := 5, instruction := "油热后，倒入 鸡蛋液，快速翻炒至鸡蛋凝固成块，盛出备用，即为 炒好的鸡蛋" },
    { index := 6, instruction := "锅中再加 5ml 食用油，放入 韭菜段，大火快速翻炒 30 秒" },
    { index := 7, instruction := "向锅中加入 炒好的鸡蛋，翻炒均匀" },
    { index := 8, instruction := "加入盐，翻炒均匀" },
    { index := 9, instruction := "关火，盛盘" }
  ]
}

theorem recipe_cf76d9b00d1d_ingredients_nonempty :
    recipe_cf76d9b00d1d.ingredients.isEmpty = false := by decide

theorem recipe_cf76d9b00d1d_steps_nonempty :
    recipe_cf76d9b00d1d.steps.isEmpty = false := by decide

theorem recipe_cf76d9b00d1d_step_count :
    recipe_cf76d9b00d1d.steps.length = 9 := by decide

theorem recipe_cf76d9b00d1d_steps_ordered :
    orderedFrom 1 recipe_cf76d9b00d1d.steps = true := by decide

theorem recipe_cf76d9b00d1d_executes_to_terminal :
    executesToTerminal recipe_cf76d9b00d1d = true := by decide

theorem recipe_cf76d9b00d1d_kernel_certificate :
    kernelCertified recipe_cf76d9b00d1d = true := by decide

end LeanToCook.SourceCatalog
