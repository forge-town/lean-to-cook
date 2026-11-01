/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 姜葱捞鸡 · dishes/meat_dish/姜葱捞鸡/姜葱捞鸡.md -/
def recipe_95eb9c00a57f : Recipe := {
  id := "95eb9c00a57f"
  title := "姜葱捞鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/姜葱捞鸡/姜葱捞鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿肉",
    "盐焗鸡粉",
    "葱，姜"
  ]
  steps := [
    { index := 1, instruction := "四个鸡腿清洗干净，放入碗中" },
    { index := 2, instruction := "碗中加入盐焗鸡粉和 5ml 油，搅拌均匀" },
    { index := 3, instruction := "让鸡腿静置腌制 15 分钟， 同时准备蒸锅并把水煮开" },
    { index := 4, instruction := "鸡腿腌制完成后， 放入水开后的蒸锅中，蒸制 20 分钟" },
    { index := 5, instruction := "将姜根据个人口味切成 1）姜蓉或 2）姜丝或 3）姜粒" },
    { index := 6, instruction := "将葱切成 0.5cm 小段" },
    { index := 7, instruction := "将葱姜放入蘸料碗，并加入盐和糖" },
    { index := 8, instruction := "将剩余的油倒入另一个锅中加热至六至七层热" },
    { index := 9, instruction := "将热油淋入葱姜碗中" },
    { index := 10, instruction := "鸡腿蒸好后将其撕碎成鸡丝，不需要特别细，大概 1cm 粗就可以" },
    { index := 11, instruction := "姜葱姜油淋在鸡丝上，搅拌均匀即可" }
  ]
}

theorem recipe_95eb9c00a57f_ingredients_nonempty :
    recipe_95eb9c00a57f.ingredients.isEmpty = false := by decide

theorem recipe_95eb9c00a57f_steps_nonempty :
    recipe_95eb9c00a57f.steps.isEmpty = false := by decide

theorem recipe_95eb9c00a57f_step_count :
    recipe_95eb9c00a57f.steps.length = 11 := by decide

theorem recipe_95eb9c00a57f_steps_ordered :
    orderedFrom 1 recipe_95eb9c00a57f.steps = true := by decide

theorem recipe_95eb9c00a57f_executes_to_terminal :
    executesToTerminal recipe_95eb9c00a57f = true := by decide

theorem recipe_95eb9c00a57f_kernel_certificate :
    kernelCertified recipe_95eb9c00a57f = true := by decide

end LeanToCook.SourceCatalog
