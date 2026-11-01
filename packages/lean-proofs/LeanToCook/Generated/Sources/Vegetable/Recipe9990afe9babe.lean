/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 脆皮豆腐 · dishes/vegetable_dish/脆皮豆腐.md -/
def recipe_9990afe9babe : Recipe := {
  id := "9990afe9babe"
  title := "脆皮豆腐"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/脆皮豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "老豆腐",
    "鸡蛋",
    "生抽",
    "老抽",
    "蚝油",
    "白糖",
    "玉米淀粉",
    "平底锅"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋搅拌形成蛋液放置备用" },
    { index := 2, instruction := "配置酱料 （20 g 生抽+10 g 蚝油+5 g 老抽+10 g 白糖+10 g 玉米淀粉+200 ml 清水）" },
    { index := 3, instruction := "老豆腐切片 （个人建议，仅供参考  人  5 片，厚度 1.2 cm）" },
    { index := 4, instruction := "玉米淀粉倒入盘中，将老豆腐片粘上淀粉后，粘上蛋液，放置一旁" },
    { index := 5, instruction := "热锅，锅内放入 18ml 食用油。等待 10 秒让油温升高" },
    { index := 6, instruction := "将粘上蛋液的老豆腐片均匀放入锅中，铺好锅底，小火煎至金黄翻面" },
    { index := 7, instruction := "待两面煎至金黄后，倒入酱料，让每块豆腐都沐浴在酱料中，大火 3 分钟至酱汁浓稠" },
    { index := 8, instruction := "关火" }
  ]
}

theorem recipe_9990afe9babe_ingredients_nonempty :
    recipe_9990afe9babe.ingredients.isEmpty = false := by decide

theorem recipe_9990afe9babe_steps_nonempty :
    recipe_9990afe9babe.steps.isEmpty = false := by decide

theorem recipe_9990afe9babe_step_count :
    recipe_9990afe9babe.steps.length = 8 := by decide

theorem recipe_9990afe9babe_steps_ordered :
    orderedFrom 1 recipe_9990afe9babe.steps = true := by decide

theorem recipe_9990afe9babe_executes_to_terminal :
    executesToTerminal recipe_9990afe9babe = true := by decide

theorem recipe_9990afe9babe_kernel_certificate :
    kernelCertified recipe_9990afe9babe = true := by decide

end LeanToCook.SourceCatalog
