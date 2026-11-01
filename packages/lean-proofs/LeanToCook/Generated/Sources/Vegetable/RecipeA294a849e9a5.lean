/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 莴笋叶煎饼 · dishes/vegetable_dish/莴笋叶煎饼/莴笋叶煎饼.md -/
def recipe_a294a849e9a5 : Recipe := {
  id := "a294a849e9a5"
  title := "莴笋叶煎饼"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/莴笋叶煎饼/莴笋叶煎饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "莴笋叶",
    "鸡蛋",
    "食用油",
    "生抽",
    "淀粉",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "莴笋叶剁碎，加入鸡蛋、生粉、生抽、鸡精搅拌均匀备用" },
    { index := 2, instruction := "起锅烧油，倒入莴笋叶浆汁，均匀平铺在锅面上" },
    { index := 3, instruction := "第一面炸 120 S 后，翻面再炸 60 S 后出锅" }
  ]
}

theorem recipe_a294a849e9a5_ingredients_nonempty :
    recipe_a294a849e9a5.ingredients.isEmpty = false := by decide

theorem recipe_a294a849e9a5_steps_nonempty :
    recipe_a294a849e9a5.steps.isEmpty = false := by decide

theorem recipe_a294a849e9a5_step_count :
    recipe_a294a849e9a5.steps.length = 3 := by decide

theorem recipe_a294a849e9a5_steps_ordered :
    orderedFrom 1 recipe_a294a849e9a5.steps = true := by decide

theorem recipe_a294a849e9a5_executes_to_terminal :
    executesToTerminal recipe_a294a849e9a5 = true := by decide

theorem recipe_a294a849e9a5_kernel_certificate :
    kernelCertified recipe_a294a849e9a5 = true := by decide

end LeanToCook.SourceCatalog
