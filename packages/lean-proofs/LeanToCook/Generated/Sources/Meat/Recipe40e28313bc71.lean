/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 冬瓜酿肉 · dishes/meat_dish/冬瓜酿肉/冬瓜酿肉.md -/
def recipe_40e28313bc71 : Recipe := {
  id := "40e28313bc71"
  title := "冬瓜酿肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/冬瓜酿肉/冬瓜酿肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冬瓜",
    "猪肉末",
    "鸡蛋",
    "葱",
    "葱姜末",
    "胡椒粉",
    "生抽",
    "淀粉"
  ]
  steps := [
    { index := 1, instruction := "冬瓜去皮，切成 25cm 长 3cm 厚的片" },
    { index := 2, instruction := "将切好的冬瓜放入碗中，放入 15g 盐，将冬瓜抹匀，放置 10 分钟" },
    { index := 3, instruction := "放置冬瓜的同时，换个碗放入肉末，葱姜末， 5g 盐，淀粉 5g，胡椒粉，生抽，胡椒粉" },
    { index := 4, instruction := "使用筷子在肉末中进行顺时针搅拌，搅拌到食材颜色没有明显对比（约 2 分钟）" },
    { index := 5, instruction := "将腌制好的冬瓜（会变软）使用清水洗三遍" },
    { index := 6, instruction := "拿出 1 片冬瓜片卷起来，并把肉塞进去" },
    { index := 7, instruction := "放入碟子中摆到碟子的边缘" },
    { index := 8, instruction := "打入 1 个鸡蛋到中间圆圈处" },
    { index := 9, instruction := "放入普通铁锅中水烧开后，蒸 15 分钟，盖上锅盖" },
    { index := 10, instruction := "开盖，取出蒸好的冬瓜酿肉" },
    { index := 11, instruction := "将冬瓜酿肉碟子的水倒入锅中，放入水淀粉，加入 50ml 清水倒入锅中烧开" },
    { index := 12, instruction := "淋到冬瓜酿肉上" }
  ]
}

theorem recipe_40e28313bc71_ingredients_nonempty :
    recipe_40e28313bc71.ingredients.isEmpty = false := by decide

theorem recipe_40e28313bc71_steps_nonempty :
    recipe_40e28313bc71.steps.isEmpty = false := by decide

theorem recipe_40e28313bc71_step_count :
    recipe_40e28313bc71.steps.length = 12 := by decide

theorem recipe_40e28313bc71_steps_ordered :
    orderedFrom 1 recipe_40e28313bc71.steps = true := by decide

theorem recipe_40e28313bc71_executes_to_terminal :
    executesToTerminal recipe_40e28313bc71 = true := by decide

theorem recipe_40e28313bc71_kernel_certificate :
    kernelCertified recipe_40e28313bc71 = true := by decide

end LeanToCook.SourceCatalog
