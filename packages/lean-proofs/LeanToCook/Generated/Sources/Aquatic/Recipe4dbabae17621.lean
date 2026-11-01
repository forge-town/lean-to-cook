/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 油焖大虾 · dishes/aquatic/油焖大虾/油焖大虾.md -/
def recipe_4dbabae17621 : Recipe := {
  id := "4dbabae17621"
  title := "油焖大虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/油焖大虾/油焖大虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黑虎虾 or 明虾、",
    "葱、姜",
    "料酒、盐、冰糖、植物油"
  ]
  steps := [
    { index := 1, instruction := "剪虾枪到根上，虾须虾爪都剪掉，沙包挑掉，开背虾线挑出来，洗净备用" },
    { index := 2, instruction := "炸料油" },
    { index := 3, instruction := "下油，虾摆放整齐，两面变色后轻轻摁虾头" },
    { index := 4, instruction := "大火烧开转小火盖盖子闷（中途不能再加汤水，不要开盖）" },
    { index := 5, instruction := "皮亮虾弯就可以起锅，虾摆盘" },
    { index := 6, instruction := "收汁（过滤后倒回锅里收浓，放葱油 ） 汤汁剩余 1/4 时。" },
    { index := 7, instruction := "浇汁" },
    { index := 8, instruction := "完成" },
    { index := 9, instruction := "开吃✅" }
  ]
}

theorem recipe_4dbabae17621_ingredients_nonempty :
    recipe_4dbabae17621.ingredients.isEmpty = false := by decide

theorem recipe_4dbabae17621_steps_nonempty :
    recipe_4dbabae17621.steps.isEmpty = false := by decide

theorem recipe_4dbabae17621_step_count :
    recipe_4dbabae17621.steps.length = 9 := by decide

theorem recipe_4dbabae17621_steps_ordered :
    orderedFrom 1 recipe_4dbabae17621.steps = true := by decide

theorem recipe_4dbabae17621_executes_to_terminal :
    executesToTerminal recipe_4dbabae17621 = true := by decide

theorem recipe_4dbabae17621_kernel_certificate :
    kernelCertified recipe_4dbabae17621 = true := by decide

end LeanToCook.SourceCatalog
