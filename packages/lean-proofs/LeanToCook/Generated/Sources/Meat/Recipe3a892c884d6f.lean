/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 可乐鸡翅 · dishes/meat_dish/可乐鸡翅.md -/
def recipe_3a892c884d6f : Recipe := {
  id := "3a892c884d6f"
  title := "可乐鸡翅"
  category := "meat"
  sourcePath := "dishes/meat_dish/可乐鸡翅.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡翅中",
    "可乐",
    "白糖",
    "生抽",
    "盐",
    "生姜",
    "料酒或啤酒",
    "小葱"
  ]
  steps := [
    { index := 1, instruction := "鸡翅入锅，倒入冷水淹没。放生姜 1 片和料酒 10 ～ 20 毫升。大火煮开（ 大约 2 分钟 ）后，撇去浮沫，沥出水分" },
    { index := 2, instruction := "捞出鸡翅，可用刀将两边各划上两口改刀。生抽约 10 克腌制鸡翅 10 分钟（生抽能完全包裹鸡翅表面入味就行）" },
    { index := 3, instruction := "锅重新小火起油，先将剩余姜片爆香，然后下入腌好的鸡翅。将鸡翅煎至金黄翻面（直到两面金黄），用炒菜勺子翻动一下鸡翅，与姜片一起翻炒 4～5 下（目的是防止鸡翅和姜片粘黏）。" },
    { index := 4, instruction := "鸡翅金黄，倒入可乐没过鸡翅，开大火将锅中可乐煮沸，然后撇去漂浮的黑色浮沫（包含血水）。此时加入葱结。" },
    { index := 5, instruction := "调味：加入食用盐 2 克，白糖 10 克，生抽 3 克调味（可以适当用老抽调底色，3 克）。" },
    { index := 6, instruction := "等到葱结变黄，和姜片一起捞出，转中火继续慢煮可乐鸡翅。" },
    { index := 7, instruction := "等到可乐呈现挂丝状态，关小火让汁牢牢挂在鸡翅上。出锅，装盘。" }
  ]
}

theorem recipe_3a892c884d6f_ingredients_nonempty :
    recipe_3a892c884d6f.ingredients.isEmpty = false := by decide

theorem recipe_3a892c884d6f_steps_nonempty :
    recipe_3a892c884d6f.steps.isEmpty = false := by decide

theorem recipe_3a892c884d6f_step_count :
    recipe_3a892c884d6f.steps.length = 7 := by decide

theorem recipe_3a892c884d6f_steps_ordered :
    orderedFrom 1 recipe_3a892c884d6f.steps = true := by decide

theorem recipe_3a892c884d6f_executes_to_terminal :
    executesToTerminal recipe_3a892c884d6f = true := by decide

theorem recipe_3a892c884d6f_kernel_certificate :
    kernelCertified recipe_3a892c884d6f = true := by decide

end LeanToCook.SourceCatalog
