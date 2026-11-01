/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 荷兰豆炒腊肠 · dishes/meat_dish/荷兰豆炒腊肠/荷兰豆炒腊肠.md -/
def recipe_48dd3251882e : Recipe := {
  id := "48dd3251882e"
  title := "荷兰豆炒腊肠"
  category := "meat"
  sourcePath := "dishes/meat_dish/荷兰豆炒腊肠/荷兰豆炒腊肠.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "荷兰豆",
    "腊肠",
    "生抽",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "把荷兰豆去掉蒂，有时间的也可以同时把尾部去掉" },
    { index := 2, instruction := "买腊肠之前可以问老板是生的还是熟的，如果是生的，需要提前蒸一下，如果是熟的可以直接使用" },
    { index := 3, instruction := "把荷兰豆清洗一下，然后焯一下水，大概 45s，荷兰豆焯至变色即可，捞出过凉水备用" },
    { index := 4, instruction := "热锅，锅内放入大约 10ml 食用油。等待 10 秒让油温升高" },
    { index := 5, instruction := "放入腊肠，保持翻炒至腊肠微微卷边，注意这里一定要保持小火，小到不能小的那种，不然容易糊" },
    { index := 6, instruction := "放入荷兰豆，转为中大火，翻炒 30s 放入生抽，接着再翻炒 20-30s 即可" }
  ]
}

theorem recipe_48dd3251882e_ingredients_nonempty :
    recipe_48dd3251882e.ingredients.isEmpty = false := by decide

theorem recipe_48dd3251882e_steps_nonempty :
    recipe_48dd3251882e.steps.isEmpty = false := by decide

theorem recipe_48dd3251882e_step_count :
    recipe_48dd3251882e.steps.length = 6 := by decide

theorem recipe_48dd3251882e_steps_ordered :
    orderedFrom 1 recipe_48dd3251882e.steps = true := by decide

theorem recipe_48dd3251882e_executes_to_terminal :
    executesToTerminal recipe_48dd3251882e = true := by decide

theorem recipe_48dd3251882e_kernel_certificate :
    kernelCertified recipe_48dd3251882e = true := by decide

end LeanToCook.SourceCatalog
