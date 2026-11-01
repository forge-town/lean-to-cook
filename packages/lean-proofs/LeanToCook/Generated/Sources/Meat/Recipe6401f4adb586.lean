/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 牛排 · dishes/meat_dish/牛排/牛排.md -/
def recipe_6401f4adb586 : Recipe := {
  id := "6401f4adb586"
  title := "牛排"
  category := "meat"
  sourcePath := "dishes/meat_dish/牛排/牛排.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "平底锅（有条件的推荐铸铁平底锅）",
    "锡箔纸（可选）",
    "厨房纸（可选）",
    "汤匙",
    "牛排，参见如何选择不同种类的牛排",
    "橄榄油（推荐特级初榨橄榄油）",
    "黄油",
    "盐（推荐大颗粒海盐）",
    "黑胡椒粉（推荐粗颗粒现磨黑胡椒）",
    "大蒜",
    "香料（可选，推荐迷迭香或者百里香，尽量使用新鲜的植物枝条而不是这些香料磨成的粉）",
    "预制牛排酱汁（可选）",
    "配菜（ 可选，按喜好准备，这里推荐芦笋，口蘑，小番茄，小土豆，选其中的 1-2 种即可）"
  ]
  steps := [
    { index := 1, instruction := "从冰箱中取出牛排解冻。" },
    { index := 2, instruction := "将小番茄，小土豆和口蘑洗净，对半切开备用。" },
    { index := 3, instruction := "将大蒜剥皮，留 5-8 个较大的蒜瓣，用刀背压扁备用。" },
    { index := 4, instruction := "牛排的预处理" },
    { index := 5, instruction := "将炉灶打开高火（见附录对于火力大小的说明），同时锅中加入橄榄油，热锅 15-30 秒。" },
    { index := 6, instruction := "腌制牛排。将海盐和黑胡椒均匀的洒在牛排的全部表面并用手涂抹，揉搓，使得盐和胡椒颗粒尽量嵌入到肉中。注意，腌制完成后牛排需要立即下锅，不推荐提前腌制牛排。这是因为外表涂抹的盐会析出牛肉中的水分，影响烹饪的同时丧失风味。" },
    { index := 7, instruction := "热锅至油温 6-8 成（参见油温判断技巧），将牛排由近及远的缓慢放入锅中。" },
    { index := 8, instruction := "如果您使用了土豆作为配菜，可以将土豆放入碗中，然后放进微波炉加热 10 分钟，或者放入开水煮 3-5 分钟。" },
    { index := 9, instruction := "单面煎制 1.5 分钟（这个时间适用于 2-3cm 厚大约的牛排。如果您的牛排更薄，考虑将这个时间缩短为 1 分钟。如果您的牛排更厚，考虑将这个时间增加至 2-2.5 分钟。）" },
    { index := 10, instruction := "翻面，再煎制 1.5 分钟。" },
    { index := 11, instruction := "将炉灶切换至中火，随后按顺序快速加入黄油、大蒜、百里香。用锅铲推动黄油在锅中快速涂抹直至完全融化。将大蒜压在牛排下以增加风味。" },
    { index := 12, instruction := "将平底锅倾斜地放在灶上，使得油全部流到锅的一侧。" },
    { index := 13, instruction := "将香料和大蒜放置在牛排上，用汤匙舀起锅中的油，不断地淋在牛排上。这个过程持续 30 秒，随后将牛排翻面，再重复这个过程 30 秒。" },
    { index := 14, instruction := "将牛排盛出放在案板上，用锡箔纸包裹，等待 5-10 分钟。这个过程（称为醒肉）的作用是利用牛排自身的温度继续加热，锁住水分。" },
    { index := 15, instruction := "将配菜（土豆，番茄，蘑菇）倒入锅中，开中火煎 5 分钟。" },
    { index := 16, instruction := "取出牛排，用刀切成宽度 1.5cm 宽度的肉条，此时您可以观察到牛肉的熟度。" },
    { index := 17, instruction := "取出配菜，装盘，淋上锅中剩余的油或者牛排酱汁（可选）" }
  ]
}

theorem recipe_6401f4adb586_ingredients_nonempty :
    recipe_6401f4adb586.ingredients.isEmpty = false := by decide

theorem recipe_6401f4adb586_steps_nonempty :
    recipe_6401f4adb586.steps.isEmpty = false := by decide

theorem recipe_6401f4adb586_step_count :
    recipe_6401f4adb586.steps.length = 17 := by decide

theorem recipe_6401f4adb586_steps_ordered :
    orderedFrom 1 recipe_6401f4adb586.steps = true := by decide

theorem recipe_6401f4adb586_executes_to_terminal :
    executesToTerminal recipe_6401f4adb586 = true := by decide

theorem recipe_6401f4adb586_kernel_certificate :
    kernelCertified recipe_6401f4adb586 = true := by decide

end LeanToCook.SourceCatalog
