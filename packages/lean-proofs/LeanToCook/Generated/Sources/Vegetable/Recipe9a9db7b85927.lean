/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 干锅花菜 · dishes/vegetable_dish/干锅花菜/干锅花菜.md -/
def recipe_9a9db7b85927 : Recipe := {
  id := "9a9db7b85927"
  title := "干锅花菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/干锅花菜/干锅花菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "花菜",
    "五花肉",
    "辣椒",
    "生抽",
    "白糖",
    "蒜",
    "盐",
    "油"
  ]
  steps := [
    { index := 1, instruction := "花菜朵朝下，没入淡盐水中浸泡 20 分钟。然后洗净用小刀拆成小朵" },
    { index := 2, instruction := "入开水锅中焯水 1 分钟，捞出立即用冷水冲淋至完全凉透，沥水备用" },
    { index := 3, instruction := "五花肉切成薄片，大蒜白色切下用刀背拍扁，小红辣椒切成段" },
    { index := 4, instruction := "锅烧热放油，油热下大葱白爆香" },
    { index := 5, instruction := "下五花肉片入锅，用中火煸炒至表面全部变色，继续煸炒一会儿，把肥肉部分的油份逼出一部分" },
    { index := 6, instruction := "倒入红辣椒段和花菜，翻炒几下" },
    { index := 7, instruction := "加入 10 ml 生抽" },
    { index := 8, instruction := "再加入 5 g 白糖，转大火不断翻炒 1 分钟" },
    { index := 9, instruction := "把大蒜叶部分切成段，放入锅中，翻炒几下后，关火盖上盖子焖 1 分钟即可" }
  ]
}

theorem recipe_9a9db7b85927_ingredients_nonempty :
    recipe_9a9db7b85927.ingredients.isEmpty = false := by decide

theorem recipe_9a9db7b85927_steps_nonempty :
    recipe_9a9db7b85927.steps.isEmpty = false := by decide

theorem recipe_9a9db7b85927_step_count :
    recipe_9a9db7b85927.steps.length = 9 := by decide

theorem recipe_9a9db7b85927_steps_ordered :
    orderedFrom 1 recipe_9a9db7b85927.steps = true := by decide

theorem recipe_9a9db7b85927_executes_to_terminal :
    executesToTerminal recipe_9a9db7b85927 = true := by decide

theorem recipe_9a9db7b85927_kernel_certificate :
    kernelCertified recipe_9a9db7b85927 = true := by decide

end LeanToCook.SourceCatalog
