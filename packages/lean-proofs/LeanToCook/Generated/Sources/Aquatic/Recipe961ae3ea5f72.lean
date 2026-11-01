/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧鱼头 · dishes/aquatic/红烧鱼头.md -/
def recipe_961ae3ea5f72 : Recipe := {
  id := "961ae3ea5f72"
  title := "红烧鱼头"
  category := "aquatic"
  sourcePath := "dishes/aquatic/红烧鱼头.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "注：如果有可能，尽量另准备一把菜刀，超市或市场上均有廉价且刀片更厚的菜刀，刀片厚度在 5-7mm 为最佳。",
    "大葱、姜、大蒜、香菜、美人椒",
    "油、盐、鸡精、生抽、老抽、陈醋、黑胡椒粉、料酒",
    "八角、干辣椒",
    "鱼头一个",
    "注：市场直接贩卖的鱼头一般分为两种：白鲢、花鲢。前者价格便宜，后者价格略贵，但口感也更佳！"
  ]
  steps := [
    { index := 1, instruction := "葱、姜、蒜、香菜、美人椒分别清洗干净。" },
    { index := 2, instruction := "干辣椒与八角稍微冲洗即可。" },
    { index := 3, instruction := "大葱切两半。后半段大葱（葱白处）切段，每段长度约 4cm。前半段（葱叶处）先切段，再将每段劈为四瓣。" },
    { index := 4, instruction := "姜切片，每片厚度约 3mm。" },
    { index := 5, instruction := "大蒜拍碎。" },
    { index := 6, instruction := "拿出两棵香菜去根，切为 1.5cm 香菜碎。" },
    { index := 7, instruction := "将美人椒切为厚度为 3mm 的辣椒圈。" },
    { index := 8, instruction := "干辣椒切四段。" },
    { index := 9, instruction := "注：下文所述的鱼身是购买鱼头时所附带的鱼肉。" },
    { index := 10, instruction := "将鱼头去鳞，清洗鱼头处未被清理干净的内脏。" },
    { index := 11, instruction := "剁去鱼鳍、清理鱼鳃。" },
    { index := 12, instruction := "将鱼头下巴与鱼身连接的地方剁开，鱼身剁块，鱼头剁成四/六瓣。" },
    { index := 13, instruction := "将剁好的鱼头进行清洗，最好洗掉鱼块上滞留的血水。" },
    { index := 14, instruction := "将清洗好的鱼块放入盆中，加入 5g 盐、10g 生抽、10g 料酒。放入葱（前半段切碎的那个）、1/3 姜片。将其拌匀，静置 1-2 小时。" },
    { index := 15, instruction := "加入 30ml 油，等待锅热..." },
    { index := 16, instruction := "油热，将锅关至小火" },
    { index := 17, instruction := "放入姜片，慢慢翻炒，以姜片中的大部分汁水被炒出，以金黄色为准。" },
    { index := 18, instruction := "放入葱段，翻炒至葱段略显发白。" },
    { index := 19, instruction := "放入蒜碎、八角、干辣椒，翻炒 5 秒。" },
    { index := 20, instruction := "将腌制好的鱼头倒入锅中，翻炒 2-3 分钟。" },
    { index := 21, instruction := "倒入 500ml 清水，加入 2g 盐、3g 鸡精、5g 生抽、3g 老抽、5g 料酒、2g 黑胡椒粉、3g 陈醋。" },
    { index := 22, instruction := "将两棵香菜放入锅中，盖上锅盖。" },
    { index := 23, instruction := "调至大火，将水烧开。" },
    { index := 24, instruction := "调至中火，慢焖入味。" },
    { index := 25, instruction := "当汤汁减少一半时，打开锅盖。" },
    { index := 26, instruction := "调至大火收汁，汤汁剩余 1/3 时，关火盛至小盆中。" },
    { index := 27, instruction := "注：将锅中的汤汁均匀淋到鱼头上，盛盘时可以将锅中煮的香菜放入小盆底部，这样能让成品菜好看又好吃。" },
    { index := 28, instruction := "将香菜放至已经盛出的鱼头上，把切好的美人椒圈放在香菜之上。" },
    { index := 29, instruction := "色香味俱全的红烧鱼头出炉！" }
  ]
}

theorem recipe_961ae3ea5f72_ingredients_nonempty :
    recipe_961ae3ea5f72.ingredients.isEmpty = false := by decide

theorem recipe_961ae3ea5f72_steps_nonempty :
    recipe_961ae3ea5f72.steps.isEmpty = false := by decide

theorem recipe_961ae3ea5f72_step_count :
    recipe_961ae3ea5f72.steps.length = 29 := by decide

theorem recipe_961ae3ea5f72_steps_ordered :
    orderedFrom 1 recipe_961ae3ea5f72.steps = true := by decide

theorem recipe_961ae3ea5f72_executes_to_terminal :
    executesToTerminal recipe_961ae3ea5f72 = true := by decide

theorem recipe_961ae3ea5f72_kernel_certificate :
    kernelCertified recipe_961ae3ea5f72 = true := by decide

end LeanToCook.SourceCatalog
