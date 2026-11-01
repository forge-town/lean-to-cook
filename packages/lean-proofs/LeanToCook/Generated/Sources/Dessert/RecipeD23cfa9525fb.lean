/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 胡萝卜甜糕 · dishes/dessert/胡萝卜甜糕.md -/
def recipe_d23cfa9525fb : Recipe := {
  id := "d23cfa9525fb"
  title := "胡萝卜甜糕"
  category := "dessert"
  sourcePath := "dishes/dessert/胡萝卜甜糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "胡萝卜（建议选用红色胡萝卜）",
    "全脂牛奶",
    "糖",
    "酥油(Ghee)— 可用黄油替代",
    "小豆蔻粉(Cardamom Powder)",
    "腰果",
    "杏仁",
    "葡萄干",
    "刨丝器",
    "厚底锅"
  ]
  steps := [
    { index := 1, instruction := "将胡萝卜去皮，用刨丝器刨成细丝" },
    { index := 2, instruction := "在厚底锅中倒入酥油 20g（一半量），中火加热融化" },
    { index := 3, instruction := "放入胡萝卜丝，翻炒 3-5 分钟，直至胡萝卜丝变软且散发香味" },
    { index := 4, instruction := "倒入全脂牛奶 500ml，搅拌均匀" },
    { index := 5, instruction := "大火煮沸后转中小火，保持缓慢沸腾状态" },
    { index := 6, instruction := "持续翻搅 25-30 分钟，直至牛奶几乎完全被胡萝卜吸收蒸发（这是最关键的步骤，需要耐心且不断搅拌防止糊底）" },
    { index := 7, instruction := "当锅中几乎没有液体时，加入糖 80g，搅拌均匀" },
    { index := 8, instruction := "加糖后会重新出水，继续中小火翻炒 5-8 分钟，直至水分再次蒸发" },
    { index := 9, instruction := "加入剩余的酥油 20g 和小豆蔻粉 3g，翻炒 2 分钟" },
    { index := 10, instruction := "在另一个小锅中，用少量酥油将腰果、杏仁片和葡萄干分别炸至金黄（约 1 分钟），注意葡萄干会膨胀" },
    { index := 11, instruction := "将炸好的坚果和葡萄干的一半拌入胡萝卜甜糕中" },
    { index := 12, instruction := "盛盘，将剩余坚果和葡萄干撒在表面作为装饰" }
  ]
}

theorem recipe_d23cfa9525fb_ingredients_nonempty :
    recipe_d23cfa9525fb.ingredients.isEmpty = false := by decide

theorem recipe_d23cfa9525fb_steps_nonempty :
    recipe_d23cfa9525fb.steps.isEmpty = false := by decide

theorem recipe_d23cfa9525fb_step_count :
    recipe_d23cfa9525fb.steps.length = 12 := by decide

theorem recipe_d23cfa9525fb_steps_ordered :
    orderedFrom 1 recipe_d23cfa9525fb.steps = true := by decide

theorem recipe_d23cfa9525fb_executes_to_terminal :
    executesToTerminal recipe_d23cfa9525fb = true := by decide

theorem recipe_d23cfa9525fb_kernel_certificate :
    kernelCertified recipe_d23cfa9525fb = true := by decide

end LeanToCook.SourceCatalog
