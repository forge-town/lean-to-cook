/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奥尔良风味烤鸡腿 · dishes/meat_dish/奥尔良风味烤鸡腿/奥尔良风味烤鸡腿.md -/
def recipe_1f6cfac235de : Recipe := {
  id := "1f6cfac235de"
  title := "奥尔良风味烤鸡腿"
  category := "meat"
  sourcePath := "dishes/meat_dish/奥尔良风味烤鸡腿/奥尔良风味烤鸡腿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "烤箱",
    "烤盘",
    "铝箔纸",
    "手枪腿鸡腿",
    "新奥尔良烤翅调料（推荐品牌 McCormick 味好美）",
    "豉油调味汁（推荐品牌 日和，\"薄盐肠粉豉油调味汁\"）"
  ]
  steps := [
    { index := 1, instruction := "解冻手枪腿鸡腿并洗净。" },
    { index := 2, instruction := "手枪腿鸡腿改花刀：在每只手枪腿鸡腿的\"枪管\"处，平行于\"枪管\"用小刀切 4-6 刀，下刀尽可能深。" },
    { index := 3, instruction := "拿一个锅，加入 15 - 20 g 新奥尔良烤翅调料粉、5 g 盐，≥30 mL 水。" },
    { index := 4, instruction := "将改完花刀的手枪腿鸡腿放入锅内，搅匀。" },
    { index := 5, instruction := "将整个锅放入冰箱冷藏层冷藏 2 - 4 小时，时间越长越入味。" },
    { index := 6, instruction := "在烤盘上放一张铝箔纸，将鸡腿取出，皮面向下放上去（不要弄破铝箔纸）。丢弃锅内剩余的液体。" },
    { index := 7, instruction := "放入烤箱中上层，按照如下参数烘烤：" },
    { index := 8, instruction := "取出，将烤盘中的油脂倒到大碗里备用。（不要弄破铝箔纸）" },
    { index := 9, instruction := "对所有手枪腿鸡腿翻面。" },
    { index := 10, instruction := "放入烤箱上层，按照如下参数烘烤：" },
    { index := 11, instruction := "取出，将烤盘中的油脂倒到大碗里备用。（不要弄破铝箔纸）" },
    { index := 12, instruction := "放入烤箱上层，按照如下参数烘烤：" },
    { index := 13, instruction := "取出，将烤盘中的油脂倒到大碗里备用。（不要弄破铝箔纸）" },
    { index := 14, instruction := "取一个小碗，按照 10:1 - 2:1 体积比，加入大碗中的油脂和豉油调味汁。调味汁越多越咸，具体加入量取决于个人口味。" },
    { index := 15, instruction := "抓住手枪腿鸡腿根部，蘸取小碗中的液体，可使用餐巾纸或手套隔油。现在可以直接从烤盘铝箔纸上享用奥尔良风味烤鸡腿了。" }
  ]
}

theorem recipe_1f6cfac235de_ingredients_nonempty :
    recipe_1f6cfac235de.ingredients.isEmpty = false := by decide

theorem recipe_1f6cfac235de_steps_nonempty :
    recipe_1f6cfac235de.steps.isEmpty = false := by decide

theorem recipe_1f6cfac235de_step_count :
    recipe_1f6cfac235de.steps.length = 15 := by decide

theorem recipe_1f6cfac235de_steps_ordered :
    orderedFrom 1 recipe_1f6cfac235de.steps = true := by decide

theorem recipe_1f6cfac235de_executes_to_terminal :
    executesToTerminal recipe_1f6cfac235de = true := by decide

theorem recipe_1f6cfac235de_kernel_certificate :
    kernelCertified recipe_1f6cfac235de = true := by decide

end LeanToCook.SourceCatalog
