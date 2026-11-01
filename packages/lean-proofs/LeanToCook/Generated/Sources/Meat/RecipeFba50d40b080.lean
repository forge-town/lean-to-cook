/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蚂蚁上树 · dishes/meat_dish/蚂蚁上树.md -/
def recipe_fba50d40b080 : Recipe := {
  id := "fba50d40b080"
  title := "蚂蚁上树"
  category := "meat"
  sourcePath := "dishes/meat_dish/蚂蚁上树.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "红薯粉丝",
    "猪肉末（或牛肉末）",
    "郫县豆瓣酱",
    "生抽",
    "老抽",
    "食用油",
    "蒜末、姜末",
    "小葱（可选）"
  ]
  steps := [
    { index := 1, instruction := "红薯粉丝提前泡软，泡水时间为 20 分钟，备用" },
    { index := 2, instruction := "将蒜、姜分别剁碎，备用" },
    { index := 3, instruction := "锅烧热，加入 10ml 食用油，加入蒜末、姜末炒香" },
    { index := 4, instruction := "加入猪肉末翻炒至肉色发白且微微出油" },
    { index := 5, instruction := "加入郫县豆瓣酱，炒至红油析出" },
    { index := 6, instruction := "加入生抽和老抽，翻炒均匀" },
    { index := 7, instruction := "倒入 300ml 清水，煮沸" },
    { index := 8, instruction := "放入泡软沥干的粉丝，用筷子轻轻拨动防止粘连" },
    { index := 9, instruction := "中小火煮约 5 分钟，直至粉丝完全吸收汤汁、呈现微微收干状态" },
    { index := 10, instruction := "依据口味可撒入小葱末，关火装盘" }
  ]
}

theorem recipe_fba50d40b080_ingredients_nonempty :
    recipe_fba50d40b080.ingredients.isEmpty = false := by decide

theorem recipe_fba50d40b080_steps_nonempty :
    recipe_fba50d40b080.steps.isEmpty = false := by decide

theorem recipe_fba50d40b080_step_count :
    recipe_fba50d40b080.steps.length = 10 := by decide

theorem recipe_fba50d40b080_steps_ordered :
    orderedFrom 1 recipe_fba50d40b080.steps = true := by decide

theorem recipe_fba50d40b080_executes_to_terminal :
    executesToTerminal recipe_fba50d40b080 = true := by decide

theorem recipe_fba50d40b080_kernel_certificate :
    kernelCertified recipe_fba50d40b080 = true := by decide

end LeanToCook.SourceCatalog
