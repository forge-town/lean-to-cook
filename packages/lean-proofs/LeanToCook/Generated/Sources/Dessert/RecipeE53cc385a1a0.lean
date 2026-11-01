/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 反沙芋头 · dishes/dessert/反沙芋头/反沙芋头.md -/
def recipe_e53cc385a1a0 : Recipe := {
  id := "e53cc385a1a0"
  title := "反沙芋头"
  category := "dessert"
  sourcePath := "dishes/dessert/反沙芋头/反沙芋头.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "荔浦芋头（电商平台购买即可，实惠新鲜）",
    "白砂糖或冰糖",
    "水",
    "葱"
  ]
  steps := [
    { index := 1, instruction := "芋头切长条（稍微大条一点，翻炒过程不容易烂）" },
    { index := 2, instruction := "加入可以没过芋头的油，等油温起来（插入筷子冒小泡即可）" },
    { index := 3, instruction := "放进芋头到油里，去炸到芋头浮起来，一般是微微泛黄并且可以用筷子很轻松戳洞" },
    { index := 4, instruction := "炸芋头的油放起来别浪费，后面炒菜啥的都能用" },
    { index := 5, instruction := "接下来关键的一步，把糖(30g)和水(15g)按照 2：1 比例，加热至不变色且冒小泡" },
    { index := 6, instruction := "倒入葱花和芋头，关火翻炒，此时等温度下来，糖就会有反沙的效果" },
    { index := 7, instruction := "装盘上桌！" }
  ]
}

theorem recipe_e53cc385a1a0_ingredients_nonempty :
    recipe_e53cc385a1a0.ingredients.isEmpty = false := by decide

theorem recipe_e53cc385a1a0_steps_nonempty :
    recipe_e53cc385a1a0.steps.isEmpty = false := by decide

theorem recipe_e53cc385a1a0_step_count :
    recipe_e53cc385a1a0.steps.length = 7 := by decide

theorem recipe_e53cc385a1a0_steps_ordered :
    orderedFrom 1 recipe_e53cc385a1a0.steps = true := by decide

theorem recipe_e53cc385a1a0_executes_to_terminal :
    executesToTerminal recipe_e53cc385a1a0 = true := by decide

theorem recipe_e53cc385a1a0_kernel_certificate :
    kernelCertified recipe_e53cc385a1a0 = true := by decide

end LeanToCook.SourceCatalog
