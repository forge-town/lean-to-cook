/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 卤菜 · dishes/meat_dish/卤菜/卤菜.md -/
def recipe_ad28ce802c92 : Recipe := {
  id := "ad28ce802c92"
  title := "卤菜"
  category := "meat"
  sourcePath := "dishes/meat_dish/卤菜/卤菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "卤料包（超市即可购买）",
    "黄豆酱",
    "豆瓣酱",
    "蚝油",
    "南腐乳",
    "洋葱",
    "生姜",
    "大蒜",
    "干辣椒",
    "生抽",
    "老抽",
    "盐",
    "白糖（最好是黄冰糖，用于熬糖色）",
    "啤酒",
    "牛腱子（或其他肉类）",
    "高压锅",
    "滤网"
  ]
  steps := [
    { index := 1, instruction := "牛腱子提前浸泡在冷水中 3 小时以上，去除血水" },
    { index := 2, instruction := "准备糖色：锅中加入 30g 白糖，小火加热至糖完全融化并呈现棕褐色，加入 150ml 热水，搅拌均匀备用" },
    { index := 3, instruction := "将洋葱切块，生姜和大蒜拍碎，干辣椒掰断备用" },
    { index := 4, instruction := "在锅中加入足量的水，放入卤料包、洋葱、生姜、大蒜、干辣椒，大火烧开" },
    { index := 5, instruction := "加入黄豆酱、豆瓣酱、蚝油和南腐乳各 15ml，搅拌均匀" },
    { index := 6, instruction := "倒入准备好的糖色，混合均匀" },
    { index := 7, instruction := "加入生抽 120ml 和老抽 60ml，搅拌均匀" },
    { index := 8, instruction := "加入 10-15g 盐调味" },
    { index := 9, instruction := "倒入 1 罐啤酒(330ml)，再次烧开" },
    { index := 10, instruction := "牛腱子放入锅中焯水 2-3 分钟，捞出并用热水冲洗干净表面的浮沫" },
    { index := 11, instruction := "将焯水后的牛腱子放入已烧开的卤水中，确保卤水没过所有肉类" },
    { index := 12, instruction := "盖上高压锅盖，上汽后继续烹饪 25-30 分钟" },
    { index := 13, instruction := "烹饪完成后，不要开盖保温，自然冷却并浸泡一晚上（这样会更入味）" },
    { index := 14, instruction := "将卤好的肉取出放入冰箱冷藏，使其成型" },
    { index := 15, instruction := "食用前取出切片，可直接食用或凉拌" },
    { index := 16, instruction := "卤水重复使用方法：每次卤完肉后，将卤水过滤，去除所有固体内容物，重新烧开杀菌，冷却后可冷藏或冷冻保存。使用时按原配方比例重新添加调味料。（加水量根据卤水使用情况而定）" },
    { index := 17, instruction := "卤水保存得当可以使用很长时间，且越老越香。" },
    { index := 18, instruction := "重要提示：如卤制素菜，必须另取一部分卤水，单独使用，并且卤制完素菜的卤水不可重复使用。" },
    { index := 19, instruction := "将蒜末、葱花、白芝麻、辣椒粉按 1:1:1:1 的比例混合，依个人口味加小米辣，热植物油中加入少量芝麻油或藤椒油，分次泼在调料上，再加入生抽、醋、蚝油各 10ml，5ml 糖，味精/鸡精，最后 15ml 卤汤混合均匀。" },
    { index := 20, instruction := "凉拌时可搭配拍黄瓜、木耳、油炸花生米、香菜等配菜。" }
  ]
}

theorem recipe_ad28ce802c92_ingredients_nonempty :
    recipe_ad28ce802c92.ingredients.isEmpty = false := by decide

theorem recipe_ad28ce802c92_steps_nonempty :
    recipe_ad28ce802c92.steps.isEmpty = false := by decide

theorem recipe_ad28ce802c92_step_count :
    recipe_ad28ce802c92.steps.length = 20 := by decide

theorem recipe_ad28ce802c92_steps_ordered :
    orderedFrom 1 recipe_ad28ce802c92.steps = true := by decide

theorem recipe_ad28ce802c92_executes_to_terminal :
    executesToTerminal recipe_ad28ce802c92 = true := by decide

theorem recipe_ad28ce802c92_kernel_certificate :
    kernelCertified recipe_ad28ce802c92 = true := by decide

end LeanToCook.SourceCatalog
