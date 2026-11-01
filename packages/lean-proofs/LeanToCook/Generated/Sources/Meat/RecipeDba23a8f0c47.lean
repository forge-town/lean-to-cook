/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 羊排焖面 · dishes/meat_dish/羊排焖面/羊排焖面.md -/
def recipe_dba23a8f0c47 : Recipe := {
  id := "dba23a8f0c47"
  title := "羊排焖面"
  category := "meat"
  sourcePath := "dishes/meat_dish/羊排焖面/羊排焖面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "带皮羊排肉",
    "青椒",
    "甜椒",
    "青椒",
    "大葱",
    "花椒",
    "干辣椒",
    "生姜",
    "白砂糖",
    "老抽"
  ]
  steps := [
    { index := 1, instruction := "羊肉冷水下锅焯水，水开了之后把血沫撇掉，捞出羊肉。" },
    { index := 2, instruction := "切好生姜（ 4 片)，放入干辣椒与花椒在碗里备用。" },
    { index := 3, instruction := "在炒锅加入油。（多一点也没关系）" },
    { index := 4, instruction := "油热之后，放入白砂糖，给羊肉炒出焦糖色。" },
    { index := 5, instruction := "羊肉水份炒干之后，放入盐、老抽，以及备好的调味料。" },
    { index := 6, instruction := "加入清水没过羊肉，大火煮沸之后，让其继续煮 10 分钟，之后小火炖煮 30 分钟。" },
    { index := 7, instruction := "在此期间，可以和面。和面的量以及操作方法在附加内容里讲解 （注 1）。" },
    { index := 8, instruction := "放入青椒，甜椒，大葱，以及面皮进行翻炒。" },
    { index := 9, instruction := "翻炒均匀之后，即可出锅。" }
  ]
}

theorem recipe_dba23a8f0c47_ingredients_nonempty :
    recipe_dba23a8f0c47.ingredients.isEmpty = false := by decide

theorem recipe_dba23a8f0c47_steps_nonempty :
    recipe_dba23a8f0c47.steps.isEmpty = false := by decide

theorem recipe_dba23a8f0c47_step_count :
    recipe_dba23a8f0c47.steps.length = 9 := by decide

theorem recipe_dba23a8f0c47_steps_ordered :
    orderedFrom 1 recipe_dba23a8f0c47.steps = true := by decide

theorem recipe_dba23a8f0c47_executes_to_terminal :
    executesToTerminal recipe_dba23a8f0c47 = true := by decide

theorem recipe_dba23a8f0c47_kernel_certificate :
    kernelCertified recipe_dba23a8f0c47 = true := by decide

end LeanToCook.SourceCatalog
