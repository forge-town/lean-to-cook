/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鸡蛋火腿炒黄瓜 · dishes/vegetable_dish/鸡蛋火腿炒黄瓜.md -/
def recipe_708eac43f729 : Recipe := {
  id := "708eac43f729"
  title := "鸡蛋火腿炒黄瓜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/鸡蛋火腿炒黄瓜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黄瓜",
    "鸡蛋",
    "火腿肠",
    "盐",
    "生抽",
    "红尖椒（可选）"
  ]
  steps := [
    { index := 1, instruction := "黄瓜洗净，切半圆形片，备用" },
    { index := 2, instruction := "火腿切半圆形片，备用" },
    { index := 3, instruction := "红尖椒（可选）切碎，备用" },
    { index := 4, instruction := "将鸡蛋打入碗中，搅匀，即为 鸡蛋液" },
    { index := 5, instruction := "热锅里倒 5ml 食用油" },
    { index := 6, instruction := "油热后转小火，倒入打散的鸡蛋液，用筷子划散，翻炒至鸡蛋结为固体且颜色微微发黄，即为 半熟鸡蛋，盛出备用" },
    { index := 7, instruction := "不用洗锅，往锅内倒入 5ml 食用油，倒入黄瓜片大火翻炒 1 分钟" },
    { index := 8, instruction := "把 半熟鸡蛋 倒入锅中，调入 2g 盐、3ml 生抽，立刻倒入火腿片和辣椒碎（可选）翻炒均匀" },
    { index := 9, instruction := "关火，盛盘" }
  ]
}

theorem recipe_708eac43f729_ingredients_nonempty :
    recipe_708eac43f729.ingredients.isEmpty = false := by decide

theorem recipe_708eac43f729_steps_nonempty :
    recipe_708eac43f729.steps.isEmpty = false := by decide

theorem recipe_708eac43f729_step_count :
    recipe_708eac43f729.steps.length = 9 := by decide

theorem recipe_708eac43f729_steps_ordered :
    orderedFrom 1 recipe_708eac43f729.steps = true := by decide

theorem recipe_708eac43f729_executes_to_terminal :
    executesToTerminal recipe_708eac43f729 = true := by decide

theorem recipe_708eac43f729_kernel_certificate :
    kernelCertified recipe_708eac43f729 = true := by decide

end LeanToCook.SourceCatalog
