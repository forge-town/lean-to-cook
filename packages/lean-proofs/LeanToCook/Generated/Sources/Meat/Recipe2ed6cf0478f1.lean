/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小酥肉 · dishes/meat_dish/小酥肉.md -/
def recipe_2ed6cf0478f1 : Recipe := {
  id := "2ed6cf0478f1"
  title := "小酥肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/小酥肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "去皮猪肉（根据喜好选择肥瘦）",
    "植物油",
    "老姜",
    "小葱",
    "料酒",
    "盐",
    "十三香",
    "胡椒粉",
    "味精",
    "鸡精",
    "花椒碎",
    "花椒粒",
    "生抽",
    "鸡蛋",
    "面粉",
    "红薯淀粉"
  ]
  steps := [
    { index := 1, instruction := "老姜切丝，小葱不用切。" },
    { index := 2, instruction := "根据计算公式倒入料酒、清水。" },
    { index := 3, instruction := "用手捏揉 5 分钟，使姜葱的味道充分溶解在水中。" },
    { index := 4, instruction := "将猪肉去皮洗净" },
    { index := 5, instruction := "切成长度 810 厘米，厚度 1.5 厘米的肉条。" },
    { index := 6, instruction := "根据上面的计算公式加入盐，十三香、胡椒粉、味精、鸡精、花椒碎、花椒粒、生抽。" },
    { index := 7, instruction := "倒入前面制作好的葱姜水" },
    { index := 8, instruction := "抓匀并且充分揉制 10 分钟，直至肉吸收所有水分并且变得粘手。" },
    { index := 9, instruction := "封上保鲜膜放冷藏室静置 30 分钟。" },
    { index := 10, instruction := "将面粉、红薯粉倒入腌制好的肉中，加入鸡蛋清。" },
    { index := 11, instruction := "充分揉制 15 分钟。" },
    { index := 12, instruction := "锅中倒入植物油，根据锅大小控制油量，油面高度 3 厘米以上。" },
    { index := 13, instruction := "大火将温加热至 150° 后，转小火保持温度。" },
    { index := 14, instruction := "将裹好粉的肉条用筷子夹入油锅中，捋成自己喜欢的形状，炸 35 分钟定型。目测颜色微黄，用锅铲翻动感受倒略微有些硬了就可以。具体时间受肉块大小、油温、裹粉程度影响。" },
    { index := 15, instruction := "捞出沥油。" },
    { index := 16, instruction := "将油温升至 180° 放入初炸好的肉条，炸至金黄色即可捞出。" }
  ]
}

theorem recipe_2ed6cf0478f1_ingredients_nonempty :
    recipe_2ed6cf0478f1.ingredients.isEmpty = false := by decide

theorem recipe_2ed6cf0478f1_steps_nonempty :
    recipe_2ed6cf0478f1.steps.isEmpty = false := by decide

theorem recipe_2ed6cf0478f1_step_count :
    recipe_2ed6cf0478f1.steps.length = 16 := by decide

theorem recipe_2ed6cf0478f1_steps_ordered :
    orderedFrom 1 recipe_2ed6cf0478f1.steps = true := by decide

theorem recipe_2ed6cf0478f1_executes_to_terminal :
    executesToTerminal recipe_2ed6cf0478f1 = true := by decide

theorem recipe_2ed6cf0478f1_kernel_certificate :
    kernelCertified recipe_2ed6cf0478f1 = true := by decide

end LeanToCook.SourceCatalog
