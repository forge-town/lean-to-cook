/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒸箱鸡蛋羹 · dishes/vegetable_dish/鸡蛋羹/蒸箱鸡蛋羹.md -/
def recipe_9dff14f76013 : Recipe := {
  id := "9dff14f76013"
  title := "蒸箱鸡蛋羹"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/鸡蛋羹/蒸箱鸡蛋羹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "食用盐",
    "食用油",
    "生抽（可选）",
    "蒸箱"
  ]
  steps := [
    { index := 1, instruction := "一个鸡蛋放入碗中打散" },
    { index := 2, instruction := "向碗中加入鸡蛋体积 1.0-1.5 倍 60 度纯净水，并且搅拌均匀" },
    { index := 3, instruction := "加入食用盐 1g" },
    { index := 4, instruction := "加入食用油 5ml" },
    { index := 5, instruction := "过滤蛋液，去掉蛋液中的浮沫（可选，不过滤蒸出来的蛋会有气泡导致不好看）" },
    { index := 6, instruction := "确认蒸箱的水源已经补充至足够（若不确定，可把水槽补满）" },
    { index := 7, instruction := "将已经完全搅拌均匀的鸡蛋液碗放入蒸箱" },
    { index := 8, instruction := "调节至100摄氏度蒸 10 分钟" },
    { index := 9, instruction := "打开蒸箱 （注意：蒸箱在开启时会有蒸气瞬间喷出，注意缓慢开启）" },
    { index := 10, instruction := "出锅（可加入生抽调味）" },
    { index := 11, instruction := "享用" }
  ]
}

theorem recipe_9dff14f76013_ingredients_nonempty :
    recipe_9dff14f76013.ingredients.isEmpty = false := by decide

theorem recipe_9dff14f76013_steps_nonempty :
    recipe_9dff14f76013.steps.isEmpty = false := by decide

theorem recipe_9dff14f76013_step_count :
    recipe_9dff14f76013.steps.length = 11 := by decide

theorem recipe_9dff14f76013_steps_ordered :
    orderedFrom 1 recipe_9dff14f76013.steps = true := by decide

theorem recipe_9dff14f76013_executes_to_terminal :
    executesToTerminal recipe_9dff14f76013 = true := by decide

theorem recipe_9dff14f76013_kernel_certificate :
    kernelCertified recipe_9dff14f76013 = true := by decide

end LeanToCook.SourceCatalog
