/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 包菜炒鸡蛋粉丝 · dishes/vegetable_dish/包菜炒鸡蛋粉丝/包菜炒鸡蛋粉丝.md -/
def recipe_1a65efb5c3b6 : Recipe := {
  id := "1a65efb5c3b6"
  title := "包菜炒鸡蛋粉丝"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/包菜炒鸡蛋粉丝/包菜炒鸡蛋粉丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "包菜",
    "鸡蛋",
    "粉丝",
    "胡萝卜",
    "菜籽油",
    "盐、生抽、老抽、蚝油",
    "葱、蒜、干辣椒"
  ]
  steps := [
    { index := 1, instruction := "胡萝卜、包菜切丝备用" },
    { index := 2, instruction := "粉丝先用冷水浸泡 1 小时，然后将粉丝放入锅中，加入开水烧至粉丝烫软捞出备用" },
    { index := 3, instruction := "鸡蛋打入碗中，加入盐后搅拌 15 秒" },
    { index := 4, instruction := "葱、蒜、辣椒切成小粒备用" },
    { index := 5, instruction := "起锅烧油，倒入鸡蛋，打散炒熟盛出" },
    { index := 6, instruction := "再倒入油，放入葱、蒜、干辣椒翻炒 8 秒" },
    { index := 7, instruction := "下胡萝卜、包菜丝儿翻炒 30 秒" },
    { index := 8, instruction := "放入粉丝" },
    { index := 9, instruction := "放调料，生抽 15 ml，老抽 10 ml，蚝油 10 ml，盐 2 克" },
    { index := 10, instruction := "放入之前炒好的鸡蛋，翻炒约 15 秒" },
    { index := 11, instruction := "出锅摆盘" }
  ]
}

theorem recipe_1a65efb5c3b6_ingredients_nonempty :
    recipe_1a65efb5c3b6.ingredients.isEmpty = false := by decide

theorem recipe_1a65efb5c3b6_steps_nonempty :
    recipe_1a65efb5c3b6.steps.isEmpty = false := by decide

theorem recipe_1a65efb5c3b6_step_count :
    recipe_1a65efb5c3b6.steps.length = 11 := by decide

theorem recipe_1a65efb5c3b6_steps_ordered :
    orderedFrom 1 recipe_1a65efb5c3b6.steps = true := by decide

theorem recipe_1a65efb5c3b6_executes_to_terminal :
    executesToTerminal recipe_1a65efb5c3b6 = true := by decide

theorem recipe_1a65efb5c3b6_kernel_certificate :
    kernelCertified recipe_1a65efb5c3b6 = true := by decide

end LeanToCook.SourceCatalog
