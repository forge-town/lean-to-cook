/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 梅菜扣肉 · dishes/meat_dish/梅菜扣肉/梅菜扣肉.md -/
def recipe_4217ebd7f1e5 : Recipe := {
  id := "4217ebd7f1e5"
  title := "梅菜扣肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/梅菜扣肉/梅菜扣肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉",
    "梅菜",
    "五香粉",
    "食用油",
    "白砂糖",
    "老抽",
    "生抽",
    "小米椒",
    "蒜末",
    "食用盐",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "梅菜放到清水中，浸泡 1 小时" },
    { index := 2, instruction := "锅中倒入 50 ml 食用油，将整个五花肉猪皮朝下，放到锅中 1 分钟 ，取出挂掉猪皮 【可选】" },
    { index := 3, instruction := "锅中加入开水，放入五花肉，大火煮 20 分钟 （筷子可以插进五花肉），取出五花肉" },
    { index := 4, instruction := "在五花肉表面涂抹均匀老抽、五香粉、白砂糖，放置 15 分钟" },
    { index := 5, instruction := "起锅烧油，加入五花肉，中火油炸直至两面金黄色（3-5 分钟）" },
    { index := 6, instruction := "起锅烧油，倒入梅菜，加上小米椒、蒜蓉、鸡精、食用盐后翻炒，直至炒干梅干菜水分" },
    { index := 7, instruction := "五花肉切片（后端 0.5-1 cm）,放在大碗中，散上梅干菜" },
    { index := 8, instruction := "中火蒸 45 分钟" },
    { index := 9, instruction := "拿个盘子倒盖在五花肉大碗中，将五花肉倒在盘子中" }
  ]
}

theorem recipe_4217ebd7f1e5_ingredients_nonempty :
    recipe_4217ebd7f1e5.ingredients.isEmpty = false := by decide

theorem recipe_4217ebd7f1e5_steps_nonempty :
    recipe_4217ebd7f1e5.steps.isEmpty = false := by decide

theorem recipe_4217ebd7f1e5_step_count :
    recipe_4217ebd7f1e5.steps.length = 9 := by decide

theorem recipe_4217ebd7f1e5_steps_ordered :
    orderedFrom 1 recipe_4217ebd7f1e5.steps = true := by decide

theorem recipe_4217ebd7f1e5_executes_to_terminal :
    executesToTerminal recipe_4217ebd7f1e5 = true := by decide

theorem recipe_4217ebd7f1e5_kernel_certificate :
    kernelCertified recipe_4217ebd7f1e5 = true := by decide

end LeanToCook.SourceCatalog
