/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 桂林十八酿 · dishes/meat_dish/桂林十八酿/桂林十八酿.md -/
def recipe_b14f5054692b : Recipe := {
  id := "b14f5054692b"
  title := "桂林十八酿"
  category := "meat"
  sourcePath := "dishes/meat_dish/桂林十八酿/桂林十八酿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青椒、苦瓜、茄子、田螺、豆腐、香菇、南瓜花",
    "柚子、笋、冬瓜、香芋、蒜、番茄、豆芽、蛋、香菌",
    "原则：万物皆可酿",
    "猪肉馅（基础款，肥瘦比例 3:7）",
    "虾滑馅（fork 版本）",
    "鱼肉馅",
    "混合馅（猪肉 + 虾滑，猪肉 + 螺肉等自由组合）"
  ]
  steps := [
    { index := 1, instruction := "青椒酿：青椒去籽挖空 → 塞入猪肉馅或虾滑 → 煎至虎皮色 → 酱汁焖煮" },
    { index := 2, instruction := "田螺酿：田螺焯水取肉 → 螺肉与猪肉剁碎混合 → 塞回螺壳 → 紫苏薄荷焖煮" },
    { index := 3, instruction := "猪肉馅：最基础通用的选择，肥瘦 3:7 口感最佳" },
    { index := 4, instruction := "虾滑馅：鲜甜弹牙，青椒酿里常用" },
    { index := 5, instruction := "螺肉猪肉混合馅：田螺酿的灵魂，螺肉与猪肉 1:1，加紫苏薄荷" },
    { index := 6, instruction := "混合馅：猪肉 + 虾滑混搭，鲜甜与油脂香兼得" }
  ]
}

theorem recipe_b14f5054692b_ingredients_nonempty :
    recipe_b14f5054692b.ingredients.isEmpty = false := by decide

theorem recipe_b14f5054692b_steps_nonempty :
    recipe_b14f5054692b.steps.isEmpty = false := by decide

theorem recipe_b14f5054692b_step_count :
    recipe_b14f5054692b.steps.length = 6 := by decide

theorem recipe_b14f5054692b_steps_ordered :
    orderedFrom 1 recipe_b14f5054692b.steps = true := by decide

theorem recipe_b14f5054692b_executes_to_terminal :
    executesToTerminal recipe_b14f5054692b = true := by decide

theorem recipe_b14f5054692b_kernel_certificate :
    kernelCertified recipe_b14f5054692b = true := by decide

end LeanToCook.SourceCatalog
