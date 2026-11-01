/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱烧海参 · dishes/aquatic/葱烧海参/葱烧海参.md -/
def recipe_2ce6f52e5526 : Recipe := {
  id := "2ce6f52e5526"
  title := "葱烧海参"
  category := "aquatic"
  sourcePath := "dishes/aquatic/葱烧海参/葱烧海参.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "泡发好的海参海参",
    "大葱葱白"
  ]
  steps := [
    { index := 1, instruction := "葱白切成 1cm 的段，备用。" },
    { index := 2, instruction := "海参切成 1cm 的段，备用。" },
    { index := 3, instruction := "准备一个空碗，倒入 20g 蚝油， 10g 生抽， 2g 白糖，搅拌均匀。料汁" },
    { index := 4, instruction := "另一个空碗倒入淀粉，水，制备水淀粉，勾芡用。" },
    { index := 5, instruction := "热锅，锅内放入 20ml - 25ml 食用油。等待 10 秒让油温升高。" },
    { index := 6, instruction := "放入葱白，调小火，注意不要让葱白变焦。大概煎 3-5 分钟即可。葱白" },
    { index := 7, instruction := "用筷子夹出葱白，放入盘中备用。" },
    { index := 8, instruction := "倒入调好的料汁，炒香，等待 1 - 2 分钟 。" },
    { index := 9, instruction := "放入切好的海参，翻炒 1 分钟" },
    { index := 10, instruction := "加入 100 ml 的水， 中小火， 等待 5 分钟" },
    { index := 11, instruction := "等待锅中汤汁快干的时候，加入水淀粉，加入前面取出的葱白" },
    { index := 12, instruction := "在外观呈粘稠状态后关火，盛盘 葱烧海参-预览图-5" }
  ]
}

theorem recipe_2ce6f52e5526_ingredients_nonempty :
    recipe_2ce6f52e5526.ingredients.isEmpty = false := by decide

theorem recipe_2ce6f52e5526_steps_nonempty :
    recipe_2ce6f52e5526.steps.isEmpty = false := by decide

theorem recipe_2ce6f52e5526_step_count :
    recipe_2ce6f52e5526.steps.length = 12 := by decide

theorem recipe_2ce6f52e5526_steps_ordered :
    orderedFrom 1 recipe_2ce6f52e5526.steps = true := by decide

theorem recipe_2ce6f52e5526_executes_to_terminal :
    executesToTerminal recipe_2ce6f52e5526 = true := by decide

theorem recipe_2ce6f52e5526_kernel_certificate :
    kernelCertified recipe_2ce6f52e5526 = true := by decide

end LeanToCook.SourceCatalog
