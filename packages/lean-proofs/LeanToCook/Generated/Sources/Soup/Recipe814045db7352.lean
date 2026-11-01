/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 陈皮排骨汤 · dishes/soup/陈皮排骨汤/陈皮排骨汤.md -/
def recipe_814045db7352 : Recipe := {
  id := "814045db7352"
  title := "陈皮排骨汤"
  category := "soup"
  sourcePath := "dishes/soup/陈皮排骨汤/陈皮排骨汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨",
    "陈皮",
    "西洋参",
    "石斛",
    "玉竹",
    "麦冬",
    "煲汤盅",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "排骨用热水过一边，去血水" },
    { index := 2, instruction := "陈皮、麦冬、玉竹、石斛和西洋参，冲洗干净即可" },
    { index := 3, instruction := "煲汤盅洗干净" },
    { index := 4, instruction := "打开煲汤盅，先放入排骨在底部，然后依次放入陈皮、麦冬、玉竹、石斛和西洋参" },
    { index := 5, instruction := "加入热水进煲汤盅，水不宜太满" },
    { index := 6, instruction := "煲汤容器加入水，炖煮 1.5 小时即可" },
    { index := 7, instruction := "加入食盐，趁热饮用" }
  ]
}

theorem recipe_814045db7352_ingredients_nonempty :
    recipe_814045db7352.ingredients.isEmpty = false := by decide

theorem recipe_814045db7352_steps_nonempty :
    recipe_814045db7352.steps.isEmpty = false := by decide

theorem recipe_814045db7352_step_count :
    recipe_814045db7352.steps.length = 7 := by decide

theorem recipe_814045db7352_steps_ordered :
    orderedFrom 1 recipe_814045db7352.steps = true := by decide

theorem recipe_814045db7352_executes_to_terminal :
    executesToTerminal recipe_814045db7352 = true := by decide

theorem recipe_814045db7352_kernel_certificate :
    kernelCertified recipe_814045db7352 = true := by decide

end LeanToCook.SourceCatalog
