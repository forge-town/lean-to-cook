/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 温泉蛋 · dishes/breakfast/温泉蛋/温泉蛋.md -/
def recipe_0d12168d06e9 : Recipe := {
  id := "0d12168d06e9"
  title := "温泉蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/温泉蛋/温泉蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "厨房用温度计（尽量选用带有夹子的温度计）",
    "杯子（无特定要求，只要是杯子就行）",
    "昆布酱油（一种日式的少盐酱油，用于为温泉蛋调味）",
    "香葱"
  ]
  steps := [
    { index := 1, instruction := "在锅中盛装一定量自来水，确保水面没过约鸡蛋 3cm，水中插入温度计" },
    { index := 2, instruction := "开火或打开电磁炉，逐渐调整电磁炉功率或火苗大小，使得水温保持在 70 摄氏度" },
    { index := 3, instruction := "将鸡蛋放入锅中。鸡蛋不可互相堆叠，应皆在底部，并留有空间可以晃动" },
    { index := 4, instruction := "保持当前温度 25 分钟" },
    { index := 5, instruction := "准备一杯冰水" },
    { index := 6, instruction := "捞出鸡蛋，并立刻放入冰水中，等待 3 分钟" },
    { index := 7, instruction := "将鸡蛋打入小碗，完成制作" }
  ]
}

theorem recipe_0d12168d06e9_ingredients_nonempty :
    recipe_0d12168d06e9.ingredients.isEmpty = false := by decide

theorem recipe_0d12168d06e9_steps_nonempty :
    recipe_0d12168d06e9.steps.isEmpty = false := by decide

theorem recipe_0d12168d06e9_step_count :
    recipe_0d12168d06e9.steps.length = 7 := by decide

theorem recipe_0d12168d06e9_steps_ordered :
    orderedFrom 1 recipe_0d12168d06e9.steps = true := by decide

theorem recipe_0d12168d06e9_executes_to_terminal :
    executesToTerminal recipe_0d12168d06e9 = true := by decide

theorem recipe_0d12168d06e9_kernel_certificate :
    kernelCertified recipe_0d12168d06e9 = true := by decide

end LeanToCook.SourceCatalog
