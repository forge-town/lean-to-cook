/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酱排骨 · dishes/meat_dish/酱排骨/酱排骨.md -/
def recipe_34fadc2fa767 : Recipe := {
  id := "34fadc2fa767"
  title := "酱排骨"
  category := "meat"
  sourcePath := "dishes/meat_dish/酱排骨/酱排骨.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨",
    "五香粉",
    "料酒",
    "食用油",
    "白砂糖",
    "老抽",
    "生抽",
    "蚝油",
    "小米椒",
    "蒜",
    "姜"
  ]
  steps := [
    { index := 1, instruction := "起锅烧热水，放入排骨、姜片、料酒，煮开后用勺子舀去白色油沫，2-3 分钟后出锅" },
    { index := 2, instruction := "冷水清洗排骨，清洗 2-3 遍" },
    { index := 3, instruction := "小火起锅，加入食用油，加入白砂糖 ，轻轻搅拌到糖水变成黄色" },
    { index := 4, instruction := "倒入排骨翻炒 30 S 后，加入生抽、蚝油、五香粉、蒜、小米椒后翻炒 30 S 后，加入清水没过排骨" },
    { index := 5, instruction := "大火煮 30 分钟，加入老抽上色，再煮 10 分钟" },
    { index := 6, instruction := "起锅摆盘" }
  ]
}

theorem recipe_34fadc2fa767_ingredients_nonempty :
    recipe_34fadc2fa767.ingredients.isEmpty = false := by decide

theorem recipe_34fadc2fa767_steps_nonempty :
    recipe_34fadc2fa767.steps.isEmpty = false := by decide

theorem recipe_34fadc2fa767_step_count :
    recipe_34fadc2fa767.steps.length = 6 := by decide

theorem recipe_34fadc2fa767_steps_ordered :
    orderedFrom 1 recipe_34fadc2fa767.steps = true := by decide

theorem recipe_34fadc2fa767_executes_to_terminal :
    executesToTerminal recipe_34fadc2fa767 = true := by decide

theorem recipe_34fadc2fa767_kernel_certificate :
    kernelCertified recipe_34fadc2fa767 = true := by decide

end LeanToCook.SourceCatalog
