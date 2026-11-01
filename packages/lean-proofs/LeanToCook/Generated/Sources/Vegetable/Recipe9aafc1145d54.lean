/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蚝油生菜 · dishes/vegetable_dish/蚝油生菜.md -/
def recipe_9aafc1145d54 : Recipe := {
  id := "9aafc1145d54"
  title := "蚝油生菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蚝油生菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "生菜",
    "蚝油",
    "大蒜",
    "生抽",
    "盐",
    "白糖",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "生菜洗净并去掉烂菜叶。" },
    { index := 2, instruction := "热锅，先放 1 L 清水（凉），然后在锅内放入 2 ml - 3 ml 食用油和 0.5 g 盐，等待锅中的水煮沸。" },
    { index := 3, instruction := "水沸后，放入生菜，将每一片生菜叶都焯水 10 s。" },
    { index := 4, instruction := "捞出生菜，控干水份，摆盘 。" },
    { index := 5, instruction := "调汁：将生抽 10 ml 、蚝油 6-8 ml 、盐 0.5 g 、 白糖 1 g 放入碗中调匀，并加入 10-15 ml 清水（凉）搅拌均匀。" },
    { index := 6, instruction := "再开火，热锅，放入食用油 5-8 ml，油热放入蒜泥。" },
    { index := 7, instruction := "等待有蒜香飘出，倒入调好的汁，煮沸即可，立马关火。" },
    { index := 8, instruction := "将锅中的汤汁均匀地浇在生菜上。" }
  ]
}

theorem recipe_9aafc1145d54_ingredients_nonempty :
    recipe_9aafc1145d54.ingredients.isEmpty = false := by decide

theorem recipe_9aafc1145d54_steps_nonempty :
    recipe_9aafc1145d54.steps.isEmpty = false := by decide

theorem recipe_9aafc1145d54_step_count :
    recipe_9aafc1145d54.steps.length = 8 := by decide

theorem recipe_9aafc1145d54_steps_ordered :
    orderedFrom 1 recipe_9aafc1145d54.steps = true := by decide

theorem recipe_9aafc1145d54_executes_to_terminal :
    executesToTerminal recipe_9aafc1145d54 = true := by decide

theorem recipe_9aafc1145d54_kernel_certificate :
    kernelCertified recipe_9aafc1145d54 = true := by decide

end LeanToCook.SourceCatalog
