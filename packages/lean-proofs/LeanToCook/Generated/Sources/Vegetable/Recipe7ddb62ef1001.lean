/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 陕北熬豆角 · dishes/vegetable_dish/陕北熬豆角.md -/
def recipe_7ddb62ef1001 : Recipe := {
  id := "7ddb62ef1001"
  title := "陕北熬豆角"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/陕北熬豆角.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "豆角",
    "土豆",
    "西红柿",
    "螺丝椒（可选）",
    "盐",
    "生抽",
    "五香粉",
    "蚝油",
    "葱",
    "姜",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "葱切花，蒜切沫，姜切丝，备用。" },
    { index := 2, instruction := "豆角去筋，切2-10cm小段，备用。" },
    { index := 3, instruction := "土豆去皮，切1cm³小块，备用。" },
    { index := 4, instruction := "西红柿去皮，切1cm³小块，备用。" },
    { index := 5, instruction := "辣椒去仔，切0.15cm 宽条，备用。" },
    { index := 6, instruction := "起锅烧油(10ml - 15ml)，冒烟后放入葱姜蒜，翻炒至闻到葱姜蒜香味；" },
    { index := 7, instruction := "加入豆角，翻炒至变色（青绿色变为翠绿色）；" },
    { index := 8, instruction := "加入土豆块，翻炒 30s；" },
    { index := 9, instruction := "加入热水（水面刚刚漫过菜），盖上锅盖熬至土豆变软（可以用筷子确认）；" },
    { index := 10, instruction := "加入西红柿块，加入盐，生抽，蚝油，五香粉，辣椒，熬至西红柿成汁（注意搅拌，防止糊锅）；" },
    { index := 11, instruction := "加入香菜碎，出锅。" }
  ]
}

theorem recipe_7ddb62ef1001_ingredients_nonempty :
    recipe_7ddb62ef1001.ingredients.isEmpty = false := by decide

theorem recipe_7ddb62ef1001_steps_nonempty :
    recipe_7ddb62ef1001.steps.isEmpty = false := by decide

theorem recipe_7ddb62ef1001_step_count :
    recipe_7ddb62ef1001.steps.length = 11 := by decide

theorem recipe_7ddb62ef1001_steps_ordered :
    orderedFrom 1 recipe_7ddb62ef1001.steps = true := by decide

theorem recipe_7ddb62ef1001_executes_to_terminal :
    executesToTerminal recipe_7ddb62ef1001 = true := by decide

theorem recipe_7ddb62ef1001_kernel_certificate :
    kernelCertified recipe_7ddb62ef1001 = true := by decide

end LeanToCook.SourceCatalog
