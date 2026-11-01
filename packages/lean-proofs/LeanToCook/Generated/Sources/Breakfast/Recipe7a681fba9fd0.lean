/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 溏心蛋 · dishes/breakfast/溏心蛋.md -/
def recipe_7a681fba9fd0 : Recipe := {
  id := "7a681fba9fd0"
  title := "溏心蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/溏心蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "电锅",
    "水",
    "秒表（可选）"
  ]
  steps := [
    { index := 1, instruction := "将鸡蛋放入电锅中。鸡蛋不可互相堆叠，应皆在底部，并留有空间可以晃动" },
    { index := 2, instruction := "倒入淹过鸡蛋约 2 公分的冷水" },
    { index := 3, instruction := "开盖，使用最大功率加热至水滚起（大约 85 - 95 度，稍微滚动，不需完全沸腾）" },
    { index := 4, instruction := "关火，盖上盖子，让鸡蛋静置。" },
    { index := 5, instruction := "沥干水分，用冷水冲洗鸡蛋约 1 分钟，即可去壳食用。" }
  ]
}

theorem recipe_7a681fba9fd0_ingredients_nonempty :
    recipe_7a681fba9fd0.ingredients.isEmpty = false := by decide

theorem recipe_7a681fba9fd0_steps_nonempty :
    recipe_7a681fba9fd0.steps.isEmpty = false := by decide

theorem recipe_7a681fba9fd0_step_count :
    recipe_7a681fba9fd0.steps.length = 5 := by decide

theorem recipe_7a681fba9fd0_steps_ordered :
    orderedFrom 1 recipe_7a681fba9fd0.steps = true := by decide

theorem recipe_7a681fba9fd0_executes_to_terminal :
    executesToTerminal recipe_7a681fba9fd0 = true := by decide

theorem recipe_7a681fba9fd0_kernel_certificate :
    kernelCertified recipe_7a681fba9fd0 = true := by decide

end LeanToCook.SourceCatalog
