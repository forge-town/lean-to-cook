/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 湖南家常红烧肉 · dishes/meat_dish/湖南家常红烧肉/湖南家常红烧肉.md -/
def recipe_c57bcc7e9419 : Recipe := {
  id := "c57bcc7e9419"
  title := "湖南家常红烧肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/湖南家常红烧肉/湖南家常红烧肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "带皮五花肉",
    "干小米椒🌶（根据个人情况而定）",
    "姜",
    "生抽",
    "老抽",
    "香叶",
    "桂皮",
    "八角",
    "冰糖",
    "料酒",
    "盐",
    "冰糖（锁油上色）",
    "食用油",
    "开水"
  ]
  steps := [
    { index := 1, instruction := "带皮五花肉洗净冷水下锅，加入姜片 23 片去腥味，煮到沸腾捞出冷水冲净白沫" },
    { index := 2, instruction := "五花肉切块，尺寸 1.5cm1.5cm 块状大小" },
    { index := 3, instruction := "热锅加入油，加入冰糖小火搅拌至焦糖色即可，加入切好的五花肉，中火翻炒上色" },
    { index := 4, instruction := "加入备好的姜片、八角、桂皮、生抽、老抽、料酒、干小米椒、盐，小火翻炒 1 分钟，加开水没过肉" },
    { index := 5, instruction := "加盖中火煮沸，转小火慢顿 30 分钟，慢炖期间，间隔 10 分钟搅拌一次防止粘锅" },
    { index := 6, instruction := "小火慢炖汤汁剩三分之一的时，调成中火收汁出锅。" }
  ]
}

theorem recipe_c57bcc7e9419_ingredients_nonempty :
    recipe_c57bcc7e9419.ingredients.isEmpty = false := by decide

theorem recipe_c57bcc7e9419_steps_nonempty :
    recipe_c57bcc7e9419.steps.isEmpty = false := by decide

theorem recipe_c57bcc7e9419_step_count :
    recipe_c57bcc7e9419.steps.length = 6 := by decide

theorem recipe_c57bcc7e9419_steps_ordered :
    orderedFrom 1 recipe_c57bcc7e9419.steps = true := by decide

theorem recipe_c57bcc7e9419_executes_to_terminal :
    executesToTerminal recipe_c57bcc7e9419 = true := by decide

theorem recipe_c57bcc7e9419_kernel_certificate :
    kernelCertified recipe_c57bcc7e9419 = true := by decide

end LeanToCook.SourceCatalog
