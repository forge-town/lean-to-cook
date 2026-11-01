/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 回锅肉 · dishes/meat_dish/回锅肉/回锅肉.md -/
def recipe_dacc0e7e690a : Recipe := {
  id := "dacc0e7e690a"
  title := "回锅肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/回锅肉/回锅肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉",
    "小葱",
    "生姜",
    "青红椒",
    "蒜苗",
    "料酒",
    "豆瓣酱",
    "生抽酱油",
    "味精"
  ]
  steps := [
    { index := 1, instruction := "锅烧热，用手将五花肉紧紧压在锅上炙皮" },
    { index := 2, instruction := "用钢丝球把皮刷干净，至黑色部分碳化部分被完全去除，不刷干净会有苦味" },
    { index := 3, instruction := "将五花肉放入锅中，放入能淹没五花肉的冷水，放入生姜片、料酒和小葱（取 2 棵小葱打结）" },
    { index := 4, instruction := "开大火煮，水开后撇去浮沫，继续煮 15 分钟，煮至瘦肉部分可以用筷子轻松刺穿" },
    { index := 5, instruction := "青红椒切圈" },
    { index := 6, instruction := "蒜苗切段" },
    { index := 7, instruction := "生姜切小薄片" },
    { index := 8, instruction := "将 5ml 豆瓣酱和 5ml 生抽提前混合" },
    { index := 9, instruction := "将煮熟的五花肉捞出放入冷水晾凉" },
    { index := 10, instruction := "擦干五花肉的水，切成上肥下瘦的 2mm 的薄片（切厚了口感不好，而且很油）" },
    { index := 11, instruction := "锅烧热，放入一层底油滑锅" },
    { index := 12, instruction := "放入五花肉煸炒至肥肉透明，肉片微卷（欲称起灯盏窝），二刀肉效果最佳。" },
    { index := 13, instruction := "倒入豆瓣生抽混合物，5g 味精翻炒 15 秒" },
    { index := 14, instruction := "放入青红椒圈和小姜片，放入另 5ml 豆瓣酱翻炒 30 秒" },
    { index := 15, instruction := "放入蒜苗翻炒 60 秒" },
    { index := 16, instruction := "出锅" },
    { index := 17, instruction := "选用冰冻五花肉常量放置 0.5 小时 或者鲜五花肉放冰箱冷藏 1 个小时，切成 2-5 mm 薄片" },
    { index := 18, instruction := "开中火，辣椒放过锅中干煸 30-45 秒后取出" },
    { index := 19, instruction := "锅烧热，放入一层底油滑锅，放入姜片煸炒 15 秒" },
    { index := 20, instruction := "倒入五花肉，间隔 10 S 翻炒一次，待五花肉出现焦黄色（翻炒时间越久五花肉口感越硬）" },
    { index := 21, instruction := "倒入之前干煸过的辣椒、10ml 豆瓣酱，生抽调味，继续翻炒 60 秒" },
    { index := 22, instruction := "倒入切成段的蒜苗翻炒 10 秒" },
    { index := 23, instruction := "出锅" }
  ]
}

theorem recipe_dacc0e7e690a_ingredients_nonempty :
    recipe_dacc0e7e690a.ingredients.isEmpty = false := by decide

theorem recipe_dacc0e7e690a_steps_nonempty :
    recipe_dacc0e7e690a.steps.isEmpty = false := by decide

theorem recipe_dacc0e7e690a_step_count :
    recipe_dacc0e7e690a.steps.length = 23 := by decide

theorem recipe_dacc0e7e690a_steps_ordered :
    orderedFrom 1 recipe_dacc0e7e690a.steps = true := by decide

theorem recipe_dacc0e7e690a_executes_to_terminal :
    executesToTerminal recipe_dacc0e7e690a = true := by decide

theorem recipe_dacc0e7e690a_kernel_certificate :
    kernelCertified recipe_dacc0e7e690a = true := by decide

end LeanToCook.SourceCatalog
