/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 枝竹羊腩煲 · dishes/meat_dish/枝竹羊腩煲/枝竹羊腩煲.md -/
def recipe_abbf66d7a0c1 : Recipe := {
  id := "abbf66d7a0c1"
  title := "枝竹羊腩煲"
  category := "meat"
  sourcePath := "dishes/meat_dish/枝竹羊腩煲/枝竹羊腩煲.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "羊腩",
    "腐竹",
    "柱侯酱",
    "腐乳",
    "南乳",
    "老抽",
    "料酒",
    "蚝油",
    "清水",
    "冰糖",
    "葱段",
    "姜片",
    "香菇",
    "洋葱或红葱头",
    "蒜瓣",
    "香叶",
    "八角",
    "桂皮",
    "其余配菜例如马蹄、土豆或者萝卜可依据个人喜好自行添加"
  ]
  steps := [
    { index := 1, instruction := "准备工作: 香菇提前浸泡 2 - 3 小时至变软。腐竹提前浸泡 30 分钟至变软" },
    { index := 2, instruction := "准备酱汁 1: 南乳、柱侯酱、20g 腐乳、老抽放入同个小碗中搅拌均匀" },
    { index := 3, instruction := "准备酱汁 2: 20g 腐乳、砂糖、辣椒油放入同个小碗搅拌均匀" },
    { index := 4, instruction := "泡好的香菇去除根部" },
    { index := 5, instruction := "泡好的腐竹切成 5cm 的小段，挤干水分" },
    { index := 6, instruction := "洋葱去皮切丝。也可以用去皮红葱头进行替代，口味更佳。" },
    { index := 7, instruction := "小葱切成大约 5cm 的葱段" },
    { index := 8, instruction := "羊腩冷水下锅，放入 2 - 3 片姜片，倒入凉水，大火煮至水滚后关火" },
    { index := 9, instruction := "捞出羊腩，放入准备好的冷水盆中放凉，使其更有嚼劲" },
    { index := 10, instruction := "锅烧热后放入冷油，放入 4 - 5 片姜片、洋葱/红葱头、葱白段、7 - 8 瓣蒜瓣进行爆香" },
    { index := 11, instruction := "放入冷却好的羊腩，用筷子搅拌大约 2 - 5 分钟直至出现金黄色" },
    { index := 12, instruction := "放入调好的酱汁 1 ，翻炒大约 2 分钟至颜色均匀" },
    { index := 13, instruction := "倒入清水至刚好没过食材" },
    { index := 14, instruction := "放入香菇、冰糖、香叶、八角、桂皮" },
    { index := 15, instruction := "加盖转小火炖 90 分钟" },
    { index := 16, instruction := "开盖加入腐竹，加盖转中火煮 20 分钟" },
    { index := 17, instruction := "开盖加入酱汁 2 搅拌均匀" },
    { index := 18, instruction := "关火，出锅前加入葱绿段或香菜" }
  ]
}

theorem recipe_abbf66d7a0c1_ingredients_nonempty :
    recipe_abbf66d7a0c1.ingredients.isEmpty = false := by decide

theorem recipe_abbf66d7a0c1_steps_nonempty :
    recipe_abbf66d7a0c1.steps.isEmpty = false := by decide

theorem recipe_abbf66d7a0c1_step_count :
    recipe_abbf66d7a0c1.steps.length = 18 := by decide

theorem recipe_abbf66d7a0c1_steps_ordered :
    orderedFrom 1 recipe_abbf66d7a0c1.steps = true := by decide

theorem recipe_abbf66d7a0c1_executes_to_terminal :
    executesToTerminal recipe_abbf66d7a0c1 = true := by decide

theorem recipe_abbf66d7a0c1_kernel_certificate :
    kernelCertified recipe_abbf66d7a0c1 = true := by decide

end LeanToCook.SourceCatalog
