/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金钱蛋 · dishes/vegetable_dish/金钱蛋.md -/
def recipe_29dc63b5178d : Recipe := {
  id := "29dc63b5178d"
  title := "金钱蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/金钱蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "线椒",
    "小米辣",
    "豆瓣酱",
    "蒜",
    "小葱",
    "玉米淀粉（可选）",
    "食用油",
    "生抽",
    "蚝油",
    "糖"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋冷水下锅，大火煮开转小火煮 8 分钟" },
    { index := 2, instruction := "用自来水冲凉，方便剥皮" },
    { index := 3, instruction := "蒜切沫（粒径不大于 1 mm），线椒和小米辣切小粒（约 2-3 mm）" },
    { index := 4, instruction := "每个熟鸡蛋沿短轴切成体积类似的 4 份" },
    { index := 5, instruction := "如果打算沾淀粉，每片鸡蛋粘上淀粉，抖掉多余的淀粉" },
    { index := 6, instruction := "锅内放入 25 ml 油（如果不沾淀粉，放 20 ml），放入熟鸡蛋片" },
    { index := 7, instruction := "煎至微焦黄后，补 10 ml 油（如果不沾淀粉，补 10 ml），翻面" },
    { index := 8, instruction := "第二面微黄后，加入线椒、小米辣、蒜末煎制约一分钟，翻面" },
    { index := 9, instruction := "接着加豆瓣酱煎制约几十秒，翻面" },
    { index := 10, instruction := "生抽、耗油、糖调成汁，轻轻颠锅后即可出锅" }
  ]
}

theorem recipe_29dc63b5178d_ingredients_nonempty :
    recipe_29dc63b5178d.ingredients.isEmpty = false := by decide

theorem recipe_29dc63b5178d_steps_nonempty :
    recipe_29dc63b5178d.steps.isEmpty = false := by decide

theorem recipe_29dc63b5178d_step_count :
    recipe_29dc63b5178d.steps.length = 10 := by decide

theorem recipe_29dc63b5178d_steps_ordered :
    orderedFrom 1 recipe_29dc63b5178d.steps = true := by decide

theorem recipe_29dc63b5178d_executes_to_terminal :
    executesToTerminal recipe_29dc63b5178d = true := by decide

theorem recipe_29dc63b5178d_kernel_certificate :
    kernelCertified recipe_29dc63b5178d = true := by decide

end LeanToCook.SourceCatalog
