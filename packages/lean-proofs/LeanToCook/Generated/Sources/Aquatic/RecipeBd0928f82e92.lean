/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 阳朔啤酒鱼 · dishes/aquatic/阳朔啤酒鱼/阳朔啤酒鱼.md -/
def recipe_bd0928f82e92 : Recipe := {
  id := "bd0928f82e92"
  title := "阳朔啤酒鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/阳朔啤酒鱼/阳朔啤酒鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "剑骨鱼或鲤鱼（约 1.5 斤，让店家处理内脏，但不要刮鱼鳞）",
    "漓泉啤酒（一瓶，约 330ml，桂林本地啤酒，最正宗）",
    "番茄（2 个）",
    "青椒（2 个）",
    "红椒（1 个）",
    "大蒜（5-6 瓣）",
    "生姜（1 块）",
    "葱（2 根）",
    "桂林辣椒酱",
    "料酒",
    "生抽",
    "老抽",
    "白糖",
    "食盐",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "鱼处理好内脏，保留鱼鳞，清洗干净，从腹部剖开成两半（背部相连），用 15ml 料酒、姜片、食盐 3g 腌制 15 分钟" },
    { index := 2, instruction := "番茄切块，青椒红椒切块，大蒜拍碎，生姜切片，葱切段（葱白葱叶分开）" },
    { index := 3, instruction := "用姜片擦拭锅底，热锅后倒入 30ml 食用油，油热后放入鱼（鱼皮朝下），煎至两面金黄、鱼鳞酥脆，盛出备用" },
    { index := 4, instruction := "锅中留底油，放入葱白、姜片、蒜瓣爆香" },
    { index := 5, instruction := "加入 15g 桂林辣椒酱，炒出红油" },
    { index := 6, instruction := "放入番茄块，翻炒至番茄出汁变软" },
    { index := 7, instruction := "倒入整瓶啤酒，加入 15ml 生抽、5ml 老抽、5g 白糖、5g 食盐，搅拌均匀" },
    { index := 8, instruction := "放入煎好的鱼，大火烧开后转中小火，盖上锅盖焖煮 15-20 分钟" },
    { index := 9, instruction := "开盖，放入青椒红椒块，继续煮 3-5 分钟" },
    { index := 10, instruction := "大火收汁至汤汁浓稠，撒上葱叶段，出锅装盘" }
  ]
}

theorem recipe_bd0928f82e92_ingredients_nonempty :
    recipe_bd0928f82e92.ingredients.isEmpty = false := by decide

theorem recipe_bd0928f82e92_steps_nonempty :
    recipe_bd0928f82e92.steps.isEmpty = false := by decide

theorem recipe_bd0928f82e92_step_count :
    recipe_bd0928f82e92.steps.length = 10 := by decide

theorem recipe_bd0928f82e92_steps_ordered :
    orderedFrom 1 recipe_bd0928f82e92.steps = true := by decide

theorem recipe_bd0928f82e92_executes_to_terminal :
    executesToTerminal recipe_bd0928f82e92 = true := by decide

theorem recipe_bd0928f82e92_kernel_certificate :
    kernelCertified recipe_bd0928f82e92 = true := by decide

end LeanToCook.SourceCatalog
