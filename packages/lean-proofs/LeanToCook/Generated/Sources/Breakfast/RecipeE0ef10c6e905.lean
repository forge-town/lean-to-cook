/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波炉荷包蛋 · dishes/breakfast/微波炉荷包蛋.md -/
def recipe_e0ef10c6e905 : Recipe := {
  id := "e0ef10c6e905"
  title := "微波炉荷包蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/微波炉荷包蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "芝麻油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "将鸡蛋打入小碗中，用筷子在所有鸡蛋黄上扎 2 个洞，避免加热弄脏微波炉" },
    { index := 2, instruction := "然后向碗内倒入常温饮用水" },
    { index := 3, instruction := "再向碗内倒入食用盐" },
    { index := 4, instruction := "最后加入芝麻油" },
    { index := 5, instruction := "将放好材料的碗放入微波炉中，高火加热 80 秒" },
    { index := 6, instruction := "到达设定时间后，使用抹布垫着手取出成品" }
  ]
}

theorem recipe_e0ef10c6e905_ingredients_nonempty :
    recipe_e0ef10c6e905.ingredients.isEmpty = false := by decide

theorem recipe_e0ef10c6e905_steps_nonempty :
    recipe_e0ef10c6e905.steps.isEmpty = false := by decide

theorem recipe_e0ef10c6e905_step_count :
    recipe_e0ef10c6e905.steps.length = 6 := by decide

theorem recipe_e0ef10c6e905_steps_ordered :
    orderedFrom 1 recipe_e0ef10c6e905.steps = true := by decide

theorem recipe_e0ef10c6e905_executes_to_terminal :
    executesToTerminal recipe_e0ef10c6e905 = true := by decide

theorem recipe_e0ef10c6e905_kernel_certificate :
    kernelCertified recipe_e0ef10c6e905 = true := by decide

end LeanToCook.SourceCatalog
