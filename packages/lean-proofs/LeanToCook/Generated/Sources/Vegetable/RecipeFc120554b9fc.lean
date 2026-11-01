/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌莴笋 · dishes/vegetable_dish/凉拌莴笋/凉拌莴笋.md -/
def recipe_fc120554b9fc : Recipe := {
  id := "fc120554b9fc"
  title := "凉拌莴笋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌莴笋/凉拌莴笋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "莴笋",
    "萝卜",
    "小米辣",
    "姜",
    "蒜头",
    "盐",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "莴笋削皮，切小条。萝卜切条，一起放入大碗，加入盐搅拌，放置 10 分钟" },
    { index := 2, instruction := "放置后的莴笋用水清洗 1-2 遍" },
    { index := 3, instruction := "起锅烧水，放入莴笋，水煮 1 分钟 捞出，沥干水分，放入大碗" },
    { index := 4, instruction := "起锅烧油，放入姜片、蒜粒、小米椒煸炒 30-45 S ，倒入莴笋中" },
    { index := 5, instruction := "搅拌充分，端盘" }
  ]
}

theorem recipe_fc120554b9fc_ingredients_nonempty :
    recipe_fc120554b9fc.ingredients.isEmpty = false := by decide

theorem recipe_fc120554b9fc_steps_nonempty :
    recipe_fc120554b9fc.steps.isEmpty = false := by decide

theorem recipe_fc120554b9fc_step_count :
    recipe_fc120554b9fc.steps.length = 5 := by decide

theorem recipe_fc120554b9fc_steps_ordered :
    orderedFrom 1 recipe_fc120554b9fc.steps = true := by decide

theorem recipe_fc120554b9fc_executes_to_terminal :
    executesToTerminal recipe_fc120554b9fc = true := by decide

theorem recipe_fc120554b9fc_kernel_certificate :
    kernelCertified recipe_fc120554b9fc = true := by decide

end LeanToCook.SourceCatalog
