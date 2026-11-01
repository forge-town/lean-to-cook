/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鱼香茄子 · dishes/meat_dish/鱼香茄子/鱼香茄子.md -/
def recipe_bfaaef2163dd : Recipe := {
  id := "bfaaef2163dd"
  title := "鱼香茄子"
  category := "meat"
  sourcePath := "dishes/meat_dish/鱼香茄子/鱼香茄子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "肉末",
    "盐",
    "糖",
    "味精",
    "生抽",
    "老抽",
    "醋",
    "水淀粉",
    "豆瓣酱"
  ]
  steps := [
    { index := 1, instruction := "将茄子切成条。" },
    { index := 2, instruction := "将肉切成肉沫，葱姜蒜切碎、小米椒切丁。" },
    { index := 3, instruction := "调鱼香汁：碗中放入盐、味精、糖、生抽、老抽、醋、水淀粉搅拌均匀。" },
    { index := 4, instruction := "锅中倒入 300ml 油，开小火（小火容易掌控），等油温七成热（小火大约 40 秒，有烟冒出）放入茄子炸两分钟，当茄子边缘微黄就捞出。多出的油可以盛出以后炒菜用。" },
    { index := 5, instruction := "锅中留 15-30ml 油，倒入肉沫炒至颜色变白就盛出来。" },
    { index := 6, instruction := "锅中倒入 15-30ml 油，放入豆瓣酱、葱白、姜、蒜炒香，然后倒入肉沫翻炒均匀。" },
    { index := 7, instruction := "加入 80-150ml 清水（水面预计茄子八成高度为准），倒入茄子、倒入料汁，爆炒入味收汁。最后放入葱翻炒均匀，就可以起锅了。" }
  ]
}

theorem recipe_bfaaef2163dd_ingredients_nonempty :
    recipe_bfaaef2163dd.ingredients.isEmpty = false := by decide

theorem recipe_bfaaef2163dd_steps_nonempty :
    recipe_bfaaef2163dd.steps.isEmpty = false := by decide

theorem recipe_bfaaef2163dd_step_count :
    recipe_bfaaef2163dd.steps.length = 7 := by decide

theorem recipe_bfaaef2163dd_steps_ordered :
    orderedFrom 1 recipe_bfaaef2163dd.steps = true := by decide

theorem recipe_bfaaef2163dd_executes_to_terminal :
    executesToTerminal recipe_bfaaef2163dd = true := by decide

theorem recipe_bfaaef2163dd_kernel_certificate :
    kernelCertified recipe_bfaaef2163dd = true := by decide

end LeanToCook.SourceCatalog
