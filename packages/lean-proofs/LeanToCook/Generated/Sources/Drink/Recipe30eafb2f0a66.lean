/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 百香果橙子特调 · dishes/drink/百香果橙子特调/百香果橙子特调.md -/
def recipe_30eafb2f0a66 : Recipe := {
  id := "30eafb2f0a66"
  title := "百香果橙子特调"
  category := "drink"
  sourcePath := "dishes/drink/百香果橙子特调/百香果橙子特调.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "原料:",
    "百香果",
    "橙子",
    "茉莉绿茶茶叶/苏打气泡水二选一",
    "白砂糖",
    "冰块",
    "蜂蜜（可选）",
    "薄荷叶或其他绿叶（可选，装饰使用）",
    "工具",
    "手动压汁器"
  ]
  steps := [
    { index := 1, instruction := "百香果腌制（因为量小不好配置，这里是两次的分量）" },
    { index := 2, instruction := "茉莉绿茶调配（推荐比例=>茶 : 水 : 冰 = 12 : 50 : 30）" },
    { index := 3, instruction := "橙子的处理（可在泡茶期间处理）" },
    { index := 4, instruction := "正式调配" }
  ]
}

theorem recipe_30eafb2f0a66_ingredients_nonempty :
    recipe_30eafb2f0a66.ingredients.isEmpty = false := by decide

theorem recipe_30eafb2f0a66_steps_nonempty :
    recipe_30eafb2f0a66.steps.isEmpty = false := by decide

theorem recipe_30eafb2f0a66_step_count :
    recipe_30eafb2f0a66.steps.length = 4 := by decide

theorem recipe_30eafb2f0a66_steps_ordered :
    orderedFrom 1 recipe_30eafb2f0a66.steps = true := by decide

theorem recipe_30eafb2f0a66_executes_to_terminal :
    executesToTerminal recipe_30eafb2f0a66 = true := by decide

theorem recipe_30eafb2f0a66_kernel_certificate :
    kernelCertified recipe_30eafb2f0a66 = true := by decide

end LeanToCook.SourceCatalog
