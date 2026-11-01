/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西葫芦炒鸡蛋 · dishes/vegetable_dish/西葫芦炒鸡蛋/西葫芦炒鸡蛋.md -/
def recipe_4d2ca8f35f3b : Recipe := {
  id := "4d2ca8f35f3b"
  title := "西葫芦炒鸡蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/西葫芦炒鸡蛋/西葫芦炒鸡蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西葫芦",
    "鸡蛋",
    "西红柿（可选）",
    "食用盐",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "西红柿洗净，切成小块，备用" },
    { index := 2, instruction := "西葫芦洗净，切成边长约为 4cm 的菱形，备用" },
    { index := 3, instruction := "打三个鸡蛋到碗里，打散搅匀，备用" },
    { index := 4, instruction := "热锅，锅内放入 5ml - 10ml 食用油" },
    { index := 5, instruction := "倒入鸡蛋，保持翻炒至鸡蛋成固体，用锅铲分成小块后盛到碗里，备用" },
    { index := 6, instruction := "锅内放入 5ml - 10ml 食用油，倒入西红柿，炒至变软" },
    { index := 7, instruction := "倒入西葫芦一起翻炒均匀，放入 6g 食用盐，将火调小然后等待 4 - 5 分钟" },
    { index := 8, instruction := "倒入备用的鸡蛋，中火翻炒 15 秒" },
    { index := 9, instruction := "关火，盛盘" }
  ]
}

theorem recipe_4d2ca8f35f3b_ingredients_nonempty :
    recipe_4d2ca8f35f3b.ingredients.isEmpty = false := by decide

theorem recipe_4d2ca8f35f3b_steps_nonempty :
    recipe_4d2ca8f35f3b.steps.isEmpty = false := by decide

theorem recipe_4d2ca8f35f3b_step_count :
    recipe_4d2ca8f35f3b.steps.length = 9 := by decide

theorem recipe_4d2ca8f35f3b_steps_ordered :
    orderedFrom 1 recipe_4d2ca8f35f3b.steps = true := by decide

theorem recipe_4d2ca8f35f3b_executes_to_terminal :
    executesToTerminal recipe_4d2ca8f35f3b = true := by decide

theorem recipe_4d2ca8f35f3b_kernel_certificate :
    kernelCertified recipe_4d2ca8f35f3b = true := by decide

end LeanToCook.SourceCatalog
