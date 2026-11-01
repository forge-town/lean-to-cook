/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 糖醋排骨 · dishes/meat_dish/糖醋排骨/糖醋排骨.md -/
def recipe_39425dec3866 : Recipe := {
  id := "39425dec3866"
  title := "糖醋排骨"
  category := "meat"
  sourcePath := "dishes/meat_dish/糖醋排骨/糖醋排骨.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨",
    "白砂糖",
    "食用油",
    "生抽",
    "蚝油",
    "老抽",
    "鸡精",
    "姜片",
    "芝麻",
    "番茄酱",
    "香醋",
    "五香粉"
  ]
  steps := [
    { index := 1, instruction := "排骨与姜片放入冷水中，大火加热至水沸腾、出现大量泡沫后转中火，待水持续沸腾时再转小火焯水 2–3 分钟，捞出备用。" },
    { index := 2, instruction := "用开水反复清洗排骨 2–3 遍，确保彻底去除血沫。" },
    { index := 3, instruction := "在锅中倒入足够量的食用油进行深炸（油量依据锅具大小而定，建议约 300 ml 供一般家庭使用），待油温升至约 170°C 后，下排骨炸制 3–5 分钟，直至表面略呈金黄色，捞出控油。" },
    { index := 4, instruction := "另取干净锅，置于小火上加热 50 ml 热水，加入白砂糖 30 g，轻轻搅拌直至糖完全溶解，并略呈淡黄色。此步骤的重点在于观察糖溶解情况，无需过分依赖颜色变化。" },
    { index := 5, instruction := "将炸好的排骨倒入炒制糖水的锅中，迅速翻炒 30 秒后，依次加入香醋 5 ml、生抽 5 ml、蚝油 5 ml、鸡精 2 g、番茄酱 10 g、五香粉 0.5 g，再次翻炒 30 秒，使调料均匀裹覆排骨，然后加入开水至刚好没过排骨。" },
    { index := 6, instruction := "用大火将锅中液体煮沸后，加入老抽 5 ml 进行上色，并快速收汁；若排骨块较大，可转小火焖煮 5–10 分钟以便更好地入味，切勿采用中火长时间炖煮 20 分钟，以免损伤口感。" },
    { index := 7, instruction := "起锅装盘，撒上芝麻 2 g，即可享用。" }
  ]
}

theorem recipe_39425dec3866_ingredients_nonempty :
    recipe_39425dec3866.ingredients.isEmpty = false := by decide

theorem recipe_39425dec3866_steps_nonempty :
    recipe_39425dec3866.steps.isEmpty = false := by decide

theorem recipe_39425dec3866_step_count :
    recipe_39425dec3866.steps.length = 7 := by decide

theorem recipe_39425dec3866_steps_ordered :
    orderedFrom 1 recipe_39425dec3866.steps = true := by decide

theorem recipe_39425dec3866_executes_to_terminal :
    executesToTerminal recipe_39425dec3866 = true := by decide

theorem recipe_39425dec3866_kernel_certificate :
    kernelCertified recipe_39425dec3866 = true := by decide

end LeanToCook.SourceCatalog
