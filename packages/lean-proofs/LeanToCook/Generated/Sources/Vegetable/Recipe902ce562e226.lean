/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 榄菜肉末四季豆 · dishes/vegetable_dish/榄菜肉末四季豆/榄菜肉末四季豆.md -/
def recipe_902ce562e226 : Recipe := {
  id := "902ce562e226"
  title := "榄菜肉末四季豆"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/榄菜肉末四季豆/榄菜肉末四季豆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "四季豆",
    "五花肉",
    "橄榄菜",
    "大蒜",
    "小米辣（不吃辣可以不放）"
  ]
  steps := [
    { index := 1, instruction := "将四季豆洗净，并把筋撕干净，然后切成大小均匀的颗粒备用。" },
    { index := 2, instruction := "将大蒜拍碎剁成蒜末备用。" },
    { index := 3, instruction := "将小米辣切成大小均匀的颗粒备用。" },
    { index := 4, instruction := "将五花肉去皮，然后剁成肉末备用。" },
    { index := 5, instruction := "将锅烧热，然后加入 20ml 油滑锅，锅滑好之后将热油倒出，然后加入 10ml 冷油，这就是传说中热锅冷油，这么做主要是防止肉末粘锅。" },
    { index := 6, instruction := "如果家里没有晾油瓶的话，也可以不用滑锅，放入油之后，直接加入肉末开始煸炒，小火煸炒两分钟，炒出猪油。" },
    { index := 7, instruction := "肉末炒香之后加入蒜末，橄榄菜和小米辣，炒出香味。" },
    { index := 8, instruction := "加入四季豆开中火煸炒，四季豆至少要炒 5 分钟，一定要保证四季豆熟透，否则可能会食物中毒。" },
    { index := 9, instruction := "四季豆炒熟后加入 2ml 酱油从锅边淋入，然后加入 2g 盐、1g 鸡精、1g 胡椒粉和 0.5g 糖。" },
    { index := 10, instruction := "将调料翻炒均匀。" },
    { index := 11, instruction := "出锅，装盘。" }
  ]
}

theorem recipe_902ce562e226_ingredients_nonempty :
    recipe_902ce562e226.ingredients.isEmpty = false := by decide

theorem recipe_902ce562e226_steps_nonempty :
    recipe_902ce562e226.steps.isEmpty = false := by decide

theorem recipe_902ce562e226_step_count :
    recipe_902ce562e226.steps.length = 11 := by decide

theorem recipe_902ce562e226_steps_ordered :
    orderedFrom 1 recipe_902ce562e226.steps = true := by decide

theorem recipe_902ce562e226_executes_to_terminal :
    executesToTerminal recipe_902ce562e226 = true := by decide

theorem recipe_902ce562e226_kernel_certificate :
    kernelCertified recipe_902ce562e226 = true := by decide

end LeanToCook.SourceCatalog
