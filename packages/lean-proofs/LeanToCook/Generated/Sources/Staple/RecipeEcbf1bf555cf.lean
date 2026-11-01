/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酸辣蕨根粉 · dishes/staple/酸辣蕨根粉.md -/
def recipe_ecbf1bf555cf : Recipe := {
  id := "ecbf1bf555cf"
  title := "酸辣蕨根粉"
  category := "staple"
  sourcePath := "dishes/staple/酸辣蕨根粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蕨根粉",
    "油泼辣子",
    "酱油",
    "香醋",
    "小米辣（可选）",
    "蒜（可选）",
    "葱（可选）",
    "盐",
    "糖",
    "一口有点深度的锅"
  ]
  steps := [
    { index := 1, instruction := "锅中加入约为深度 3/5 的水，烧开" },
    { index := 2, instruction := "水沸腾后加入蕨根粉，中小火煮 8 分钟" },
    { index := 3, instruction := "出锅" },
    { index := 4, instruction := "根据配比，加入酱油、醋、油泼辣子" },
    { index := 5, instruction := "用筷子蘸取，尝一口" },
    { index := 6, instruction := "如果觉得此时酱油味稍浓，加入准备好的盐" },
    { index := 7, instruction := "如果觉得此时不够鲜，加入准备好的糖" },
    { index := 8, instruction := "充分搅拌至大部分颗粒状调料溶解" },
    { index := 9, instruction := "取一个碗" },
    { index := 10, instruction := "加入上一步调制的酱料" },
    { index := 11, instruction := "将蕨根粉过冷水后放入酱料中" },
    { index := 12, instruction := "充分搅拌" },
    { index := 13, instruction := "将准备的葱、蒜、小米辣切碎后撒在粉上" },
    { index := 14, instruction := "完成啦(｡･∀･)ﾉﾞ" }
  ]
}

theorem recipe_ecbf1bf555cf_ingredients_nonempty :
    recipe_ecbf1bf555cf.ingredients.isEmpty = false := by decide

theorem recipe_ecbf1bf555cf_steps_nonempty :
    recipe_ecbf1bf555cf.steps.isEmpty = false := by decide

theorem recipe_ecbf1bf555cf_step_count :
    recipe_ecbf1bf555cf.steps.length = 14 := by decide

theorem recipe_ecbf1bf555cf_steps_ordered :
    orderedFrom 1 recipe_ecbf1bf555cf.steps = true := by decide

theorem recipe_ecbf1bf555cf_executes_to_terminal :
    executesToTerminal recipe_ecbf1bf555cf = true := by decide

theorem recipe_ecbf1bf555cf_kernel_certificate :
    kernelCertified recipe_ecbf1bf555cf = true := by decide

end LeanToCook.SourceCatalog
