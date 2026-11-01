/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烤鱼 · dishes/aquatic/混合烤鱼/烤鱼.md -/
def recipe_711ab5d8b4ee : Recipe := {
  id := "711ab5d8b4ee"
  title := "烤鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/混合烤鱼/烤鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "草鱼（农贸市场或者超市让店家杀掉，去除不要的器官）",
    "大葱",
    "料酒",
    "白胡椒粉",
    "食用盐",
    "大蒜",
    "桂皮",
    "八角",
    "香叶",
    "青花椒",
    "干辣椒段",
    "灯笼椒",
    "火锅底料（随意）",
    "千张",
    "绿豆芽",
    "洋葱",
    "豆瓣酱",
    "芹菜段",
    "熟花生米",
    "白芝麻",
    "香菜（放更好吃，根据个人口味可放可不放）"
  ]
  steps := [
    { index := 1, instruction := "草鱼（一般 3 斤 ）从背部切开，两面沿着鱼的背部往下划几刀，不要划到鱼肚皮，不然不易定型" },
    { index := 2, instruction := "把鱼放到容器中，加入料酒，10g 白胡椒粉，5g 食盐抹匀腌制二十分钟入味。" },
    { index := 3, instruction := "把半根大葱切成一块一块，大蒜粒中间切开，和八角香叶桂皮放在一个容器中" },
    { index := 4, instruction := "干辣椒段中间一分为二切开并和灯笼椒装在一个容器中" },
    { index := 5, instruction := "芹菜切小段" },
    { index := 6, instruction := "豆芽焯水" },
    { index := 7, instruction := "千张焯水切成丝" },
    { index := 8, instruction := "洋葱切成丝。" },
    { index := 9, instruction := "烤制鱼" },
    { index := 10, instruction := "锅中撒上 20ml 食用油，等到油热后，把大葱大蒜八角香叶倒入炒香" },
    { index := 11, instruction := "加上一包火锅底料的一半和 15-20g 豆瓣酱，炒出红油" },
    { index := 12, instruction := "加入 5g 白糖，10g 食盐，5ml 生抽调味，倒入和食材齐平的清水煮开" },
    { index := 13, instruction := "依次下入芹菜段，豆芽，千张丝，不用煮熟，稍微烫一下后铺上洋葱丝，放上烤鱼" },
    { index := 14, instruction := "加入干辣椒，灯笼椒，青花椒" },
    { index := 15, instruction := "另一个锅烧油，油热后浇在刚加入的辣椒上面激发出香味" },
    { index := 16, instruction := "最后撒上熟花生米，葱花，白芝麻，香菜" },
    { index := 17, instruction := "煮 5-6 分钟，美味即成。" }
  ]
}

theorem recipe_711ab5d8b4ee_ingredients_nonempty :
    recipe_711ab5d8b4ee.ingredients.isEmpty = false := by decide

theorem recipe_711ab5d8b4ee_steps_nonempty :
    recipe_711ab5d8b4ee.steps.isEmpty = false := by decide

theorem recipe_711ab5d8b4ee_step_count :
    recipe_711ab5d8b4ee.steps.length = 17 := by decide

theorem recipe_711ab5d8b4ee_steps_ordered :
    orderedFrom 1 recipe_711ab5d8b4ee.steps = true := by decide

theorem recipe_711ab5d8b4ee_executes_to_terminal :
    executesToTerminal recipe_711ab5d8b4ee = true := by decide

theorem recipe_711ab5d8b4ee_kernel_certificate :
    kernelCertified recipe_711ab5d8b4ee = true := by decide

end LeanToCook.SourceCatalog
