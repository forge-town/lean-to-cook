/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蛏抱蛋 · dishes/aquatic/蛏抱蛋/蛏抱蛋.md -/
def recipe_9c598d5ae097 : Recipe := {
  id := "9c598d5ae097"
  title := "蛏抱蛋"
  category := "aquatic"
  sourcePath := "dishes/aquatic/蛏抱蛋/蛏抱蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蛏子",
    "鸡蛋",
    "食用油",
    "洋葱",
    "淀粉",
    "生抽",
    "鸡精",
    "料酒"
  ]
  steps := [
    { index := 1, instruction := "烧开水，将蛏子放入水中，水煮 2 分钟后，捞上来去壳，放入大碗" },
    { index := 2, instruction := "往大碗中加入洋葱、生抽、料酒、鸡精、生粉后，充分搅拌" },
    { index := 3, instruction := "往大碗中打入 2 个 鸡蛋，继续搅拌" },
    { index := 4, instruction := "起锅烧油，倒入碗中蛏子，煎炸至单面金黄后，翻面继续煎炸" }
  ]
}

theorem recipe_9c598d5ae097_ingredients_nonempty :
    recipe_9c598d5ae097.ingredients.isEmpty = false := by decide

theorem recipe_9c598d5ae097_steps_nonempty :
    recipe_9c598d5ae097.steps.isEmpty = false := by decide

theorem recipe_9c598d5ae097_step_count :
    recipe_9c598d5ae097.steps.length = 4 := by decide

theorem recipe_9c598d5ae097_steps_ordered :
    orderedFrom 1 recipe_9c598d5ae097.steps = true := by decide

theorem recipe_9c598d5ae097_executes_to_terminal :
    executesToTerminal recipe_9c598d5ae097 = true := by decide

theorem recipe_9c598d5ae097_kernel_certificate :
    kernelCertified recipe_9c598d5ae097 = true := by decide

end LeanToCook.SourceCatalog
