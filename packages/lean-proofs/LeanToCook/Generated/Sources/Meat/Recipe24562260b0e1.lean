/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿牛腩 · dishes/meat_dish/西红柿牛腩/西红柿牛腩.md -/
def recipe_24562260b0e1 : Recipe := {
  id := "24562260b0e1"
  title := "西红柿牛腩"
  category := "meat"
  sourcePath := "dishes/meat_dish/西红柿牛腩/西红柿牛腩.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "西红柿",
    "牛腩",
    "燃气灶（西红柿去皮用）",
    "高压锅/砂锅/普通铝锅（铁锅）",
    "2cm 两段葱段、两片姜片，葱花、姜各 10g",
    "生抽、白胡椒粉，白糖，料/黄酒，八角三小片",
    "牛腩（挑选肥瘦相间的口感比较好）"
  ]
  steps := [
    { index := 1, instruction := "牛腩切条、切块成长宽高均 2cm ，冷水下锅，开锅煮制 2 分钟去除血水，捞出冲洗干净" },
    { index := 2, instruction := "另起锅 2L 水烧开，加入 2cm 两段葱段、两片姜片、八角、料/黄酒 5-10ml，放入焯好的牛肉，盖盖炖制（砂锅 1 小时，高压锅炖肉模式 45 分钟），筷子能轻松插透就证明炖好了" },
    { index := 3, instruction := "西红柿去皮：西红柿头部滑十字至腰线，筷子/刀叉从果蒂捅入，煤气灶小火，一边转动一边烤，及时拿下来查看，起皮后撕下来，切块。越小越好" },
    { index := 4, instruction := "起锅烧油，油温 7 成热，葱、姜各 10g，番茄下锅，炒透炒出番茄红色，加入煮好的牛腩和原汤，原汤刚刚没过牛肉即可" },
    { index := 5, instruction := "根据个人口味放入盐、糖、生抽调味盖盖" },
    { index := 6, instruction := "开锅后大火继续炒制 3-5 分钟" },
    { index := 7, instruction := "待番茄汁呈中等粘稠程度后关火，散入葱花，盛盘" }
  ]
}

theorem recipe_24562260b0e1_ingredients_nonempty :
    recipe_24562260b0e1.ingredients.isEmpty = false := by decide

theorem recipe_24562260b0e1_steps_nonempty :
    recipe_24562260b0e1.steps.isEmpty = false := by decide

theorem recipe_24562260b0e1_step_count :
    recipe_24562260b0e1.steps.length = 7 := by decide

theorem recipe_24562260b0e1_steps_ordered :
    orderedFrom 1 recipe_24562260b0e1.steps = true := by decide

theorem recipe_24562260b0e1_executes_to_terminal :
    executesToTerminal recipe_24562260b0e1 = true := by decide

theorem recipe_24562260b0e1_kernel_certificate :
    kernelCertified recipe_24562260b0e1 = true := by decide

end LeanToCook.SourceCatalog
