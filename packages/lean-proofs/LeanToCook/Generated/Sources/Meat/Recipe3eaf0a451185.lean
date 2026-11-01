/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小炒鸡肝 · dishes/meat_dish/小炒鸡肝/小炒鸡肝.md -/
def recipe_3eaf0a451185 : Recipe := {
  id := "3eaf0a451185"
  title := "小炒鸡肝"
  category := "meat"
  sourcePath := "dishes/meat_dish/小炒鸡肝/小炒鸡肝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "生鸡肝",
    "蒜苗（蒜苗指的是：大蒜幼苗发育到一定时期的青苗。有些地方叫做青蒜，特别说明一下。）",
    "大葱、姜、料酒",
    "食用盐、鸡精（味精）、五香粉（十三香）、胡椒粉",
    "烧烤料或孜然粉（可选）",
    "芝麻（可选）",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "鸡肝清洗，备用" },
    { index := 2, instruction := "蒜苗清洗，切段，备用" },
    { index := 3, instruction := "大葱清洗，取 100g 切段，取 50g 切片，备用" },
    { index := 4, instruction := "姜清晰，取 70g 切片， 取 50g 切丁，备用" },
    { index := 5, instruction := "第一步：焯水" },
    { index := 6, instruction := "第二步：炒制" }
  ]
}

theorem recipe_3eaf0a451185_ingredients_nonempty :
    recipe_3eaf0a451185.ingredients.isEmpty = false := by decide

theorem recipe_3eaf0a451185_steps_nonempty :
    recipe_3eaf0a451185.steps.isEmpty = false := by decide

theorem recipe_3eaf0a451185_step_count :
    recipe_3eaf0a451185.steps.length = 6 := by decide

theorem recipe_3eaf0a451185_steps_ordered :
    orderedFrom 1 recipe_3eaf0a451185.steps = true := by decide

theorem recipe_3eaf0a451185_executes_to_terminal :
    executesToTerminal recipe_3eaf0a451185 = true := by decide

theorem recipe_3eaf0a451185_kernel_certificate :
    kernelCertified recipe_3eaf0a451185 = true := by decide

end LeanToCook.SourceCatalog
