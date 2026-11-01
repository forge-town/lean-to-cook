/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 粉蒸肉 · dishes/meat_dish/粉蒸肉.md -/
def recipe_eaaaaa89ddc3 : Recipe := {
  id := "eaaaaa89ddc3"
  title := "粉蒸肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/粉蒸肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉 500g（肥瘦相间）",
    "蒸肉米粉 100g（推荐使用李锦记或自制）",
    "生抽 15ml",
    "老抽 10ml",
    "料酒 15ml",
    "郫县豆瓣酱 10g（可选）",
    "姜末 10g",
    "蒜末 10g",
    "白砂糖 5g",
    "土豆 300g（或南瓜 300g，作为垫底食材）",
    "清水（蒸锅用）2000ml"
  ]
  steps := [
    { index := 1, instruction := "将五花肉洗净，切成长约 5cm、宽约 3cm、厚度约 0.5cm 的肉片" },
    { index := 2, instruction := "将姜、蒜切成颗粒直径不大于 1mm 的细末" },
    { index := 3, instruction := "取一大碗，放入切好的五花肉、15ml 生抽、10ml 老抽、15ml 料酒、10g 郫县豆瓣酱、10g 姜末、10g 蒜末、5g 白砂糖" },
    { index := 4, instruction := "用筷子搅拌均匀后，盖上保鲜膜，室温(20°C - 25°C)静置腌制 30 分钟" },
    { index := 5, instruction := "腌制完成后，加入 100g 蒸肉米粉，继续翻拌 2 分钟，确保每片肉都均匀裹粉" },
    { index := 6, instruction := "土豆去皮，切片厚度控制在 0.8cm，片面积约为 5cm x 5cm，重量控制在 300g" },
    { index := 7, instruction := "在直径 20cm 的深碗底部铺满土豆片，尽量无重叠" },
    { index := 8, instruction := "将拌好粉的五花肉均匀铺在土豆片上，压实" },
    { index := 9, instruction := "蒸锅中加入 2000ml 清水，开火加热至水面持续冒泡(100°C)" },
    { index := 10, instruction := "将装好食材的碗放入蒸锅内，盖好锅盖" },
    { index := 11, instruction := "保持中火蒸 60 分钟（火力保持在可持续沸腾的程度，约 600W 热功率）" },
    { index := 12, instruction := "时间结束后，用筷子插入肉块中央，若能轻松穿透并无明显阻力，则表明蒸熟" },
    { index := 13, instruction := "若未达到此状态，则继续加热 10 - 15 分钟，直至肉质软烂，油脂渗出" },
    { index := 14, instruction := "取出盛盘，即可食用" }
  ]
}

theorem recipe_eaaaaa89ddc3_ingredients_nonempty :
    recipe_eaaaaa89ddc3.ingredients.isEmpty = false := by decide

theorem recipe_eaaaaa89ddc3_steps_nonempty :
    recipe_eaaaaa89ddc3.steps.isEmpty = false := by decide

theorem recipe_eaaaaa89ddc3_step_count :
    recipe_eaaaaa89ddc3.steps.length = 14 := by decide

theorem recipe_eaaaaa89ddc3_steps_ordered :
    orderedFrom 1 recipe_eaaaaa89ddc3.steps = true := by decide

theorem recipe_eaaaaa89ddc3_executes_to_terminal :
    executesToTerminal recipe_eaaaaa89ddc3 = true := by decide

theorem recipe_eaaaaa89ddc3_kernel_certificate :
    kernelCertified recipe_eaaaaa89ddc3 = true := by decide

end LeanToCook.SourceCatalog
