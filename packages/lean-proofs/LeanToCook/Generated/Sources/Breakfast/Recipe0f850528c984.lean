/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 牛奶燕麦 · dishes/breakfast/牛奶燕麦.md -/
def recipe_0f850528c984 : Recipe := {
  id := "0f850528c984"
  title := "牛奶燕麦"
  category := "breakfast"
  sourcePath := "dishes/breakfast/牛奶燕麦.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛奶（巴氏奶口感更好）",
    "燕麦",
    "鸡蛋"
  ]
  steps := [
    { index := 1, instruction := "将牛奶倒入早餐杯（冷的即可）" },
    { index := 2, instruction := "准备好 200ml 水，如果是直饮水直接加入燕麦，否则请烧开后加入燕麦" },
    { index := 3, instruction := "水沸后 2 分钟，燕麦煮好" },
    { index := 4, instruction := "煮好的燕麦捞出倒入牛奶中（尽量不要将煮燕麦的水也倒入牛奶，影响口感）" },
    { index := 5, instruction := "将燕麦替换为快煮燕麦" },
    { index := 6, instruction := "将牛奶倒入装有快煮燕麦的容器中并搅拌" },
    { index := 7, instruction := "将混合物放入微波炉中" },
    { index := 8, instruction := "中等火力微波 4 分钟" },
    { index := 9, instruction := "热锅，锅内放一层底油，油热后煎鸡蛋，每面煎 20s，考虑调底味（3g 椒盐，可选）" },
    { index := 10, instruction := "关火，装盘" }
  ]
}

theorem recipe_0f850528c984_ingredients_nonempty :
    recipe_0f850528c984.ingredients.isEmpty = false := by decide

theorem recipe_0f850528c984_steps_nonempty :
    recipe_0f850528c984.steps.isEmpty = false := by decide

theorem recipe_0f850528c984_step_count :
    recipe_0f850528c984.steps.length = 10 := by decide

theorem recipe_0f850528c984_steps_ordered :
    orderedFrom 1 recipe_0f850528c984.steps = true := by decide

theorem recipe_0f850528c984_executes_to_terminal :
    executesToTerminal recipe_0f850528c984 = true := by decide

theorem recipe_0f850528c984_kernel_certificate :
    kernelCertified recipe_0f850528c984 = true := by decide

end LeanToCook.SourceCatalog
