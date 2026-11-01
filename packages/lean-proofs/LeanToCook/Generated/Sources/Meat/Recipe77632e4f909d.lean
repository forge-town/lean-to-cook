/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 茭白炒肉 · dishes/meat_dish/茭白炒肉/茭白炒肉.md -/
def recipe_77632e4f909d : Recipe := {
  id := "77632e4f909d"
  title := "茭白炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/茭白炒肉/茭白炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茭白",
    "瘦肉",
    "淀粉",
    "食用油",
    "鸡精",
    "姜",
    "蒜",
    "料酒",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "茭白切片，每片厚度 0.5 cm" },
    { index := 2, instruction := "瘦肉切条，厚度 0.3-0.5 cm，加入料酒、生粉、盐、水搅拌" },
    { index := 3, instruction := "姜切片、蒜头剁碎" },
    { index := 4, instruction := "起锅水烧开，放入茭白，水煮 60-90 S 后取出沥干" },
    { index := 5, instruction := "起锅，倒入 15 ml 油，倒入瘦肉，反复翻炒 60 S 取出" },
    { index := 6, instruction := "起锅，倒入 15 ml 油，倒入姜、蒜翻炒 30S，加入茭白继续翻炒 30 S" },
    { index := 7, instruction := "继续加入瘦肉翻炒 60 S，加入 20 ml 水，加入盐、鸡精后翻炒 60S 出锅" }
  ]
}

theorem recipe_77632e4f909d_ingredients_nonempty :
    recipe_77632e4f909d.ingredients.isEmpty = false := by decide

theorem recipe_77632e4f909d_steps_nonempty :
    recipe_77632e4f909d.steps.isEmpty = false := by decide

theorem recipe_77632e4f909d_step_count :
    recipe_77632e4f909d.steps.length = 7 := by decide

theorem recipe_77632e4f909d_steps_ordered :
    orderedFrom 1 recipe_77632e4f909d.steps = true := by decide

theorem recipe_77632e4f909d_executes_to_terminal :
    executesToTerminal recipe_77632e4f909d = true := by decide

theorem recipe_77632e4f909d_kernel_certificate :
    kernelCertified recipe_77632e4f909d = true := by decide

end LeanToCook.SourceCatalog
