/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 紫菜蛋花汤 · dishes/soup/紫菜蛋花汤.md -/
def recipe_b435c11c8067 : Recipe := {
  id := "b435c11c8067"
  title := "紫菜蛋花汤"
  category := "soup"
  sourcePath := "dishes/soup/紫菜蛋花汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "紫菜",
    "葱花",
    "水",
    "盐",
    "油",
    "虾仁（个人口味，可加可不加）"
  ]
  steps := [
    { index := 1, instruction := "干紫菜用清水泡 15 分钟，捞起沥干水份备用。" },
    { index := 2, instruction := "热锅，倒入 1.5 升清水、5ml 油、2g 盐。待水开后放入紫菜。" },
    { index := 3, instruction := "紫菜烧开后 3 分钟，将打好的蛋液徐徐倒入锅内，30 秒既可起锅。" },
    { index := 4, instruction := "撒上葱花，转小火 20 秒。" },
    { index := 5, instruction := "关火，出锅前放入几滴香油，也有的会放入一点虾皮，味道也不错。" }
  ]
}

theorem recipe_b435c11c8067_ingredients_nonempty :
    recipe_b435c11c8067.ingredients.isEmpty = false := by decide

theorem recipe_b435c11c8067_steps_nonempty :
    recipe_b435c11c8067.steps.isEmpty = false := by decide

theorem recipe_b435c11c8067_step_count :
    recipe_b435c11c8067.steps.length = 5 := by decide

theorem recipe_b435c11c8067_steps_ordered :
    orderedFrom 1 recipe_b435c11c8067.steps = true := by decide

theorem recipe_b435c11c8067_executes_to_terminal :
    executesToTerminal recipe_b435c11c8067 = true := by decide

theorem recipe_b435c11c8067_kernel_certificate :
    kernelCertified recipe_b435c11c8067 = true := by decide

end LeanToCook.SourceCatalog
