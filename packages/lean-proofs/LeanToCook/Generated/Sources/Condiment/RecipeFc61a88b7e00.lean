/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜香酱油 · dishes/condiment/蒜香酱油.md -/
def recipe_fc61a88b7e00 : Recipe := {
  id := "fc61a88b7e00"
  title := "蒜香酱油"
  category := "condiment"
  sourcePath := "dishes/condiment/蒜香酱油.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蒜头",
    "白芝麻",
    "花生油",
    "酱油",
    "蘸料碟"
  ]
  steps := [
    { index := 1, instruction := "拍碎蒜头" },
    { index := 2, instruction := "往蘸料碟中加入酱油" },
    { index := 3, instruction := "起锅，加入花生油，等到油温滚烫后加入拍好的蒜头，炸半分钟" },
    { index := 4, instruction := "半分钟后，关火，把热油倒入蘸料碟，用筷子搅拌即可" }
  ]
}

theorem recipe_fc61a88b7e00_ingredients_nonempty :
    recipe_fc61a88b7e00.ingredients.isEmpty = false := by decide

theorem recipe_fc61a88b7e00_steps_nonempty :
    recipe_fc61a88b7e00.steps.isEmpty = false := by decide

theorem recipe_fc61a88b7e00_step_count :
    recipe_fc61a88b7e00.steps.length = 4 := by decide

theorem recipe_fc61a88b7e00_steps_ordered :
    orderedFrom 1 recipe_fc61a88b7e00.steps = true := by decide

theorem recipe_fc61a88b7e00_executes_to_terminal :
    executesToTerminal recipe_fc61a88b7e00 = true := by decide

theorem recipe_fc61a88b7e00_kernel_certificate :
    kernelCertified recipe_fc61a88b7e00 = true := by decide

end LeanToCook.SourceCatalog
