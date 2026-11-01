/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧猪蹄 · dishes/meat_dish/红烧猪蹄/红烧猪蹄.md -/
def recipe_18f5ac325209 : Recipe := {
  id := "18f5ac325209"
  title := "红烧猪蹄"
  category := "meat"
  sourcePath := "dishes/meat_dish/红烧猪蹄/红烧猪蹄.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪蹄",
    "香叶",
    "姜",
    "葱",
    "老抽",
    "桂皮",
    "冰糖",
    "料酒",
    "生抽",
    "盐",
    "八角",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "冷水锅中放入热心摊主剁好的猪蹄，加入 20 ml 料酒与葱姜，煮 15 分钟去掉血腥" },
    { index := 2, instruction := "热锅冷油，倒入 30ml 食用油，放入 7-8 粒冰糖，开小火，熬成糖色，期间用锅铲把冰糖压碎，大概熬 2 分钟" },
    { index := 3, instruction := "熬成糖色后，放入焯过水的猪蹄，继续小火，翻炒猪蹄，直至所有猪蹄两面微黄" },
    { index := 4, instruction := "加入香叶 2 片、桂皮 1 块、八角 4 个、生抽 20 ml、老抽 20 ml、料酒 10 ml、姜 3 片、盐 8 克，转中火、继续翻炒 1 分钟" },
    { index := 5, instruction := "加入开水或者冷水，水需要没过猪蹄，盖上锅盖，大火烧开，烧开之后关火" },
    { index := 6, instruction := "把锅内的食材全部倒入高压锅中，高压锅中需要 15 分钟（如果同学没有高压锅，可放在锅中大火转小火熬制即可）" },
    { index := 7, instruction := "15 分钟之后，把高压锅的食材倒入炒锅中，开大火收汁，此时可用筷子尝下味道、淡的话可以加 23g 盐" },
    { index := 8, instruction := "大火收汁时长根据锅中的水来算，一般 30 秒即可，多留点也无碍、红烧猪蹄汤也是很下饭的" }
  ]
}

theorem recipe_18f5ac325209_ingredients_nonempty :
    recipe_18f5ac325209.ingredients.isEmpty = false := by decide

theorem recipe_18f5ac325209_steps_nonempty :
    recipe_18f5ac325209.steps.isEmpty = false := by decide

theorem recipe_18f5ac325209_step_count :
    recipe_18f5ac325209.steps.length = 8 := by decide

theorem recipe_18f5ac325209_steps_ordered :
    orderedFrom 1 recipe_18f5ac325209.steps = true := by decide

theorem recipe_18f5ac325209_executes_to_terminal :
    executesToTerminal recipe_18f5ac325209 = true := by decide

theorem recipe_18f5ac325209_kernel_certificate :
    kernelCertified recipe_18f5ac325209 = true := by decide

end LeanToCook.SourceCatalog
