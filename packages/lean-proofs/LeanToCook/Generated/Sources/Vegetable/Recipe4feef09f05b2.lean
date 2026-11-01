/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炸洋葱花 · dishes/vegetable_dish/炸洋葱花/炸洋葱花.md -/
def recipe_4feef09f05b2 : Recipe := {
  id := "4feef09f05b2"
  title := "炸洋葱花"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/炸洋葱花/炸洋葱花.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黄洋葱（即甜洋葱，选直径 9cm 以上的大颗，瓣厚、甜度高，是这道菜的关键）",
    "鸡蛋",
    "低筋面粉",
    "玉米淀粉",
    "辣椒粉（可选项，不吃辣可省略）",
    "黑胡椒粉",
    "食盐",
    "食用油（用于油炸，需能没过整颗洋葱）",
    "深锅（选直径 16cm 以下的深锅或汤锅，锅壁要高于洋葱，不能用浅口平底锅）",
    "厨房温度计",
    "漏勺"
  ]
  steps := [
    { index := 1, instruction := "黄洋葱剥去外层干皮，切掉顶部 5mm，保留底部根盘不切" },
    { index := 2, instruction := "从顶部下刀，沿直径方向垂直切到距根盘 1cm 处停止，即不切断根盘" },
    { index := 3, instruction := "按同样方式每间隔约 45 度切一刀，共切 16 刀，把整颗洋葱分成 16 瓣" },
    { index := 4, instruction := "把洋葱翻面，根盘朝上，同样方式在每两瓣之间补切 1 刀，共补 8 刀" },
    { index := 5, instruction := "把切好的洋葱根盘朝上放入冰水，浸泡 20 分钟" },
    { index := 6, instruction := "泡好后取出，根盘朝上静置 5 分钟沥干水分" },
    { index := 7, instruction := "取 40g 低筋面粉，均匀撒在洋葱的花瓣之间，边撒边把花瓣拨开，让每一层花瓣内侧都挂上干粉" },
    { index := 8, instruction := "将剩余 80g 低筋面粉、40g 玉米淀粉、2g 辣椒粉、1g 黑胡椒粉、3g 食盐混合均匀，备用" },
    { index := 9, instruction := "将 1 个鸡蛋与 100ml 冰水混合，搅打 30 秒至完全均匀，备用" },
    { index := 10, instruction := "把洋葱根盘朝上浸入蛋液，翻转 3 次，使每片花瓣正反面都沾上蛋液" },
    { index := 11, instruction := "把洋葱根盘朝上放入混合粉中，用手抓粉从中心向四周撒进花瓣缝隙，翻转 3 次" },
    { index := 12, instruction := "提起洋葱抖掉多余的粉，检查花瓣根部有无露白，露白处补撒混合粉" },
    { index := 13, instruction := "静置 2 分钟让挂粉回潮，此时外壳应呈现均匀的白色粉层" },
    { index := 14, instruction := "深锅倒入 1200ml 食用油，中火加热至 170℃" },
    { index := 15, instruction := "把洋葱根盘朝下放入油中，此时油面会剧烈起泡" },
    { index := 16, instruction := "保持 165℃ - 175℃ 油炸 3 分钟，期间用漏勺舀热油反复浇淋洋葱顶部" },
    { index := 17, instruction := "把洋葱翻面，根盘朝上继续油炸 2 分钟" },
    { index := 18, instruction := "待花瓣呈金黄色、外壳变硬时捞出，判断标准是洋葱能浮在油面且花瓣完全张开" },
    { index := 19, instruction := "放在漏勺上沥油 2 分钟" },
    { index := 20, instruction := "把洋葱根盘朝下放在盘子上，花瓣自然摊开" },
    { index := 21, instruction := "中心放 30ml 蘸酱（番茄酱、蛋黄酱或蜂蜜芥末酱均可）" }
  ]
}

theorem recipe_4feef09f05b2_ingredients_nonempty :
    recipe_4feef09f05b2.ingredients.isEmpty = false := by decide

theorem recipe_4feef09f05b2_steps_nonempty :
    recipe_4feef09f05b2.steps.isEmpty = false := by decide

theorem recipe_4feef09f05b2_step_count :
    recipe_4feef09f05b2.steps.length = 21 := by decide

theorem recipe_4feef09f05b2_steps_ordered :
    orderedFrom 1 recipe_4feef09f05b2.steps = true := by decide

theorem recipe_4feef09f05b2_executes_to_terminal :
    executesToTerminal recipe_4feef09f05b2 = true := by decide

theorem recipe_4feef09f05b2_kernel_certificate :
    kernelCertified recipe_4feef09f05b2 = true := by decide

end LeanToCook.SourceCatalog
