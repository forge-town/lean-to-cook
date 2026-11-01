/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒土豆和胡萝卜蒸菜 · dishes/vegetable_dish/炒土豆和胡萝卜蒸菜.md -/
def recipe_822fa695f8af : Recipe := {
  id := "822fa695f8af"
  title := "炒土豆和胡萝卜蒸菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/炒土豆和胡萝卜蒸菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "土豆",
    "胡萝卜",
    "香葱",
    "蒜瓣",
    "盐",
    "李大厨牌子的炒菜料",
    "李大厨牌子的肉香味",
    "味精",
    "干辣椒"
  ]
  steps := [
    { index := 1, instruction := "胡萝卜和土豆切成细丝（可以使用擦丝器）" },
    { index := 2, instruction := "给胡萝卜和土豆丝裹上面粉（胡萝卜颜色裹成像个小香肠一样，土豆裹的像是面条一样，根根分明,干手抓起来零散的毫不粘连的掉下）" },
    { index := 3, instruction := "把弄散了混合好的，土豆和胡萝卜丝，使用电蒸锅蒸5分钟/蒸锅在上气后大火蒸5分钟" },
    { index := 4, instruction := "注意不能直接锅盖 盖上开蒸，而是先不盖，开蒸后产生热蒸汽，再盖锅（防止粘连）" },
    { index := 5, instruction := "开大火后 15 秒先道友加葱翻炒，把葱炒香/炒 40 秒,加入混合的土豆和胡萝卜丝翻炒" },
    { index := 6, instruction := "20 秒后加入李大厨牌子的炒菜料，随后加入李大厨牌子的肉香味儿，然后加入食盐，然后加入味精，一会儿后出锅，关火" }
  ]
}

theorem recipe_822fa695f8af_ingredients_nonempty :
    recipe_822fa695f8af.ingredients.isEmpty = false := by decide

theorem recipe_822fa695f8af_steps_nonempty :
    recipe_822fa695f8af.steps.isEmpty = false := by decide

theorem recipe_822fa695f8af_step_count :
    recipe_822fa695f8af.steps.length = 6 := by decide

theorem recipe_822fa695f8af_steps_ordered :
    orderedFrom 1 recipe_822fa695f8af.steps = true := by decide

theorem recipe_822fa695f8af_executes_to_terminal :
    executesToTerminal recipe_822fa695f8af = true := by decide

theorem recipe_822fa695f8af_kernel_certificate :
    kernelCertified recipe_822fa695f8af = true := by decide

end LeanToCook.SourceCatalog
