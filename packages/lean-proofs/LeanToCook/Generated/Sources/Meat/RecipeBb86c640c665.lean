/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 澳门湿版免治牛肉饭 · dishes/meat_dish/澳门湿版免治牛肉饭/澳门湿版免治牛肉饭.md -/
def recipe_bb86c640c665 : Recipe := {
  id := "bb86c640c665"
  title := "澳门湿版免治牛肉饭"
  category := "meat"
  sourcePath := "dishes/meat_dish/澳门湿版免治牛肉饭/澳门湿版免治牛肉饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉末（可以用稍微肥一点的猪肉末代替）",
    "洋葱",
    "鸡蛋",
    "黄油（可用普通食用油代替）",
    "小葱（可选）",
    "生抽",
    "老抽",
    "番茄酱",
    "白糖",
    "料酒",
    "黑胡椒",
    "淀粉",
    "米饭"
  ]
  steps := [
    { index := 1, instruction := "将 200g 牛肉末放入碗中，加入 1 汤匙生抽、半汤匙白糖和 2g 黑胡椒，搅拌均匀，等待腌制 10 分钟。" },
    { index := 2, instruction := "将半个洋葱切成小丁，备用。" },
    { index := 3, instruction := "调制料汁：在碗中加入 2 汤匙生抽、2 汤匙番茄酱、1 汤匙料酒、1 汤匙淀粉、半汤匙老抽和 50ml 清水，搅拌均匀备用。" },
    { index := 4, instruction := "另起一锅，制作一个水波蛋或半熟煎蛋，备用。" },
    { index := 5, instruction := "热锅，放入 10g 黄油。待黄油融化后，放入洋葱丁，小火煎熟至散发香味。" },
    { index := 6, instruction := "加入腌制好的牛肉末，与洋葱一起翻炒至牛肉变色。" },
    { index := 7, instruction := "倒入调好的料汁，撒上 2g 黑胡椒，继续炒制直至汤汁变粘稠后关火。" },
    { index := 8, instruction := "将炒好的免治牛肉浇在热米饭上，放上提前准备好的水波蛋或半熟煎蛋。" },
    { index := 9, instruction := "（可选）表面撒上 5g 切好的小葱花作装饰。" }
  ]
}

theorem recipe_bb86c640c665_ingredients_nonempty :
    recipe_bb86c640c665.ingredients.isEmpty = false := by decide

theorem recipe_bb86c640c665_steps_nonempty :
    recipe_bb86c640c665.steps.isEmpty = false := by decide

theorem recipe_bb86c640c665_step_count :
    recipe_bb86c640c665.steps.length = 9 := by decide

theorem recipe_bb86c640c665_steps_ordered :
    orderedFrom 1 recipe_bb86c640c665.steps = true := by decide

theorem recipe_bb86c640c665_executes_to_terminal :
    executesToTerminal recipe_bb86c640c665 = true := by decide

theorem recipe_bb86c640c665_kernel_certificate :
    kernelCertified recipe_bb86c640c665 = true := by decide

end LeanToCook.SourceCatalog
