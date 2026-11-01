/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 空气炸锅羊排 · dishes/semi-finished/空气炸锅羊排/空气炸锅羊排.md -/
def recipe_ad951394e7a9 : Recipe := {
  id := "ad951394e7a9"
  title := "空气炸锅羊排"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/空气炸锅羊排/空气炸锅羊排.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "必备：羊排（推荐 JD 购买大庄园 新西兰进口 羔羊法式肩排，500g/袋共三片，JD 打折的话 42 元）",
    "必备：黑椒混合牛排调味料（懒）",
    "必备：蒜蓉酱（推荐川娃子的，同样是因为懒）",
    "必备：厨房纸",
    "可选：黄油（JD 买小盒装的，一片一小盒）",
    "可选：烧烤料",
    "可选：罗勒碎",
    "可选：空气炸锅烤架（用烤架油比较少，底下更容易熟，洗起来麻烦。不用的话比较入味。看个人选择啦）"
  ]
  steps := [
    { index := 1, instruction := "羊排放入碗中清水洗净血水" },
    { index := 2, instruction := "羊排用厨房纸吸干水分，双面抹上黑椒混合调味料、蒜蓉酱，静置腌制 20 分钟" },
    { index := 3, instruction := "锡纸碗放上烤架，羊排放在烤架上，撒上罗勒碎，黄油或烧烤料放在羊排上，空气炸锅 180° 10 分钟" },
    { index := 4, instruction := "羊排翻面，撒上罗勒碎，黄油（从锡纸碗里舀上来）或烧烤料放在羊排上，空气炸锅 180° 5 分钟（可以视个人喜好加一点时间，这里写的是不会焦的时间）" }
  ]
}

theorem recipe_ad951394e7a9_ingredients_nonempty :
    recipe_ad951394e7a9.ingredients.isEmpty = false := by decide

theorem recipe_ad951394e7a9_steps_nonempty :
    recipe_ad951394e7a9.steps.isEmpty = false := by decide

theorem recipe_ad951394e7a9_step_count :
    recipe_ad951394e7a9.steps.length = 4 := by decide

theorem recipe_ad951394e7a9_steps_ordered :
    orderedFrom 1 recipe_ad951394e7a9.steps = true := by decide

theorem recipe_ad951394e7a9_executes_to_terminal :
    executesToTerminal recipe_ad951394e7a9 = true := by decide

theorem recipe_ad951394e7a9_kernel_certificate :
    kernelCertified recipe_ad951394e7a9 = true := by decide

end LeanToCook.SourceCatalog
