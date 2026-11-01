/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 空气炸锅鸡翅中 · dishes/semi-finished/空气炸锅鸡翅中/空气炸锅鸡翅中.md -/
def recipe_01b1d98676a5 : Recipe := {
  id := "01b1d98676a5"
  title := "空气炸锅鸡翅中"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/空气炸锅鸡翅中/空气炸锅鸡翅中.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "必备：鸡翅中（推荐买泰森的奥尔良鸡翅中，JD 打折的话 30 多一袋 454g 大概 12 个。上鲜和圣农的也买过，没这个方便。泰森的是腌好的，如果有时间的话可以买没腌的自己腌。）",
    "可选：罗勒碎（撒上去纯粹为了好看）",
    "可选：云南单山蘸水（代替烧烤料）"
  ]
  steps := [
    { index := 1, instruction := "鸡翅从冰箱拿出来，鸡翼面朝下放入锡纸烤盘，撒上罗勒碎，盖上保鲜膜自然解冻 20 分钟" },
    { index := 2, instruction := "撒上罗勒碎，空气炸锅 200°C，10 分钟" },
    { index := 3, instruction := "翻面，撒上罗勒碎，空气炸锅 200°C，7 分钟" }
  ]
}

theorem recipe_01b1d98676a5_ingredients_nonempty :
    recipe_01b1d98676a5.ingredients.isEmpty = false := by decide

theorem recipe_01b1d98676a5_steps_nonempty :
    recipe_01b1d98676a5.steps.isEmpty = false := by decide

theorem recipe_01b1d98676a5_step_count :
    recipe_01b1d98676a5.steps.length = 3 := by decide

theorem recipe_01b1d98676a5_steps_ordered :
    orderedFrom 1 recipe_01b1d98676a5.steps = true := by decide

theorem recipe_01b1d98676a5_executes_to_terminal :
    executesToTerminal recipe_01b1d98676a5 = true := by decide

theorem recipe_01b1d98676a5_kernel_certificate :
    kernelCertified recipe_01b1d98676a5 = true := by decide

end LeanToCook.SourceCatalog
