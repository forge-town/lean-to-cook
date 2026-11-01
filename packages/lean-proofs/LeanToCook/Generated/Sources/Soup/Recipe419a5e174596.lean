/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 罗宋汤 · dishes/soup/罗宋汤.md -/
def recipe_419a5e174596 : Recipe := {
  id := "419a5e174596"
  title := "罗宋汤"
  category := "soup"
  sourcePath := "dishes/soup/罗宋汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蔬菜高汤（欧芹、胡萝卜、洋葱三件套）",
    "牛肉高汤（可用〇汤宝代替）",
    "牛肉（可选牛腩肉或牛尾肉）",
    "番茄（番茄膏、番茄罐头）"
  ]
  steps := [
    { index := 1, instruction := "洋葱、胡萝卜、欧芹切 1cm 见方小丁" },
    { index := 2, instruction := "红肠、马铃薯切 2cm 块" },
    { index := 3, instruction := "包菜去梗后，手撕至 2cm 片" },
    { index := 4, instruction := "牛肉撒盐 3 g 、黑胡椒 3 g 腌制 5 分钟" },
    { index := 5, instruction := "平底锅烧热，加入植物油" },
    { index := 6, instruction := "煎制牛肉，直至表面焦黄色（可以带生，千万别糊了），取出备用。" },
    { index := 7, instruction := "汤锅烧热，加入橄榄油、洋葱丁、胡萝卜丁、欧芹丁" },
    { index := 8, instruction := "炒至洋葱透明，加入番茄膏、番茄罐头" },
    { index := 9, instruction := "加入牛肉、马铃薯丁，翻炒均匀" },
    { index := 10, instruction := "加水没过食材，中火烹制 1 小时" },
    { index := 11, instruction := "开锅加入包菜丁、红肠丁，搅拌均匀" },
    { index := 12, instruction := "中火烹制半小时" },
    { index := 13, instruction := "开盖加入剩余 15 g 盐，混合均匀后盛盘" }
  ]
}

theorem recipe_419a5e174596_ingredients_nonempty :
    recipe_419a5e174596.ingredients.isEmpty = false := by decide

theorem recipe_419a5e174596_steps_nonempty :
    recipe_419a5e174596.steps.isEmpty = false := by decide

theorem recipe_419a5e174596_step_count :
    recipe_419a5e174596.steps.length = 13 := by decide

theorem recipe_419a5e174596_steps_ordered :
    orderedFrom 1 recipe_419a5e174596.steps = true := by decide

theorem recipe_419a5e174596_executes_to_terminal :
    executesToTerminal recipe_419a5e174596 = true := by decide

theorem recipe_419a5e174596_kernel_certificate :
    kernelCertified recipe_419a5e174596 = true := by decide

end LeanToCook.SourceCatalog
