/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿豆腐汤羹 · dishes/vegetable_dish/西红柿豆腐汤羹/西红柿豆腐汤羹.md -/
def recipe_2a19546cdca8 : Recipe := {
  id := "2a19546cdca8"
  title := "西红柿豆腐汤羹"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/西红柿豆腐汤羹/西红柿豆腐汤羹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西红柿",
    "鸡蛋",
    "豆腐",
    "食用油",
    "盐",
    "淀粉",
    "鸡精",
    "香葱",
    "姜",
    "开水"
  ]
  steps := [
    { index := 1, instruction := "西红柿切成小丁、鸡蛋打入碗中搅拌、豆腐切块备用" },
    { index := 2, instruction := "起锅烧油，放入姜片 5 S 后倒入入西红柿翻炒 30 S" },
    { index := 3, instruction := "锅中加入开水，汤水烧开，60 S 后到入鸡蛋液、豆腐块" },
    { index := 4, instruction := "汤水重新烧开后，加入水淀粉，沿一个方向搅拌 2 圈" },
    { index := 5, instruction := "加入鸡精、盐、香葱，30 S 后起锅" }
  ]
}

theorem recipe_2a19546cdca8_ingredients_nonempty :
    recipe_2a19546cdca8.ingredients.isEmpty = false := by decide

theorem recipe_2a19546cdca8_steps_nonempty :
    recipe_2a19546cdca8.steps.isEmpty = false := by decide

theorem recipe_2a19546cdca8_step_count :
    recipe_2a19546cdca8.steps.length = 5 := by decide

theorem recipe_2a19546cdca8_steps_ordered :
    orderedFrom 1 recipe_2a19546cdca8.steps = true := by decide

theorem recipe_2a19546cdca8_executes_to_terminal :
    executesToTerminal recipe_2a19546cdca8 = true := by decide

theorem recipe_2a19546cdca8_kernel_certificate :
    kernelCertified recipe_2a19546cdca8 = true := by decide

end LeanToCook.SourceCatalog
