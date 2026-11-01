/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 糖拌西红柿 · dishes/vegetable_dish/糖拌西红柿/糖拌西红柿.md -/
def recipe_d051be3bc11e : Recipe := {
  id := "d051be3bc11e"
  title := "糖拌西红柿"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/糖拌西红柿/糖拌西红柿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西红柿",
    "白砂糖",
    "冰箱"
  ]
  steps := [
    { index := 1, instruction := "用刀将西红柿皮米字型划开" },
    { index := 2, instruction := "用筷子插入西红柿的菊花，在燃气上转动烤 10 秒（或用开水冲 30 秒），直到西红柿皮卷边" },
    { index := 3, instruction := "把西红柿的衣服脱光" },
    { index := 4, instruction := "再西红柿大卸八块（沿纹路切可以更多的留汁水），去掉头部根蒂部，备用" },
    { index := 5, instruction := "全部切好后，将西红柿在盘子中均匀码一层" },
    { index := 6, instruction := "撒上白糖，重复上面一步直到全部西红柿放完" },
    { index := 7, instruction := "放入冰箱冷藏 10 分钟" },
    { index := 8, instruction := "一盘糖拌西红柿就好了，营养美味，酸甜爽口，夏日解暑又解腻" }
  ]
}

theorem recipe_d051be3bc11e_ingredients_nonempty :
    recipe_d051be3bc11e.ingredients.isEmpty = false := by decide

theorem recipe_d051be3bc11e_steps_nonempty :
    recipe_d051be3bc11e.steps.isEmpty = false := by decide

theorem recipe_d051be3bc11e_step_count :
    recipe_d051be3bc11e.steps.length = 8 := by decide

theorem recipe_d051be3bc11e_steps_ordered :
    orderedFrom 1 recipe_d051be3bc11e.steps = true := by decide

theorem recipe_d051be3bc11e_executes_to_terminal :
    executesToTerminal recipe_d051be3bc11e = true := by decide

theorem recipe_d051be3bc11e_kernel_certificate :
    kernelCertified recipe_d051be3bc11e = true := by decide

end LeanToCook.SourceCatalog
