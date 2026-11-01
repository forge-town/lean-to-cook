/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香煎翘嘴鱼 · dishes/aquatic/香煎翘嘴鱼/香煎翘嘴鱼.md -/
def recipe_c9b72f0464b3 : Recipe := {
  id := "c9b72f0464b3"
  title := "香煎翘嘴鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/香煎翘嘴鱼/香煎翘嘴鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "翘嘴鱼（肉食性鱼类，肉细腻，口感好）",
    "姜",
    "葱",
    "蒜",
    "青椒",
    "香菜",
    "老抽",
    "白糖",
    "豆瓣酱",
    "料酒",
    "生抽",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "鱼开背杀好（让卖鱼的杀好，千万不要剖腹杀鱼，切记是开背），清洗干净" },
    { index := 2, instruction := "鱼表面用盐涂抹均匀，倒入料酒约 80ml,姜末 20g，放入冰箱保鲜层进行腌制 1-2 天" },
    { index := 3, instruction := "取出腌制好的鱼，用绳挂起晾晒至半干（约 1-2 天，具体时间需结合气温与阳光）" },
    { index := 4, instruction := "食用前请将鱼用清水清洗，沥干水分（防止水遇油飞溅）" },
    { index := 5, instruction := "开大火将锅烧热，迅速改小火，锅中放油，尽量保持整个锅表面有油，将鱼沿锅边划入锅内（先煎鱼背面）" },
    { index := 6, instruction := "鱼入锅后（和翻面后），不要着急移动鱼的位置（此时容易破皮），煎约 30 秒后，尝试晃动锅" },
    { index := 7, instruction := "背面煎约 1 分钟后，翻面煎约 1-2 分钟，煎至两面金黄" },
    { index := 8, instruction := "等两面都煎好时，把鱼推向锅边一点，留点空间放入豆瓣酱炒香味，放入姜蒜，" },
    { index := 9, instruction := "炒出佐料香味后，加入料酒，生抽，老抽，倒入热水，水量和鱼平齐或者少点" },
    { index := 10, instruction := "此时改中大火，煮 5-10 分钟，后放入青椒断，白糖，鸡精，十三香，陈醋" },
    { index := 11, instruction := "改小火 2-5 分钟，放入葱，香菜，即可出锅" }
  ]
}

theorem recipe_c9b72f0464b3_ingredients_nonempty :
    recipe_c9b72f0464b3.ingredients.isEmpty = false := by decide

theorem recipe_c9b72f0464b3_steps_nonempty :
    recipe_c9b72f0464b3.steps.isEmpty = false := by decide

theorem recipe_c9b72f0464b3_step_count :
    recipe_c9b72f0464b3.steps.length = 11 := by decide

theorem recipe_c9b72f0464b3_steps_ordered :
    orderedFrom 1 recipe_c9b72f0464b3.steps = true := by decide

theorem recipe_c9b72f0464b3_executes_to_terminal :
    executesToTerminal recipe_c9b72f0464b3 = true := by decide

theorem recipe_c9b72f0464b3_kernel_certificate :
    kernelCertified recipe_c9b72f0464b3 = true := by decide

end LeanToCook.SourceCatalog
