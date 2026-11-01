/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鸡蛋羹 · dishes/vegetable_dish/鸡蛋羹/鸡蛋羹.md -/
def recipe_afbed0895578 : Recipe := {
  id := "afbed0895578"
  title := "鸡蛋羹"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/鸡蛋羹/鸡蛋羹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "食用盐",
    "香油",
    "生抽 / 味极鲜",
    "白醋（可选）",
    "藤椒油（可选）"
  ]
  steps := [
    { index := 1, instruction := "两个鸡蛋放入碗中打散" },
    { index := 2, instruction := "加入食用盐 3g" },
    { index := 3, instruction := "加入 2ml 白醋，去除鸡蛋的腥味（可选）" },
    { index := 4, instruction := "向碗中加入鸡蛋体积 1-1.5 倍的 70 度纯净水，并且搅拌均匀" },
    { index := 5, instruction := "过滤蛋液，去掉蛋液中的浮沫（可选，不过滤蒸出来的蛋会有气泡导致不好看）" },
    { index := 6, instruction := "向任意一口锅中加入 300-500ml 清水，水烧开后，放入盛有鸡蛋液的碗" },
    { index := 7, instruction := "蒸煮步骤（二选一）" },
    { index := 8, instruction := "开中火蒸10 分钟, 10 分钟之后关火再闷上5 分钟。" },
    { index := 9, instruction := "开大火蒸5 分钟，要保持锅中水一直处于沸腾状态，否则要延长时间。每隔2 分钟开盖一次释放水蒸气，开盖过晚蛋羹容易变成蜂窝状；开盖太早/频繁蒸的时间需要久一些。" },
    { index := 10, instruction := "如何判断已经熟了？" },
    { index := 11, instruction := "出锅" },
    { index := 12, instruction := "加入香油和生抽即可享用" }
  ]
}

theorem recipe_afbed0895578_ingredients_nonempty :
    recipe_afbed0895578.ingredients.isEmpty = false := by decide

theorem recipe_afbed0895578_steps_nonempty :
    recipe_afbed0895578.steps.isEmpty = false := by decide

theorem recipe_afbed0895578_step_count :
    recipe_afbed0895578.steps.length = 12 := by decide

theorem recipe_afbed0895578_steps_ordered :
    orderedFrom 1 recipe_afbed0895578.steps = true := by decide

theorem recipe_afbed0895578_executes_to_terminal :
    executesToTerminal recipe_afbed0895578 = true := by decide

theorem recipe_afbed0895578_kernel_certificate :
    kernelCertified recipe_afbed0895578 = true := by decide

end LeanToCook.SourceCatalog
