/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 冰粉 · dishes/drink/冰粉/冰粉.md -/
def recipe_460b515020de : Recipe := {
  id := "460b515020de"
  title := "冰粉"
  category := "drink"
  sourcePath := "dishes/drink/冰粉/冰粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冰粉籽 200g",
    "过滤豆浆渣的纱布一块",
    "凉白开 2000g",
    "薄荷汁 10ml / 薄荷粉 10g",
    "一次性透明塑料杯（可选）",
    "遇水发光冰块（可选）"
  ]
  steps := [
    { index := 1, instruction := "将凉白开倒入盆中；" },
    { index := 2, instruction := "将冰粉籽全部用纱布包起来，开口处打结" },
    { index := 3, instruction := "将包好的冰粉籽放入凉白开中，在凉白开中用力揉搓 6 分钟" },
    { index := 4, instruction := "然后将凉白开放置 2.5 小时，即可成型" },
    { index := 5, instruction := "随后将石凉粉用勺子装进准备好的一次性透明塑料杯中，加入 10ml 薄荷汁或者 10g 薄荷粉（柠檬汁、山楂汁、桑椹汁也可），再放入遇水发光冰块，用勺子慢慢搅拌均匀" }
  ]
}

theorem recipe_460b515020de_ingredients_nonempty :
    recipe_460b515020de.ingredients.isEmpty = false := by decide

theorem recipe_460b515020de_steps_nonempty :
    recipe_460b515020de.steps.isEmpty = false := by decide

theorem recipe_460b515020de_step_count :
    recipe_460b515020de.steps.length = 5 := by decide

theorem recipe_460b515020de_steps_ordered :
    orderedFrom 1 recipe_460b515020de.steps = true := by decide

theorem recipe_460b515020de_executes_to_terminal :
    executesToTerminal recipe_460b515020de = true := by decide

theorem recipe_460b515020de_kernel_certificate :
    kernelCertified recipe_460b515020de = true := by decide

end LeanToCook.SourceCatalog
