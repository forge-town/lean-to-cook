/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 皮蛋豆腐 · dishes/vegetable_dish/皮蛋豆腐.md -/
def recipe_26f2457ef559 : Recipe := {
  id := "26f2457ef559"
  title := "皮蛋豆腐"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/皮蛋豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "皮蛋",
    "内酯豆腐",
    "生抽",
    "白砂糖",
    "醋（推荐镇江香醋）",
    "香油（可选）",
    "辣椒油（可选）",
    "花生碎（可选）",
    "葱花（可选）",
    "香菜（可选）"
  ]
  steps := [
    { index := 1, instruction := "先把皮蛋剥壳，切成四瓣。" },
    { index := 2, instruction := "嫩豆腐切块或者切片放中间。" },
    { index := 3, instruction := "将生抽、白砂糖、醋、香油、辣椒油调成酱汁，淋上去。" },
    { index := 4, instruction := "最后可选撒上花生碎、葱花、香菜。" }
  ]
}

theorem recipe_26f2457ef559_ingredients_nonempty :
    recipe_26f2457ef559.ingredients.isEmpty = false := by decide

theorem recipe_26f2457ef559_steps_nonempty :
    recipe_26f2457ef559.steps.isEmpty = false := by decide

theorem recipe_26f2457ef559_step_count :
    recipe_26f2457ef559.steps.length = 4 := by decide

theorem recipe_26f2457ef559_steps_ordered :
    orderedFrom 1 recipe_26f2457ef559.steps = true := by decide

theorem recipe_26f2457ef559_executes_to_terminal :
    executesToTerminal recipe_26f2457ef559 = true := by decide

theorem recipe_26f2457ef559_kernel_certificate :
    kernelCertified recipe_26f2457ef559 = true := by decide

end LeanToCook.SourceCatalog
