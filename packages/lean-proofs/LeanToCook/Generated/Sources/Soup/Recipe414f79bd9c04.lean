/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿鸡蛋汤 · dishes/soup/西红柿鸡蛋汤.md -/
def recipe_414f79bd9c04 : Recipe := {
  id := "414f79bd9c04"
  title := "西红柿鸡蛋汤"
  category := "soup"
  sourcePath := "dishes/soup/西红柿鸡蛋汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西红柿",
    "鸡蛋",
    "香油",
    "味素",
    "盐",
    "葱、姜、蒜"
  ]
  steps := [
    { index := 1, instruction := "将西红柿洗净，切块。" },
    { index := 2, instruction := "葱姜蒜切碎。" },
    { index := 3, instruction := "鸡蛋打到碗中，用筷子（或打蛋器）搅拌均匀。" },
    { index := 4, instruction := "热锅，并放入 15 毫升的油，待能从油中看到冒出一丝烟时，放入葱姜蒜翻炒 30 秒。" },
    { index := 5, instruction := "放入西红柿翻炒 1 分钟。" },
    { index := 6, instruction := "倒入水，水的高度大约为锅内菜品高度的 1.2 倍，并放入盐。" },
    { index := 7, instruction := "待开锅后，将鸡蛋液放入，并用筷子将鸡蛋打散，放入味素和香油。" },
    { index := 8, instruction := "等待 30 秒，关火出锅。" }
  ]
}

theorem recipe_414f79bd9c04_ingredients_nonempty :
    recipe_414f79bd9c04.ingredients.isEmpty = false := by decide

theorem recipe_414f79bd9c04_steps_nonempty :
    recipe_414f79bd9c04.steps.isEmpty = false := by decide

theorem recipe_414f79bd9c04_step_count :
    recipe_414f79bd9c04.steps.length = 8 := by decide

theorem recipe_414f79bd9c04_steps_ordered :
    orderedFrom 1 recipe_414f79bd9c04.steps = true := by decide

theorem recipe_414f79bd9c04_executes_to_terminal :
    executesToTerminal recipe_414f79bd9c04 = true := by decide

theorem recipe_414f79bd9c04_kernel_certificate :
    kernelCertified recipe_414f79bd9c04 = true := by decide

end LeanToCook.SourceCatalog
