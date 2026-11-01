/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜蓉西兰花 · dishes/vegetable_dish/蒜蓉西兰花.md -/
def recipe_92f286f58f84 : Recipe := {
  id := "92f286f58f84"
  title := "蒜蓉西兰花"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蒜蓉西兰花.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西兰花 1 个",
    "大蒜 3-4 瓣",
    "生抽",
    "蚝油",
    "白糖"
  ]
  steps := [
    { index := 1, instruction := "将 西兰花 切成小朵，清洗干净。" },
    { index := 2, instruction := "将 大蒜 去皮，切成蒜末，备用。" },
    { index := 3, instruction := "锅中加入 1000 ml 饮用水，大火烧开。" },
    { index := 4, instruction := "放入 西兰花，保持大火 煮 2-3 分钟，至 西兰花 颜色变翠绿，口感变软。" },
    { index := 5, instruction := "将 煮好的 西兰花 捞出，沥干水分，摆入盘中，备用。" },
    { index := 6, instruction := "热锅，加入 10 ml 食用油。油温升高后，放入 大蒜末，小火煸炒出香味。" },
    { index := 7, instruction := "加入 10 ml 生抽，5 ml 蚝油，2 g 白糖，加入 30 ml 饮用水。" },
    { index := 8, instruction := "将锅中汤汁烧开。" },
    { index := 9, instruction := "将烧好的蒜蓉汁 均匀淋在盘中的 西兰花 上。" }
  ]
}

theorem recipe_92f286f58f84_ingredients_nonempty :
    recipe_92f286f58f84.ingredients.isEmpty = false := by decide

theorem recipe_92f286f58f84_steps_nonempty :
    recipe_92f286f58f84.steps.isEmpty = false := by decide

theorem recipe_92f286f58f84_step_count :
    recipe_92f286f58f84.steps.length = 9 := by decide

theorem recipe_92f286f58f84_steps_ordered :
    orderedFrom 1 recipe_92f286f58f84.steps = true := by decide

theorem recipe_92f286f58f84_executes_to_terminal :
    executesToTerminal recipe_92f286f58f84 = true := by decide

theorem recipe_92f286f58f84_kernel_certificate :
    kernelCertified recipe_92f286f58f84 = true := by decide

end LeanToCook.SourceCatalog
