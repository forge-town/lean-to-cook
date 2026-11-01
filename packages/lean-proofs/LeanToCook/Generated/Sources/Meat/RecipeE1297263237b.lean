/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香干肉丝 · dishes/meat_dish/香干肉丝.md -/
def recipe_e1297263237b : Recipe := {
  id := "e1297263237b"
  title := "香干肉丝"
  category := "meat"
  sourcePath := "dishes/meat_dish/香干肉丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪里脊（可以买超市切好且称重好的肉丝）",
    "香干",
    "盐",
    "生抽",
    "淀粉",
    "大蒜",
    "青椒",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "肉丝（没有肉丝，自己切）用生抽(3ml)，生粉混合均匀待用。" },
    { index := 2, instruction := "将青椒洗净，再用滚刀手法切好备用。" },
    { index := 3, instruction := "大蒜横切成片，香干切丝。" },
    { index := 4, instruction := "淀粉与水(10ml)混合，搅拌均匀。" },
    { index := 5, instruction := "干净锅 15ml 油，不用等油热就倒入肉丝慢慢划散，肉丝熟了，立马捞出，留油到锅里。" },
    { index := 6, instruction := "将蒜片和香干放入锅中，加入 2ml 生抽，翻炒均匀。" },
    { index := 7, instruction := "2-3 分钟，看火大小，将青椒丝放入锅中混合，翻炒。" },
    { index := 8, instruction := "1 分钟后，放入肉丝混合。" },
    { index := 9, instruction := "倒入淀粉与水的混合物勾芡，加入盐 3g，鸡精 2g，翻炒 2-3 分钟出锅。" },
    { index := 10, instruction := "成品。" }
  ]
}

theorem recipe_e1297263237b_ingredients_nonempty :
    recipe_e1297263237b.ingredients.isEmpty = false := by decide

theorem recipe_e1297263237b_steps_nonempty :
    recipe_e1297263237b.steps.isEmpty = false := by decide

theorem recipe_e1297263237b_step_count :
    recipe_e1297263237b.steps.length = 10 := by decide

theorem recipe_e1297263237b_steps_ordered :
    orderedFrom 1 recipe_e1297263237b.steps = true := by decide

theorem recipe_e1297263237b_executes_to_terminal :
    executesToTerminal recipe_e1297263237b = true := by decide

theorem recipe_e1297263237b_kernel_certificate :
    kernelCertified recipe_e1297263237b = true := by decide

end LeanToCook.SourceCatalog
