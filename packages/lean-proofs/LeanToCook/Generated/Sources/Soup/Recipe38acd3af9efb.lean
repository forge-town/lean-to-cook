/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 银耳莲子粥 · dishes/soup/银耳莲子粥/银耳莲子粥.md -/
def recipe_38acd3af9efb : Recipe := {
  id := "38acd3af9efb"
  title := "银耳莲子粥"
  category := "soup"
  sourcePath := "dishes/soup/银耳莲子粥/银耳莲子粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "银耳",
    "去心莲子",
    "红枣",
    "枸杞（可选）",
    "冰糖"
  ]
  steps := [
    { index := 1, instruction := "把银耳、莲子用清水浸泡 2 个小时，红枣浸泡 10 - 20 分钟，枸杞洗净，备用" },
    { index := 2, instruction := "在锅中倒入 600ml 水，烧开后依次放入银耳、莲子、红枣" },
    { index := 3, instruction := "等待水再次烧开后，盖上锅盖，转至中火继续熬" },
    { index := 4, instruction := "熬到大约 1 小时后，放入 5g - 10g 冰糖和 5g - 6g 枸杞，转至小火熬" },
    { index := 5, instruction := "小火继续熬 30 分钟，此时银耳开始呈现粘稠状态" },
    { index := 6, instruction := "再次放入 5g - 10g 冰糖，用勺子搅拌 5 - 10 分钟" },
    { index := 7, instruction := "关火，用勺子盛出" }
  ]
}

theorem recipe_38acd3af9efb_ingredients_nonempty :
    recipe_38acd3af9efb.ingredients.isEmpty = false := by decide

theorem recipe_38acd3af9efb_steps_nonempty :
    recipe_38acd3af9efb.steps.isEmpty = false := by decide

theorem recipe_38acd3af9efb_step_count :
    recipe_38acd3af9efb.steps.length = 7 := by decide

theorem recipe_38acd3af9efb_steps_ordered :
    orderedFrom 1 recipe_38acd3af9efb.steps = true := by decide

theorem recipe_38acd3af9efb_executes_to_terminal :
    executesToTerminal recipe_38acd3af9efb = true := by decide

theorem recipe_38acd3af9efb_kernel_certificate :
    kernelCertified recipe_38acd3af9efb = true := by decide

end LeanToCook.SourceCatalog
