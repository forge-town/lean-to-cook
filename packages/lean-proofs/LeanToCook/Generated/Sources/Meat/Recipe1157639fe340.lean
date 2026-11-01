/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 荔枝肉 · dishes/meat_dish/荔枝肉/荔枝肉.md -/
def recipe_1157639fe340 : Recipe := {
  id := "1157639fe340"
  title := "荔枝肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/荔枝肉/荔枝肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "瘦肉",
    "凤梨",
    "鸡蛋",
    "食用油",
    "白砂糖",
    "淀粉",
    "生抽",
    "鸡精",
    "姜末",
    "芝麻",
    "番茄酱",
    "香醋"
  ]
  steps := [
    { index := 1, instruction := "瘦肉切块（每块 2-3 cm ），放入大碗中，加入鸡蛋 1 个 、生粉 50 g 、生抽 3 ml 、鸡精 2 g" },
    { index := 2, instruction := "充分搅拌，直至生粉包裹住瘦肉块（太稀则继续加生粉，太干则加水），然后加入 5 ml 油，在充分搅拌后备用" },
    { index := 3, instruction := "在准备一个碗，加入番茄酱、鸡精 3 g 、生抽 2 ml 、姜末、白砂糖、生粉 10 g \\香醋、凉水 200 ml ,充分搅拌后备用" },
    { index := 4, instruction := "切一个凤梨, 准备 6 个 （每个 1.5-2 cm）凤梨块" },
    { index := 5, instruction := "起锅烧油，倒入 500 ml 油，一直烧油直到听到油炸声" },
    { index := 6, instruction := "将瘦肉一个一个放入锅中（切记不可以整碗倒入），保证每个肉不要粘在一起" },
    { index := 7, instruction := "全部放入瘦肉后，每 30 S 用勺子来回两面翻转瘦肉块，直至瘦肉块表面金黄" },
    { index := 8, instruction := "取出瘦肉，一分钟后倒入油锅中继续炸，直至瘦肉块表面出现焦黄后，取出放入大碗备用" },
    { index := 9, instruction := "起锅，倒入汤汁，30 S 后倒入瘦肉块、凤梨块，充分翻炒后 出锅" },
    { index := 10, instruction := "摆上芝麻" }
  ]
}

theorem recipe_1157639fe340_ingredients_nonempty :
    recipe_1157639fe340.ingredients.isEmpty = false := by decide

theorem recipe_1157639fe340_steps_nonempty :
    recipe_1157639fe340.steps.isEmpty = false := by decide

theorem recipe_1157639fe340_step_count :
    recipe_1157639fe340.steps.length = 10 := by decide

theorem recipe_1157639fe340_steps_ordered :
    orderedFrom 1 recipe_1157639fe340.steps = true := by decide

theorem recipe_1157639fe340_executes_to_terminal :
    executesToTerminal recipe_1157639fe340 = true := by decide

theorem recipe_1157639fe340_kernel_certificate :
    kernelCertified recipe_1157639fe340 = true := by decide

end LeanToCook.SourceCatalog
