/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 椒盐排条 · dishes/meat_dish/椒盐排条.md -/
def recipe_f43c7cdf6c27 : Recipe := {
  id := "f43c7cdf6c27"
  title := "椒盐排条"
  category := "meat"
  sourcePath := "dishes/meat_dish/椒盐排条.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大排",
    "鸡蛋",
    "盐",
    "椒盐粉",
    "葱姜水",
    "面粉",
    "淀粉",
    "吉士粉（增色增香，没有可以不放）",
    "水",
    "油"
  ]
  steps := [
    { index := 1, instruction := "大排洗干净，剔骨，用刀面拍松，切成厚片，再改成粗条。" },
    { index := 2, instruction := "加入椒盐粉，搅匀，待到出胶质了分次加入葱姜水，放入冰箱腌制 20 分钟。" },
    { index := 3, instruction := "制作炸糊。放入 80 g 面粉，20 g 淀粉（注意是 20 g 淀粉，剩下 60 g 备用），2 - 3 g 吉士粉，盐 1 g。" },
    { index := 4, instruction := "打入一个鸡蛋，搅拌，再分次加入水 100 g ，再加 10 g 油，反复搅拌。直到炸糊完全调开，略粘稠即可。" },
    { index := 5, instruction := "取出剩余的 60 g 淀粉，取出排条，裹上一层淀粉，再裹上面糊。" },
    { index := 6, instruction := "锅中加入油，能没过食材即可，加热到大约 150 ℃ - 160 ℃ 。下入排条炸成浅金黄色后捞出。刚下入排条时可能会有粘连，不要动。待排条定型后可用筷子翻动，即可分开。" },
    { index := 7, instruction := "待油温再次升高到 150 ℃ - 160 ℃ 时，下入排条复炸至金黄色后捞出。" },
    { index := 8, instruction := "撒上椒盐粉，搅拌均匀后出锅。" }
  ]
}

theorem recipe_f43c7cdf6c27_ingredients_nonempty :
    recipe_f43c7cdf6c27.ingredients.isEmpty = false := by decide

theorem recipe_f43c7cdf6c27_steps_nonempty :
    recipe_f43c7cdf6c27.steps.isEmpty = false := by decide

theorem recipe_f43c7cdf6c27_step_count :
    recipe_f43c7cdf6c27.steps.length = 8 := by decide

theorem recipe_f43c7cdf6c27_steps_ordered :
    orderedFrom 1 recipe_f43c7cdf6c27.steps = true := by decide

theorem recipe_f43c7cdf6c27_executes_to_terminal :
    executesToTerminal recipe_f43c7cdf6c27 = true := by decide

theorem recipe_f43c7cdf6c27_kernel_certificate :
    kernelCertified recipe_f43c7cdf6c27 = true := by decide

end LeanToCook.SourceCatalog
