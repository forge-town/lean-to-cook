/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 菠萝咖啡特调 · dishes/drink/菠萝咖啡特调/菠萝咖啡特调.md -/
def recipe_cb3741f4d29d : Recipe := {
  id := "cb3741f4d29d"
  title := "菠萝咖啡特调"
  category := "drink"
  sourcePath := "dishes/drink/菠萝咖啡特调/菠萝咖啡特调.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "咖啡液（推荐浓缩或者冷萃）",
    "菠萝汁（鲜榨或者 nfc）",
    "冰块",
    "苏打水",
    "奶油",
    "牛奶",
    "糖",
    "海盐（可选）",
    "朗姆酒 （可选）"
  ]
  steps := [
    { index := 1, instruction := "杯子里依次加入冰块，咖啡液，菠萝汁和苏打水" },
    { index := 2, instruction := "奶油加糖打发至湿性发泡，加入朗姆酒和牛奶均匀只有流动性" },
    { index := 3, instruction := "在第一部混合液上方倒入奶油" },
    { index := 4, instruction := "奶油顶面撒上海盐" }
  ]
}

theorem recipe_cb3741f4d29d_ingredients_nonempty :
    recipe_cb3741f4d29d.ingredients.isEmpty = false := by decide

theorem recipe_cb3741f4d29d_steps_nonempty :
    recipe_cb3741f4d29d.steps.isEmpty = false := by decide

theorem recipe_cb3741f4d29d_step_count :
    recipe_cb3741f4d29d.steps.length = 4 := by decide

theorem recipe_cb3741f4d29d_steps_ordered :
    orderedFrom 1 recipe_cb3741f4d29d.steps = true := by decide

theorem recipe_cb3741f4d29d_executes_to_terminal :
    executesToTerminal recipe_cb3741f4d29d = true := by decide

theorem recipe_cb3741f4d29d_kernel_certificate :
    kernelCertified recipe_cb3741f4d29d = true := by decide

end LeanToCook.SourceCatalog
