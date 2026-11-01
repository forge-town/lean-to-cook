/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小龙虾 · dishes/aquatic/小龙虾/小龙虾.md -/
def recipe_e2a148eb6cf1 : Recipe := {
  id := "e2a148eb6cf1"
  title := "小龙虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/小龙虾/小龙虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "小龙虾",
    "油",
    "香叶",
    "八角",
    "桂皮",
    "青花椒",
    "花椒",
    "子弹头辣椒",
    "葱姜蒜",
    "郫县豆瓣",
    "黄豆酱",
    "啤酒",
    "生抽",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "小龙虾刷干净去虾线，葱切 2cm 葱段，姜蒜切末。" },
    { index := 2, instruction := "烧油，油微热, 下香叶、八角、桂皮、青花椒、花椒、子弹头辣椒。" },
    { index := 3, instruction := "香料出香气之后下锅葱姜蒜" },
    { index := 4, instruction := "葱姜蒜爆香后，加入郫县豆瓣、黄豆酱，炒出红油。" },
    { index := 5, instruction := "下小龙虾，翻炒至变色。" },
    { index := 6, instruction := "加入啤酒，等啤酒烧开后加入生抽，盐。" },
    { index := 7, instruction := "将小龙虾完全煮熟后出锅。" }
  ]
}

theorem recipe_e2a148eb6cf1_ingredients_nonempty :
    recipe_e2a148eb6cf1.ingredients.isEmpty = false := by decide

theorem recipe_e2a148eb6cf1_steps_nonempty :
    recipe_e2a148eb6cf1.steps.isEmpty = false := by decide

theorem recipe_e2a148eb6cf1_step_count :
    recipe_e2a148eb6cf1.steps.length = 7 := by decide

theorem recipe_e2a148eb6cf1_steps_ordered :
    orderedFrom 1 recipe_e2a148eb6cf1.steps = true := by decide

theorem recipe_e2a148eb6cf1_executes_to_terminal :
    executesToTerminal recipe_e2a148eb6cf1 = true := by decide

theorem recipe_e2a148eb6cf1_kernel_certificate :
    kernelCertified recipe_e2a148eb6cf1 = true := by decide

end LeanToCook.SourceCatalog
