/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鲣鱼海苔玉米饭 · dishes/staple/鲣鱼海苔玉米饭/鲣鱼海苔玉米饭.md -/
def recipe_c3250cf8bae4 : Recipe := {
  id := "c3250cf8bae4"
  title := "鲣鱼海苔玉米饭"
  category := "staple"
  sourcePath := "dishes/staple/鲣鱼海苔玉米饭/鲣鱼海苔玉米饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "必备：东北米（金龙鱼 30 元 5kg 的就行，推荐使用米家 IH 电饭煲煮，教程用的是米家小饭煲，不推荐使用高压锅煮饭）",
    "必备：鲣鱼海苔碎（JD 和淘宝都有，可以搜索：日式拌饭料）",
    "必备：玉米粒（淘宝搜索：玉米粒 即食）"
  ]
  steps := [
    { index := 1, instruction := "盛好米饭，放入玉米粒拌好" },
    { index := 2, instruction := "放入鲣鱼海苔碎" }
  ]
}

theorem recipe_c3250cf8bae4_ingredients_nonempty :
    recipe_c3250cf8bae4.ingredients.isEmpty = false := by decide

theorem recipe_c3250cf8bae4_steps_nonempty :
    recipe_c3250cf8bae4.steps.isEmpty = false := by decide

theorem recipe_c3250cf8bae4_step_count :
    recipe_c3250cf8bae4.steps.length = 2 := by decide

theorem recipe_c3250cf8bae4_steps_ordered :
    orderedFrom 1 recipe_c3250cf8bae4.steps = true := by decide

theorem recipe_c3250cf8bae4_executes_to_terminal :
    executesToTerminal recipe_c3250cf8bae4 = true := by decide

theorem recipe_c3250cf8bae4_kernel_certificate :
    kernelCertified recipe_c3250cf8bae4 = true := by decide

end LeanToCook.SourceCatalog
