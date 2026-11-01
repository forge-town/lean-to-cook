/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 肉蛋盖饭 · dishes/staple/肉蛋盖饭.md -/
def recipe_580927b6ab1e : Recipe := {
  id := "580927b6ab1e"
  title := "肉蛋盖饭"
  category := "staple"
  sourcePath := "dishes/staple/肉蛋盖饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米饭",
    "鸡蛋",
    "肉馅",
    "老抽",
    "生抽",
    "醋",
    "红葱油（可选）",
    "葱",
    "油",
    "糖"
  ]
  steps := [
    { index := 1, instruction := "煮好米饭，通常使用买米赠送的量杯，一杯米 240g" },
    { index := 2, instruction := "锅中放油 30ml" },
    { index := 3, instruction := "放入肉馅，调中火煎至两面微焦" },
    { index := 4, instruction := "将鸡蛋打入锅中，不要打散，盖上锅盖" },
    { index := 5, instruction := "调一个碗汁，碗中放入计算中的对应数量的老抽，生抽，醋，糖，红葱油，搅拌均匀" },
    { index := 6, instruction := "打开锅盖，将碗汁倒入锅中，等待三分钟" },
    { index := 7, instruction := "关火，将肉蛋盖到米饭上" },
    { index := 8, instruction := "安全检查，开始食用盖饭" }
  ]
}

theorem recipe_580927b6ab1e_ingredients_nonempty :
    recipe_580927b6ab1e.ingredients.isEmpty = false := by decide

theorem recipe_580927b6ab1e_steps_nonempty :
    recipe_580927b6ab1e.steps.isEmpty = false := by decide

theorem recipe_580927b6ab1e_step_count :
    recipe_580927b6ab1e.steps.length = 8 := by decide

theorem recipe_580927b6ab1e_steps_ordered :
    orderedFrom 1 recipe_580927b6ab1e.steps = true := by decide

theorem recipe_580927b6ab1e_executes_to_terminal :
    executesToTerminal recipe_580927b6ab1e = true := by decide

theorem recipe_580927b6ab1e_kernel_certificate :
    kernelCertified recipe_580927b6ab1e = true := by decide

end LeanToCook.SourceCatalog
