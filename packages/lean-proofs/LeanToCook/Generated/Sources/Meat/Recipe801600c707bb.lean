/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 尖叫牛蛙 · dishes/meat_dish/尖叫牛蛙/尖叫牛蛙.md -/
def recipe_801600c707bb : Recipe := {
  id := "801600c707bb"
  title := "尖叫牛蛙"
  category := "meat"
  sourcePath := "dishes/meat_dish/尖叫牛蛙/尖叫牛蛙.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛蛙肉",
    "泡姜",
    "泡椒",
    "野山椒（也可以用干红辣椒替代）",
    "青红辣椒",
    "大蒜",
    "豆瓣酱（推荐郫县豆瓣）",
    "盐巴",
    "胡椒粉",
    "生粉（干淀粉也可）",
    "啤酒（推荐雪花）",
    "料酒",
    "藤椒油（可选）",
    "猪油（可选）",
    "葱花"
  ]
  steps := [
    { index := 1, instruction := "牛蛙肉洗净后控干水分，加入 10 克以上的盐巴和 50ml 以上的啤酒，用手抓 5 分钟，去除牛蛙肉的腥味" },
    { index := 2, instruction := "然后对着清水冲洗，直至不再流出血水和杂质，控干水分，放到合适的器皿中，准备腌制" },
    { index := 3, instruction := "加入 5 克盐，30 克生粉，10ml 料酒，5 克胡椒粉，用手抓均匀，腌制 5-10 分钟" },
    { index := 4, instruction := "将泡姜 泡椒 野山椒 切丝或者片（根据自己刀工选择），青红辣椒切成圈圈 大蒜拨开即可" },
    { index := 5, instruction := "起锅烧热，加入 200ml 食用油（锅底比较平的可以再加 100ml）,烧至 6 成油温（有小气泡出现），将腌制好的牛蛙倒入，快速过油炸制，10 秒钟后捞出（不能超时太多，否则会导致蛙肉老柴）" },
    { index := 6, instruction := "捞出蛙肉后，控油，并将锅中的热油倒出到碗中，保留 30ml,加入 20ml 猪油（如果没有，则在锅中保留总共 50ml 食用油）" },
    { index := 7, instruction := "待油温 6 成热，加入泡姜、泡椒、野山椒、大蒜，超出香味，加入豆瓣酱 20 克，中火翻炒至出红油（时间控制在 30 秒），倒入 400ml 啤酒，" },
    { index := 8, instruction := "然后倒入炸过的牛蛙肉，用勺子推着翻，不要用力搅拌，加入 5 克胡椒粉，加入 5ml 藤椒油，中火慢焖 3 分钟" },
    { index := 9, instruction := "加大火力，大火收汁半分钟，加入青红辣椒圈，再煮 10 秒准备起锅" },
    { index := 10, instruction := "盛到盆里，撒上葱花，可以开动了！" }
  ]
}

theorem recipe_801600c707bb_ingredients_nonempty :
    recipe_801600c707bb.ingredients.isEmpty = false := by decide

theorem recipe_801600c707bb_steps_nonempty :
    recipe_801600c707bb.steps.isEmpty = false := by decide

theorem recipe_801600c707bb_step_count :
    recipe_801600c707bb.steps.length = 10 := by decide

theorem recipe_801600c707bb_steps_ordered :
    orderedFrom 1 recipe_801600c707bb.steps = true := by decide

theorem recipe_801600c707bb_executes_to_terminal :
    executesToTerminal recipe_801600c707bb = true := by decide

theorem recipe_801600c707bb_kernel_certificate :
    kernelCertified recipe_801600c707bb = true := by decide

end LeanToCook.SourceCatalog
