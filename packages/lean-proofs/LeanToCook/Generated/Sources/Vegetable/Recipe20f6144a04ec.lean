/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 菠菜炒鸡蛋 · dishes/vegetable_dish/菠菜炒鸡蛋/菠菜炒鸡蛋.md -/
def recipe_20f6144a04ec : Recipe := {
  id := "20f6144a04ec"
  title := "菠菜炒鸡蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/菠菜炒鸡蛋/菠菜炒鸡蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "菠菜",
    "鸡蛋",
    "食用油",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "菠菜去根，洗净，放在篮子里，焯水" },
    { index := 2, instruction := "将鸡蛋打入碗中，搅匀" },
    { index := 3, instruction := "热锅，加入 10ml 油" },
    { index := 4, instruction := "油热后，倒入鸡蛋液，中火翻炒 15 秒，先煎成蛋饼，然后再用锅铲切成小块" },
    { index := 5, instruction := "关火，将鸡蛋块 盛到盘子中，不要洗锅" },
    { index := 6, instruction := "重新开火，倒入 5ml 油，油热后，放入菠菜，大火 翻炒 15 秒后，倒入鸡蛋块，翻炒均匀" },
    { index := 7, instruction := "加入 5g 盐、100ml 饮用水，大火 翻炒 10 秒" },
    { index := 8, instruction := "关火，盛盘" }
  ]
}

theorem recipe_20f6144a04ec_ingredients_nonempty :
    recipe_20f6144a04ec.ingredients.isEmpty = false := by decide

theorem recipe_20f6144a04ec_steps_nonempty :
    recipe_20f6144a04ec.steps.isEmpty = false := by decide

theorem recipe_20f6144a04ec_step_count :
    recipe_20f6144a04ec.steps.length = 8 := by decide

theorem recipe_20f6144a04ec_steps_ordered :
    orderedFrom 1 recipe_20f6144a04ec.steps = true := by decide

theorem recipe_20f6144a04ec_executes_to_terminal :
    executesToTerminal recipe_20f6144a04ec = true := by decide

theorem recipe_20f6144a04ec_kernel_certificate :
    kernelCertified recipe_20f6144a04ec = true := by decide

end LeanToCook.SourceCatalog
