/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炸薯条 · dishes/semi-finished/炸薯条/炸薯条.md -/
def recipe_f3e472bcc3e6 : Recipe := {
  id := "f3e472bcc3e6"
  title := "炸薯条"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/炸薯条/炸薯条.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "1 袋半成品薯条（推荐品牌麦肯）",
    "1 个空气炸锅（喜欢脆的切忌小牌子）"
  ]
  steps := [
    { index := 1, instruction := "开封大分量半成品薯条注意开口要小，可以有效减少长久储藏下薯条表面结霜。" },
    { index := 2, instruction := "插电，200℃预热 5 分钟。" },
    { index := 3, instruction := "预热的目的是为了确保放入食材的时候锅内温度已经处于烹饪所需温度。" },
    { index := 4, instruction := "注意，预热完再拿出薯条，不应等薯条软化后再炸制。" },
    { index := 5, instruction := "取出薯条放入空气炸锅，200℃20 分钟。" },
    { index := 6, instruction := "取出薯条的时候注意半成品薯条已经有油，所以要异步去做客户端内刀斯林的话需要使用夹持工具。" },
    { index := 7, instruction := "510 分钟时可以拿出锅体晃动使薯条受热均匀也防止粘连。" },
    { index := 8, instruction := "10 分钟15 分钟时，拿出锅体，往已经干了的薯条表面喷 1 层面积为薯条表面积 2/3 的油。" },
    { index := 9, instruction := "喜欢脆薯条的，取出后拿着锅体跳舞让空气经过薯条表面后装盘；喜欢软薯条的直接装盘。配合蘸酱或浇上酱汁更佳。" }
  ]
}

theorem recipe_f3e472bcc3e6_ingredients_nonempty :
    recipe_f3e472bcc3e6.ingredients.isEmpty = false := by decide

theorem recipe_f3e472bcc3e6_steps_nonempty :
    recipe_f3e472bcc3e6.steps.isEmpty = false := by decide

theorem recipe_f3e472bcc3e6_step_count :
    recipe_f3e472bcc3e6.steps.length = 9 := by decide

theorem recipe_f3e472bcc3e6_steps_ordered :
    orderedFrom 1 recipe_f3e472bcc3e6.steps = true := by decide

theorem recipe_f3e472bcc3e6_executes_to_terminal :
    executesToTerminal recipe_f3e472bcc3e6 = true := by decide

theorem recipe_f3e472bcc3e6_kernel_certificate :
    kernelCertified recipe_f3e472bcc3e6 = true := by decide

end LeanToCook.SourceCatalog
