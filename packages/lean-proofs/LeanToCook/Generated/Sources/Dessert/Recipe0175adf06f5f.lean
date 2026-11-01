/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 雪花酥 · dishes/dessert/雪花酥/雪花酥.md -/
def recipe_0175adf06f5f : Recipe := {
  id := "0175adf06f5f"
  title := "雪花酥"
  category := "dessert"
  sourcePath := "dishes/dessert/雪花酥/雪花酥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "不粘平底锅",
    "烘焙刮刀（可用锅铲代替，小心使用破坏不粘锅涂层）",
    "一次性塑料手套",
    "雪花酥/牛轧糖模具",
    "擀面杖",
    "无盐黄油",
    "棉花糖",
    "全脂奶粉",
    "混合坚果（三只松鼠每日坚果）",
    "饼干（非夹心型饼干，推荐小奇福或购买使用雪花酥烘焙专用小饼干）"
  ]
  steps := [
    { index := 1, instruction := "饼干超过一元硬币大小先切成小块" },
    { index := 2, instruction := "无盐黄油加入锅中，小火加热至无盐黄油完全融化" },
    { index := 3, instruction := "棉花糖加入锅中，使用刮刀搅拌，直至棉花糖融化并与无盐黄油均匀融合" },
    { index := 4, instruction := "20g 奶粉加入锅中，使用刮刀搅拌，奶粉与黄油棉花糖混合物搅拌均匀后立即关火" },
    { index := 5, instruction := "准备好的所有混合坚果与饼干趁热加入锅中，使用刮刀搅拌" },
    { index := 6, instruction := "搅拌到温度下降到手可以接触的温度后，戴上一次塑料手套，在锅中搓揉或者双手拿起拉扯，让饼干混合坚果与棉花糖黄油奶粉混合物分散均匀。" },
    { index := 7, instruction := "将上述步骤混合物压入模具中，边角压实，擀面杖擀平，未满的一边用手尽量压成直边" },
    { index := 8, instruction := "室温放凉，完全冷却后脱模，按照模具纹路切块，或切成自己喜欢的大小，撒上剩余奶粉，尽量使雪花酥每面都沾上奶粉" }
  ]
}

theorem recipe_0175adf06f5f_ingredients_nonempty :
    recipe_0175adf06f5f.ingredients.isEmpty = false := by decide

theorem recipe_0175adf06f5f_steps_nonempty :
    recipe_0175adf06f5f.steps.isEmpty = false := by decide

theorem recipe_0175adf06f5f_step_count :
    recipe_0175adf06f5f.steps.length = 8 := by decide

theorem recipe_0175adf06f5f_steps_ordered :
    orderedFrom 1 recipe_0175adf06f5f.steps = true := by decide

theorem recipe_0175adf06f5f_executes_to_terminal :
    executesToTerminal recipe_0175adf06f5f = true := by decide

theorem recipe_0175adf06f5f_kernel_certificate :
    kernelCertified recipe_0175adf06f5f = true := by decide

end LeanToCook.SourceCatalog
