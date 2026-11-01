/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 咖喱肥牛 · dishes/meat_dish/咖喱肥牛/咖喱肥牛.md -/
def recipe_e21f5bfb5fe6 : Recipe := {
  id := "e21f5bfb5fe6"
  title := "咖喱肥牛"
  category := "meat"
  sourcePath := "dishes/meat_dish/咖喱肥牛/咖喱肥牛.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "香叶",
    "纯牛奶（推荐卫岗鲜奶）",
    "洋葱",
    "胡萝卜",
    "土豆",
    "肥牛卷",
    "咖喱块"
  ]
  steps := [
    { index := 1, instruction := "洋葱切成条状、胡萝卜以及土豆切成块状，备用" },
    { index := 2, instruction := "烧一锅开水，水沸时将肥牛卷下锅，捞出血沫后放在一边沥水，备用" },
    { index := 3, instruction := "热锅，锅内放入 10ml - 15ml 食用油，等待 10 秒让油温升高" },
    { index := 4, instruction := "放入洋葱，翻炒至洋葱变软变透明" },
    { index := 5, instruction := "放入土豆以及胡萝卜翻炒 2 分钟" },
    { index := 6, instruction := "加入冷水至淹没所有食材即可" },
    { index := 7, instruction := "将香叶、咖喱块投入锅中，盖上锅盖，待水沸腾后将火调小然后等待直至土豆块以及胡萝卜块炖至软烂（可用筷子确认）" },
    { index := 8, instruction := "加入肥牛卷以及牛奶，盖上锅盖再小火煮 2-3 分钟即可出锅（用勺子搅拌食材，注意力度，避免肥牛卷破碎）" }
  ]
}

theorem recipe_e21f5bfb5fe6_ingredients_nonempty :
    recipe_e21f5bfb5fe6.ingredients.isEmpty = false := by decide

theorem recipe_e21f5bfb5fe6_steps_nonempty :
    recipe_e21f5bfb5fe6.steps.isEmpty = false := by decide

theorem recipe_e21f5bfb5fe6_step_count :
    recipe_e21f5bfb5fe6.steps.length = 8 := by decide

theorem recipe_e21f5bfb5fe6_steps_ordered :
    orderedFrom 1 recipe_e21f5bfb5fe6.steps = true := by decide

theorem recipe_e21f5bfb5fe6_executes_to_terminal :
    executesToTerminal recipe_e21f5bfb5fe6 = true := by decide

theorem recipe_e21f5bfb5fe6_kernel_certificate :
    kernelCertified recipe_e21f5bfb5fe6 = true := by decide

end LeanToCook.SourceCatalog
