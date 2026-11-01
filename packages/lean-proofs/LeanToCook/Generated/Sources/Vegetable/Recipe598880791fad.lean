/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 雷椒皮蛋 · dishes/vegetable_dish/雷椒皮蛋.md -/
def recipe_598880791fad : Recipe := {
  id := "598880791fad"
  title := "雷椒皮蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/雷椒皮蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "皮蛋",
    "长条青椒（有些叫线椒，后面介绍以“青椒”代替）",
    "葱",
    "蒜",
    "小米辣(可选）",
    "食用油",
    "生抽",
    "陈醋",
    "白糖",
    "香油",
    "深一点的小铁盆"
  ]
  steps := [
    { index := 1, instruction := "青椒清洗，去除根部，侧面切开，去除内部的子后在案板压平，备用（一定要去除青椒子，否则会在锅里炸开）" },
    { index := 2, instruction := "葱切成半厘米小段，备用" },
    { index := 3, instruction := "蒜去皮，切成碎末，备用" },
    { index := 4, instruction := "皮蛋去皮，备用" },
    { index := 5, instruction := "小米辣，切成 5-10mm 的小段，备用" },
    { index := 6, instruction := "热锅，锅内放入 10ml - 20ml 食用油" },
    { index := 7, instruction := "放入全部青椒，改小火保持锅子温度，煎至青椒变软（可以用筷子试一下，插入即透即可）" },
    { index := 8, instruction := "关火，将皮蛋和青椒放入小铁盆中" },
    { index := 9, instruction := "方法 1： 有擀面杖且砸东西不会吵到邻居：用擀面杖的一头在小盆中砸击皮蛋和青椒，至皮蛋与青椒混合（选项）" },
    { index := 10, instruction := "方法 2：将青椒用手撕开，撕成大约半厘米的条状，用叉子将皮蛋压碎（选项）" },
    { index := 11, instruction := "小米辣" },
    { index := 12, instruction := "倒入生抽，陈醋，白糖，香油，以及其他未使用的备用食材" },
    { index := 13, instruction := "均匀搅拌" }
  ]
}

theorem recipe_598880791fad_ingredients_nonempty :
    recipe_598880791fad.ingredients.isEmpty = false := by decide

theorem recipe_598880791fad_steps_nonempty :
    recipe_598880791fad.steps.isEmpty = false := by decide

theorem recipe_598880791fad_step_count :
    recipe_598880791fad.steps.length = 13 := by decide

theorem recipe_598880791fad_steps_ordered :
    orderedFrom 1 recipe_598880791fad.steps = true := by decide

theorem recipe_598880791fad_executes_to_terminal :
    executesToTerminal recipe_598880791fad = true := by decide

theorem recipe_598880791fad_kernel_certificate :
    kernelCertified recipe_598880791fad = true := by decide

end LeanToCook.SourceCatalog
