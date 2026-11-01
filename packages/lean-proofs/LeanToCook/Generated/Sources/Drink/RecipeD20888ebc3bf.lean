/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酸梅汤 · dishes/drink/酸梅汤/酸梅汤.md -/
def recipe_d20888ebc3bf : Recipe := {
  id := "d20888ebc3bf"
  title := "酸梅汤"
  category := "drink"
  sourcePath := "dishes/drink/酸梅汤/酸梅汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "水",
    "乌枣",
    "乌梅",
    "山楂片（生）",
    "黄冰糖",
    "甘草",
    "陈皮",
    "红豆蔻",
    "干桂花"
  ]
  steps := [
    { index := 1, instruction := "冲洗材料（干桂花和冰糖除外）， 1.5 升水常温浸泡两小时以上（干桂花和冰糖除外）" },
    { index := 2, instruction := "开中大火煮沸，盖盖，转小火煮 40 分钟，为头煎" },
    { index := 3, instruction := "将冰糖放入盆内，再将沥好用材的头汤趁热倒入，搅拌至冰糖融化。" },
    { index := 4, instruction := "药材重新装回锅内再 600 毫升的水，开大火煮沸，盖盖，转中火，再煮 20 分钟为二煎" },
    { index := 5, instruction := "最后将二煎和冰糖水趁热混合为成品。在成品 60-70℃加入干桂花（不要超过 80℃）加盖晾凉再放入冰箱冷藏 3 小时以上。" },
    { index := 6, instruction := "饮用时记得将干桂花沥出。如饮茶般细啜，冰凉振齿，酸醒人、甜适度，滋味丰满而悠长" }
  ]
}

theorem recipe_d20888ebc3bf_ingredients_nonempty :
    recipe_d20888ebc3bf.ingredients.isEmpty = false := by decide

theorem recipe_d20888ebc3bf_steps_nonempty :
    recipe_d20888ebc3bf.steps.isEmpty = false := by decide

theorem recipe_d20888ebc3bf_step_count :
    recipe_d20888ebc3bf.steps.length = 6 := by decide

theorem recipe_d20888ebc3bf_steps_ordered :
    orderedFrom 1 recipe_d20888ebc3bf.steps = true := by decide

theorem recipe_d20888ebc3bf_executes_to_terminal :
    executesToTerminal recipe_d20888ebc3bf = true := by decide

theorem recipe_d20888ebc3bf_kernel_certificate :
    kernelCertified recipe_d20888ebc3bf = true := by decide

end LeanToCook.SourceCatalog
