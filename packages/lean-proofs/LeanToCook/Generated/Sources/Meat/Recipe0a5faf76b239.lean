/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 姜炒鸡 · dishes/meat_dish/姜炒鸡/姜炒鸡.md -/
def recipe_0a5faf76b239 : Recipe := {
  id := "0a5faf76b239"
  title := "姜炒鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/姜炒鸡/姜炒鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡",
    "生姜",
    "啤酒",
    "生抽",
    "老抽",
    "盐",
    "小米椒",
    "美人辣",
    "泡椒",
    "大蒜"
  ]
  steps := [
    { index := 1, instruction := "鸡尽量剁成 1cm 的小块，洗净后滤干，再放生抽腌和料酒腌制 30 分钟" },
    { index := 2, instruction := "大先热锅到微微冒烟，放入食用油，等 5 秒" },
    { index := 3, instruction := "下入姜片后转中火炒 30 秒，" },
    { index := 4, instruction := "下入鸡块翻炒 3 分钟，炒干水分，炒出鸡油" },
    { index := 5, instruction := "放入各种剁碎的辣椒和大蒜子，加盐和老抽继续翻炒 30 秒" },
    { index := 6, instruction := "倒入啤酒，中小火焖 2 分钟" },
    { index := 7, instruction := "大火收汁盛盘" }
  ]
}

theorem recipe_0a5faf76b239_ingredients_nonempty :
    recipe_0a5faf76b239.ingredients.isEmpty = false := by decide

theorem recipe_0a5faf76b239_steps_nonempty :
    recipe_0a5faf76b239.steps.isEmpty = false := by decide

theorem recipe_0a5faf76b239_step_count :
    recipe_0a5faf76b239.steps.length = 7 := by decide

theorem recipe_0a5faf76b239_steps_ordered :
    orderedFrom 1 recipe_0a5faf76b239.steps = true := by decide

theorem recipe_0a5faf76b239_executes_to_terminal :
    executesToTerminal recipe_0a5faf76b239 = true := by decide

theorem recipe_0a5faf76b239_kernel_certificate :
    kernelCertified recipe_0a5faf76b239 = true := by decide

end LeanToCook.SourceCatalog
