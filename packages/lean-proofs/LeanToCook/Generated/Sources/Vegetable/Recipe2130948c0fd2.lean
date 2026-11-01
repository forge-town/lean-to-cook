/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿炒鸡蛋 · dishes/vegetable_dish/西红柿炒鸡蛋.md -/
def recipe_2130948c0fd2 : Recipe := {
  id := "2130948c0fd2"
  title := "西红柿炒鸡蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/西红柿炒鸡蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西红柿",
    "鸡蛋",
    "食用油",
    "盐",
    "糖（可选）",
    "葱花（可选）"
  ]
  steps := [
    { index := 1, instruction := "西红柿洗净" },
    { index := 2, instruction := "可选：去掉西红柿的外表皮" },
    { index := 3, instruction := "西红柿去蒂，切成边长不超过 4cm 的小块，即为 西红柿块" },
    { index := 4, instruction := "将鸡蛋打入碗中，加入 1g  份数 的盐，搅匀，即为 鸡蛋液" },
    { index := 5, instruction := "热锅，加入食用油" },
    { index := 6, instruction := "油热后，倒入 鸡蛋液。翻炒至鸡蛋结为固体且颜色微微发黄，即为 半熟鸡蛋" },
    { index := 7, instruction := "关火。将 半熟鸡蛋 盛盘，重新开火" },
    { index := 8, instruction := "加入 西红柿块，锅铲拍打并翻炒 20 秒，或至西红柿软烂" },
    { index := 9, instruction := "向锅中加入 半熟鸡蛋，翻炒均匀" },
    { index := 10, instruction := "加入剩余的盐、糖（可选，如果倾向于甜味版本）、葱花（可选），翻炒均匀" },
    { index := 11, instruction := "关火，盛盘" }
  ]
}

theorem recipe_2130948c0fd2_ingredients_nonempty :
    recipe_2130948c0fd2.ingredients.isEmpty = false := by decide

theorem recipe_2130948c0fd2_steps_nonempty :
    recipe_2130948c0fd2.steps.isEmpty = false := by decide

theorem recipe_2130948c0fd2_step_count :
    recipe_2130948c0fd2.steps.length = 11 := by decide

theorem recipe_2130948c0fd2_steps_ordered :
    orderedFrom 1 recipe_2130948c0fd2.steps = true := by decide

theorem recipe_2130948c0fd2_executes_to_terminal :
    executesToTerminal recipe_2130948c0fd2 = true := by decide

theorem recipe_2130948c0fd2_kernel_certificate :
    kernelCertified recipe_2130948c0fd2 = true := by decide

end LeanToCook.SourceCatalog
