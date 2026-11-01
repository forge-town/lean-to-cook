/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 冬瓜桑拿鸡 · dishes/meat_dish/冬瓜桑拿鸡.md -/
def recipe_75dec5080931 : Recipe := {
  id := "75dec5080931"
  title := "冬瓜桑拿鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/冬瓜桑拿鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡肉",
    "姜丝",
    "生抽",
    "蚝油",
    "盐",
    "食用油",
    "冬瓜",
    "虫草花"
  ]
  steps := [
    { index := 1, instruction := "鸡切块，加姜丝、生抽、蚝油、盐、食用油，揉搓均匀后腌制 20 分钟" },
    { index := 2, instruction := "冬瓜切薄片铺在盘子底部" },
    { index := 3, instruction := "再铺一层泡好的虫草花" },
    { index := 4, instruction := "把腌好的鸡肉铺在虫草花上面" },
    { index := 5, instruction := "水烧开后放入蒸锅，上汽后蒸 15 分钟，出锅即可" }
  ]
}

theorem recipe_75dec5080931_ingredients_nonempty :
    recipe_75dec5080931.ingredients.isEmpty = false := by decide

theorem recipe_75dec5080931_steps_nonempty :
    recipe_75dec5080931.steps.isEmpty = false := by decide

theorem recipe_75dec5080931_step_count :
    recipe_75dec5080931.steps.length = 5 := by decide

theorem recipe_75dec5080931_steps_ordered :
    orderedFrom 1 recipe_75dec5080931.steps = true := by decide

theorem recipe_75dec5080931_executes_to_terminal :
    executesToTerminal recipe_75dec5080931 = true := by decide

theorem recipe_75dec5080931_kernel_certificate :
    kernelCertified recipe_75dec5080931 = true := by decide

end LeanToCook.SourceCatalog
