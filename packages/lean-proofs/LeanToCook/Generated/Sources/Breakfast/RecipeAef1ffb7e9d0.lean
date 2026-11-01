/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 苏格兰蛋 · dishes/breakfast/苏格兰蛋/苏格兰蛋.md -/
def recipe_aef1ffb7e9d0 : Recipe := {
  id := "aef1ffb7e9d0"
  title := "苏格兰蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/苏格兰蛋/苏格兰蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "手抓饼皮",
    "芝士",
    "培根",
    "空气炸锅或者油锅"
  ]
  steps := [
    { index := 1, instruction := "用冷水下锅水开 3 分钟后捞出" },
    { index := 2, instruction := "鸡蛋捞出，放入冰水中剥壳更快速也更完整" },
    { index := 3, instruction := "用芝士片包裹鸡蛋" },
    { index := 4, instruction := "培根片包裹鸡蛋" },
    { index := 5, instruction := "手抓饼两端切除以矩形包裹鸡蛋" },
    { index := 6, instruction := "油温 6 成下锅（油面波动，有青烟，筷子插入油中周围泛起气泡即是 6 成温度） 炸制金黄即可" },
    { index := 7, instruction := "空气炸锅 160 度 15 分钟" },
    { index := 8, instruction := "切开即可食用" }
  ]
}

theorem recipe_aef1ffb7e9d0_ingredients_nonempty :
    recipe_aef1ffb7e9d0.ingredients.isEmpty = false := by decide

theorem recipe_aef1ffb7e9d0_steps_nonempty :
    recipe_aef1ffb7e9d0.steps.isEmpty = false := by decide

theorem recipe_aef1ffb7e9d0_step_count :
    recipe_aef1ffb7e9d0.steps.length = 8 := by decide

theorem recipe_aef1ffb7e9d0_steps_ordered :
    orderedFrom 1 recipe_aef1ffb7e9d0.steps = true := by decide

theorem recipe_aef1ffb7e9d0_executes_to_terminal :
    executesToTerminal recipe_aef1ffb7e9d0 = true := by decide

theorem recipe_aef1ffb7e9d0_kernel_certificate :
    kernelCertified recipe_aef1ffb7e9d0 = true := by decide

end LeanToCook.SourceCatalog
