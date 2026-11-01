/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 韩式拌饭 · dishes/staple/韩式拌饭/韩式拌饭.md -/
def recipe_c5e2191c72cc : Recipe := {
  id := "c5e2191c72cc"
  title := "韩式拌饭"
  category := "staple"
  sourcePath := "dishes/staple/韩式拌饭/韩式拌饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米饭",
    "鸡蛋",
    "火锅牛肉卷",
    "豆芽",
    "蘑菇",
    "胡萝卜",
    "西葫芦",
    "韩式辣酱",
    "雪碧",
    "芝麻",
    "芝麻油"
  ]
  steps := [
    { index := 1, instruction := "蔬菜清洗 切丝 放锅中翻炒 食材变软 便可称出" },
    { index := 2, instruction := "煮水 等沸腾时 焯牛肉卷 只需煮熟 大概三分钟即可捞出" },
    { index := 3, instruction := "煎溏心蛋" },
    { index := 4, instruction := "将米饭放在一个碗里 然后倒扣在大碗" },
    { index := 5, instruction := "将准备好的蔬菜和肉卷依次绕圈放在米饭上面 将煎蛋放中间" },
    { index := 6, instruction := "备酱汁" },
    { index := 7, instruction := "将备好的酱汁倒在摆好盘的碗中" }
  ]
}

theorem recipe_c5e2191c72cc_ingredients_nonempty :
    recipe_c5e2191c72cc.ingredients.isEmpty = false := by decide

theorem recipe_c5e2191c72cc_steps_nonempty :
    recipe_c5e2191c72cc.steps.isEmpty = false := by decide

theorem recipe_c5e2191c72cc_step_count :
    recipe_c5e2191c72cc.steps.length = 7 := by decide

theorem recipe_c5e2191c72cc_steps_ordered :
    orderedFrom 1 recipe_c5e2191c72cc.steps = true := by decide

theorem recipe_c5e2191c72cc_executes_to_terminal :
    executesToTerminal recipe_c5e2191c72cc = true := by decide

theorem recipe_c5e2191c72cc_kernel_certificate :
    kernelCertified recipe_c5e2191c72cc = true := by decide

end LeanToCook.SourceCatalog
