/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 热干面 · dishes/staple/热干面.md -/
def recipe_d97323116a82 : Recipe := {
  id := "d97323116a82"
  title := "热干面"
  category := "staple"
  sourcePath := "dishes/staple/热干面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "热干面特有的碱水面",
    "小葱",
    "酸豆角",
    "肉末",
    "蒜水",
    "肉汤汁",
    "萝卜干",
    "芝麻酱",
    "辣椒油",
    "胡椒粉",
    "酱油",
    "食盐",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "水煮沸，并加入碱水面，焯烫 25 秒钟捞起" },
    { index := 2, instruction := "撒上食盐、鸡精和胡椒粉" },
    { index := 3, instruction := "芝麻酱用 90ml 水稀释，搅匀，然后加入" },
    { index := 4, instruction := "加入 5ml 酱油，加入 30ml 肉汤汁和蒜水" },
    { index := 5, instruction := "加入萝卜干，肉末，酸豆角，葱花" },
    { index := 6, instruction := "拌均匀后开吃" }
  ]
}

theorem recipe_d97323116a82_ingredients_nonempty :
    recipe_d97323116a82.ingredients.isEmpty = false := by decide

theorem recipe_d97323116a82_steps_nonempty :
    recipe_d97323116a82.steps.isEmpty = false := by decide

theorem recipe_d97323116a82_step_count :
    recipe_d97323116a82.steps.length = 6 := by decide

theorem recipe_d97323116a82_steps_ordered :
    orderedFrom 1 recipe_d97323116a82.steps = true := by decide

theorem recipe_d97323116a82_executes_to_terminal :
    executesToTerminal recipe_d97323116a82 = true := by decide

theorem recipe_d97323116a82_kernel_certificate :
    kernelCertified recipe_d97323116a82 = true := by decide

end LeanToCook.SourceCatalog
