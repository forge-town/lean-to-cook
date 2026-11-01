/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 美式炒蛋 · dishes/breakfast/美式炒蛋.md -/
def recipe_a27c91703f1a : Recipe := {
  id := "a27c91703f1a"
  title := "美式炒蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/美式炒蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "全脂牛奶/奶油",
    "黄油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋打入大碗中，加盐搅打至起泡，静置 15 分钟" },
    { index := 2, instruction := "黄油切小块入锅，倒入蛋液，开小火不断搅拌" },
    { index := 3, instruction := "黄油一融化，就快速翻动蛋液，将其打碎成细密状，在蛋液大体凝固前关火" },
    { index := 4, instruction := "加入牛奶搅拌 15 秒，至炒蛋湿润绵密，装盘" }
  ]
}

theorem recipe_a27c91703f1a_ingredients_nonempty :
    recipe_a27c91703f1a.ingredients.isEmpty = false := by decide

theorem recipe_a27c91703f1a_steps_nonempty :
    recipe_a27c91703f1a.steps.isEmpty = false := by decide

theorem recipe_a27c91703f1a_step_count :
    recipe_a27c91703f1a.steps.length = 4 := by decide

theorem recipe_a27c91703f1a_steps_ordered :
    orderedFrom 1 recipe_a27c91703f1a.steps = true := by decide

theorem recipe_a27c91703f1a_executes_to_terminal :
    executesToTerminal recipe_a27c91703f1a = true := by decide

theorem recipe_a27c91703f1a_kernel_certificate :
    kernelCertified recipe_a27c91703f1a = true := by decide

end LeanToCook.SourceCatalog
