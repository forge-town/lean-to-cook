/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉皮 · dishes/semi-finished/凉皮.md -/
def recipe_617f7ae9488e : Recipe := {
  id := "617f7ae9488e"
  title := "凉皮"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/凉皮.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "凉皮、面筋",
    "盐、鸡精、蚝油、生抽、老抽、香油、香醋、芝麻酱（原味芝麻酱最佳）",
    "黄瓜、大蒜、绿豆芽",
    "盆、碗、盘子、蒜臼"
  ]
  steps := [
    { index := 1, instruction := "锅中加入 500ml 水。煮沸。" },
    { index := 2, instruction := "将绿豆芽放入锅中，大火煮 60 秒。豆芽捞出，过凉水，放入盘中备用。" },
    { index := 3, instruction := "黄瓜切丝放入盘中备用" },
    { index := 4, instruction := "将 10g 蒜瓣剥皮、放入蒜臼中加入 1g 盐。锤成蒜泥，加入 10g 自来水。放置备用。" },
    { index := 5, instruction := "注：超市购买来的凉皮表面一般会有食用油，可以使用自来水清洗。面筋同样。" },
    { index := 6, instruction := "注：清洗面筋之后，请用手将面筋中的大量水分挤出（不需过于用力）。" },
    { index := 7, instruction := "准备小碗，加入 3g 盐、2g 鸡精、5g 生抽、1g 老抽、1g 香油、2g 蚝油、香醋 5g、（盐、香醋均可根据个人口味酌量添加，以上数据只是大众口味）。" },
    { index := 8, instruction := "以上调料加入 25-35g 温水（据个人咸淡程度），使用筷子将其拌匀、溶解。静置一旁冷却。" },
    { index := 9, instruction := "注：以下计量均为一人份，如果有 n 人，请自觉将计量乘以 n" },
    { index := 10, instruction := "拿出小碗，将准备好的芝麻酱放入其中。" },
    { index := 11, instruction := "加入 4g 盐、3g 鸡精、5g 生抽、1g 老抽、3g 蚝油。" },
    { index := 12, instruction := "使用筷子将其调料与芝麻酱拌匀。" },
    { index := 13, instruction := "加入 10g 清水将其拌匀。" },
    { index := 14, instruction := "上一步骤重复 2、3 次（次数根据个人对芝麻酱的浓稠程度而定）。" },
    { index := 15, instruction := "拿出之前准备好的小盆，加入之前准备好的凉皮。" },
    { index := 16, instruction := "倒入盐水，使用筷子将其拌匀。随之盛入小碗（盐水一并倒入碗中）。" },
    { index := 17, instruction := "豆芽放置凉皮上、面筋随后放上。" },
    { index := 18, instruction := "将调配好的芝麻酱从面筋上方倒下。" },
    { index := 19, instruction := "撒上黄瓜丝。" },
    { index := 20, instruction := "如有喜爱可以加入辣椒油。" },
    { index := 21, instruction := "色香味俱全的家常凉皮出炉！" }
  ]
}

theorem recipe_617f7ae9488e_ingredients_nonempty :
    recipe_617f7ae9488e.ingredients.isEmpty = false := by decide

theorem recipe_617f7ae9488e_steps_nonempty :
    recipe_617f7ae9488e.steps.isEmpty = false := by decide

theorem recipe_617f7ae9488e_step_count :
    recipe_617f7ae9488e.steps.length = 21 := by decide

theorem recipe_617f7ae9488e_steps_ordered :
    orderedFrom 1 recipe_617f7ae9488e.steps = true := by decide

theorem recipe_617f7ae9488e_executes_to_terminal :
    executesToTerminal recipe_617f7ae9488e = true := by decide

theorem recipe_617f7ae9488e_kernel_certificate :
    kernelCertified recipe_617f7ae9488e = true := by decide

end LeanToCook.SourceCatalog
