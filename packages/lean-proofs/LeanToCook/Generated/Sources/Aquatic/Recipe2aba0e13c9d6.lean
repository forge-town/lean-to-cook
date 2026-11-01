/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黄油煎虾 · dishes/aquatic/黄油煎虾/黄油煎虾.md -/
def recipe_2aba0e13c9d6 : Recipe := {
  id := "2aba0e13c9d6"
  title := "黄油煎虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/黄油煎虾/黄油煎虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鲜虾（强推肉质紧实的九节虾，普通明虾也可以）",
    "黄油（推荐安佳，一次用一小盒 7g）",
    "黑胡椒粒（瓶磨的那种）",
    "生抽",
    "盐",
    "白糖",
    "米酒"
  ]
  steps := [
    { index := 1, instruction := "鲜虾摘除头部，顺带扯出虾线（这步处理不好可在下一步开背时取出虾线），使用剪刀剪开或菜刀片开虾背，沥干水分备用" },
    { index := 2, instruction := "调制酱汁：小碗放入上述量的全部生抽、米酒、白糖、盐搅匀备用" },
    { index := 3, instruction := "中大火热锅，热锅内放入食用油，等待 10 秒让油温升高" },
    { index := 4, instruction := "虾全部放入锅中，开始瓶磨黑胡椒，均匀地撒在虾上翻炒" },
    { index := 5, instruction := "虾变色后加入黄油，黄油完全融化后倒入调制酱汁，继续翻炒" },
    { index := 6, instruction := "大火翻炒 15 秒收汁即可装盘" }
  ]
}

theorem recipe_2aba0e13c9d6_ingredients_nonempty :
    recipe_2aba0e13c9d6.ingredients.isEmpty = false := by decide

theorem recipe_2aba0e13c9d6_steps_nonempty :
    recipe_2aba0e13c9d6.steps.isEmpty = false := by decide

theorem recipe_2aba0e13c9d6_step_count :
    recipe_2aba0e13c9d6.steps.length = 6 := by decide

theorem recipe_2aba0e13c9d6_steps_ordered :
    orderedFrom 1 recipe_2aba0e13c9d6.steps = true := by decide

theorem recipe_2aba0e13c9d6_executes_to_terminal :
    executesToTerminal recipe_2aba0e13c9d6 = true := by decide

theorem recipe_2aba0e13c9d6_kernel_certificate :
    kernelCertified recipe_2aba0e13c9d6 = true := by decide

end LeanToCook.SourceCatalog
