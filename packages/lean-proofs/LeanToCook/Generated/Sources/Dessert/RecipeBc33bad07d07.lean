/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 芋泥雪媚娘 · dishes/dessert/芋泥雪媚娘/芋泥雪媚娘.md -/
def recipe_bc33bad07d07 : Recipe := {
  id := "bc33bad07d07"
  title := "芋泥雪媚娘"
  category := "dessert"
  sourcePath := "dishes/dessert/芋泥雪媚娘/芋泥雪媚娘.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "荔浦芋头（电商平台购买即可，实惠新鲜）",
    "紫薯粉",
    "牛奶",
    "糯米粉",
    "玉米淀粉",
    "黄油",
    "淡奶油",
    "白砂糖",
    "料理搅拌机（电动打蛋器也可以）",
    "筛网",
    "保鲜膜",
    "白砂糖"
  ]
  steps := [
    { index := 1, instruction := "芋头切块，大火煮熟至软（40 分钟即可），全部放入料理机" },
    { index := 2, instruction := "向内加入 30g 牛奶，25g 淡奶油，将其打成泥状" },
    { index := 3, instruction := "再向内加入 3g 紫薯粉，18g 白砂糖，继续搅拌打成细腻芋泥" },
    { index := 4, instruction := "取出另一个碗，加入全部糯米粉 b，22g 玉米淀粉，135g 牛奶，50g 白砂糖，混匀并过筛一遍，保鲜膜盖上并扎小洞，中火蒸半个小时" },
    { index := 5, instruction := "在蒸的过程中，将糯米粉 a 放入平底锅小火翻炒至微微发黄（即炒熟），作为手粉备用" },
    { index := 6, instruction := "将中火蒸完半小时的糯米牛奶混合物（果冻状）趁热加入黄油 30g，将黄油揉至面团完全吸收，然后放冰箱冷藏一小时" },
    { index := 7, instruction := "取出另一只碗，加入 120g 淡奶油，8g 白砂糖，打发至有纹路，装进裱花袋备用" },
    { index := 8, instruction := "取出冷藏后的面团，搓揉 5 分钟，分成 30g 一个，均匀撒上 2g 手粉防粘，擀成圆形，先挤上 5g 裱花奶油，然后放上 30g 芋泥，最后将面饼像包包子一样包起来（可以减去多余的皮）" },
    { index := 9, instruction := "包好后再均匀撒 2g 手粉防粘" },
    { index := 10, instruction := "重复以上两步直至原材料用光" }
  ]
}

theorem recipe_bc33bad07d07_ingredients_nonempty :
    recipe_bc33bad07d07.ingredients.isEmpty = false := by decide

theorem recipe_bc33bad07d07_steps_nonempty :
    recipe_bc33bad07d07.steps.isEmpty = false := by decide

theorem recipe_bc33bad07d07_step_count :
    recipe_bc33bad07d07.steps.length = 10 := by decide

theorem recipe_bc33bad07d07_steps_ordered :
    orderedFrom 1 recipe_bc33bad07d07.steps = true := by decide

theorem recipe_bc33bad07d07_executes_to_terminal :
    executesToTerminal recipe_bc33bad07d07 = true := by decide

theorem recipe_bc33bad07d07_kernel_certificate :
    kernelCertified recipe_bc33bad07d07 = true := by decide

end LeanToCook.SourceCatalog
