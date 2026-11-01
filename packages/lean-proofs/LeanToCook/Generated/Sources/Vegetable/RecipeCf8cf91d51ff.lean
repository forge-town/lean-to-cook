/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 手撕包菜 · dishes/vegetable_dish/手撕包菜/手撕包菜.md -/
def recipe_cf8cf91d51ff : Recipe := {
  id := "cf8cf91d51ff"
  title := "手撕包菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/手撕包菜/手撕包菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "包菜",
    "五花肉",
    "小米辣",
    "食用油",
    "料酒",
    "生抽",
    "香醋",
    "鸡精",
    "姜",
    "蒜头",
    "蒜苗",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "包菜对半切开，去掉中间白色部分【参见图一】" },
    { index := 2, instruction := "手撕包菜，碗中放入 2 g 盐，清洗包菜并沥干备用【参见图二】" },
    { index := 3, instruction := "姜片、蒜头、小米辣、蒜苗处理后备用【参见图三】" },
    { index := 4, instruction := "五花肉切片，清水清洗后备用" },
    { index := 5, instruction := "锅中加入 30 ml 食用油，倒入包菜翻炒，大火翻炒 1 分钟 后，加入 3 g 盐 ，继续翻炒 2 分钟 后取出备用" },
    { index := 6, instruction := "锅中加入 30 ml 食用油，倒入五花肉，大火翻炒 1 分钟" },
    { index := 7, instruction := "倒入姜片等材料，翻炒 1 分钟" },
    { index := 8, instruction := "倒入包菜翻炒后，加入 香醋、料酒、鸡精、料酒，大火继续翻炒，2 分钟 后出锅" }
  ]
}

theorem recipe_cf8cf91d51ff_ingredients_nonempty :
    recipe_cf8cf91d51ff.ingredients.isEmpty = false := by decide

theorem recipe_cf8cf91d51ff_steps_nonempty :
    recipe_cf8cf91d51ff.steps.isEmpty = false := by decide

theorem recipe_cf8cf91d51ff_step_count :
    recipe_cf8cf91d51ff.steps.length = 8 := by decide

theorem recipe_cf8cf91d51ff_steps_ordered :
    orderedFrom 1 recipe_cf8cf91d51ff.steps = true := by decide

theorem recipe_cf8cf91d51ff_executes_to_terminal :
    executesToTerminal recipe_cf8cf91d51ff = true := by decide

theorem recipe_cf8cf91d51ff_kernel_certificate :
    kernelCertified recipe_cf8cf91d51ff = true := by decide

end LeanToCook.SourceCatalog
