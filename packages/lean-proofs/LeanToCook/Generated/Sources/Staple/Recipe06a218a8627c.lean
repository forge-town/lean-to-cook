/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒸卤面 · dishes/staple/蒸卤面.md -/
def recipe_06a218a8627c : Recipe := {
  id := "06a218a8627c"
  title := "蒸卤面"
  category := "staple"
  sourcePath := "dishes/staple/蒸卤面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪五花肉",
    "芹菜",
    "鲜面条（要求必须是最细的，如果附近菜市场没有，请参考制作焖面）",
    "葱，姜，蒜",
    "食用油（花生油最佳）",
    "生抽，老抽，料酒，盐，五香粉",
    "蒸锅，需带笼屉",
    "炒锅",
    "花椒",
    "干红椒",
    "青椒"
  ]
  steps := [
    { index := 1, instruction := "猪肉去皮，切成 2 cm  6 cm  0.5 cm 薄片备用" },
    { index := 2, instruction := "芹菜去叶，去掉根部 2cm，然后从中对半切开，切成 2cm 段备用" },
    { index := 3, instruction := "大蒜去皮切粒备用，葱切 0.2cm 薄片备用，姜切细丝备用" },
    { index := 4, instruction := "炒锅烧热至冒烟后，倒入 3ml 食用油滑锅后倒出底油" },
    { index := 5, instruction := "重新加入食用油，加入肉片，葱姜蒜，干红椒，炒 1 分钟，注意不停匀速翻炒" },
    { index := 6, instruction := "加入料酒，生抽，老抽，再翻炒 1 分钟" },
    { index := 7, instruction := "续入 500ml 热水。盖上锅盖炖煮 3 分钟" },
    { index := 8, instruction := "将芹菜，青椒倒入锅中，加入盐，五香粉调味，盖上锅盖继续炖煮 3 分钟 后关火" },
    { index := 9, instruction := "蒸锅加入 1000ml 水，烧开上汽后，将面条摊平在笼屉上放入锅中，蒸 15 分钟" },
    { index := 10, instruction := "面条蒸熟后取出，用筷子和无情铁手扒拉散开在案板上，室温冷却" },
    { index := 11, instruction := "将面条放入菜锅中搅拌，搅拌方式为一手持筷，一手持锅铲将菜翻至面条上面，以面条以全部均匀上色为搅拌完成标准" },
    { index := 12, instruction := "将搅拌后的面条再次放在整屉上，再次蒸 10 分钟 关火" }
  ]
}

theorem recipe_06a218a8627c_ingredients_nonempty :
    recipe_06a218a8627c.ingredients.isEmpty = false := by decide

theorem recipe_06a218a8627c_steps_nonempty :
    recipe_06a218a8627c.steps.isEmpty = false := by decide

theorem recipe_06a218a8627c_step_count :
    recipe_06a218a8627c.steps.length = 12 := by decide

theorem recipe_06a218a8627c_steps_ordered :
    orderedFrom 1 recipe_06a218a8627c.steps = true := by decide

theorem recipe_06a218a8627c_executes_to_terminal :
    executesToTerminal recipe_06a218a8627c = true := by decide

theorem recipe_06a218a8627c_kernel_certificate :
    kernelCertified recipe_06a218a8627c = true := by decide

end LeanToCook.SourceCatalog
