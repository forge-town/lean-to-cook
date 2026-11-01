/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 茄子肉煎饼 · dishes/staple/茄子肉煎饼/茄子肉煎饼.md -/
def recipe_e9ddad293a47 : Recipe := {
  id := "e9ddad293a47"
  title := "茄子肉煎饼"
  category := "staple"
  sourcePath := "dishes/staple/茄子肉煎饼/茄子肉煎饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米粉（指用大米研磨成的粉）",
    "小麦粉",
    "鸡蛋",
    "煮熟的腊肉",
    "茄子（买长条状的，越圆越好）",
    "食用油",
    "食盐"
  ]
  steps := [
    { index := 1, instruction := "将茄子去皮后切成片，将腊肉切成片，备用" },
    { index := 2, instruction := "依次向盆中加入 250g 米粉（大米研磨成的粉）、50g 面粉和 1 个鸡蛋" },
    { index := 3, instruction := "边用筷子搅拌，边加入清水（清水用于调节粘稠度），使米粉、面粉、鸡蛋混合成面糊,当面糊能够附着在茄片、肉片上而不掉落时停止加水，而后将所有茄片和肉片放入面糊中，用面糊充分包裹" },
    { index := 4, instruction := "平底锅加入食用油10-30ml，开小火" },
    { index := 5, instruction := "用筷子或勺子把裹了面糊的茄片、肉片放入锅中，先煎至两面金黄，再煎3-6分钟（煎的过程中，食用油会变少，可再添加食用油）" },
    { index := 6, instruction := "撒盐，翻炒均匀，起锅装盘" }
  ]
}

theorem recipe_e9ddad293a47_ingredients_nonempty :
    recipe_e9ddad293a47.ingredients.isEmpty = false := by decide

theorem recipe_e9ddad293a47_steps_nonempty :
    recipe_e9ddad293a47.steps.isEmpty = false := by decide

theorem recipe_e9ddad293a47_step_count :
    recipe_e9ddad293a47.steps.length = 6 := by decide

theorem recipe_e9ddad293a47_steps_ordered :
    orderedFrom 1 recipe_e9ddad293a47.steps = true := by decide

theorem recipe_e9ddad293a47_executes_to_terminal :
    executesToTerminal recipe_e9ddad293a47 = true := by decide

theorem recipe_e9ddad293a47_kernel_certificate :
    kernelCertified recipe_e9ddad293a47 = true := by decide

end LeanToCook.SourceCatalog
