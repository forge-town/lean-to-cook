/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 山西过油肉 · dishes/meat_dish/山西过油肉.md -/
def recipe_16663c525e6b : Recipe := {
  id := "16663c525e6b"
  title := "山西过油肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/山西过油肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪里脊",
    "蒜苔",
    "盐",
    "酱油",
    "葱姜蒜",
    "鸡蛋",
    "淀粉",
    "食用油",
    "木耳",
    "葱头",
    "料酒",
    "陈醋",
    "花椒粉",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "木耳提前泡发好，如果着急可以用热水泡发。" },
    { index := 2, instruction := "猪里脊切片放入碗中，加 20ml 生抽、料酒、花椒粉，打入一个鸡蛋，拿自己的小手搅拌均匀，加入淀粉（建议红薯淀粉）拌匀，倒入 300ml 食用油封浆，腌制 15 分钟。" },
    { index := 3, instruction := "蒜苔切段大约 3cm，葱头切菱形块备用。" },
    { index := 4, instruction := "起锅烧油油要多一点，油温五成热，下入腌制好的肉片，将肉片打散，捞出控油备用。" },
    { index := 5, instruction := "将锅中多余油倒出，留 10ml 油炒菜，油温七成热" },
    { index := 6, instruction := "下入葱姜蒜爆香，先下蒜苔炒至断生，再下入木耳葱头，加入生抽，花椒粉，翻炒几下将之前炸好的肉片下入翻炒" },
    { index := 7, instruction := "加 10g 的盐，起锅前加 10ml 的醋和鸡精，起锅装盘。" }
  ]
}

theorem recipe_16663c525e6b_ingredients_nonempty :
    recipe_16663c525e6b.ingredients.isEmpty = false := by decide

theorem recipe_16663c525e6b_steps_nonempty :
    recipe_16663c525e6b.steps.isEmpty = false := by decide

theorem recipe_16663c525e6b_step_count :
    recipe_16663c525e6b.steps.length = 7 := by decide

theorem recipe_16663c525e6b_steps_ordered :
    orderedFrom 1 recipe_16663c525e6b.steps = true := by decide

theorem recipe_16663c525e6b_executes_to_terminal :
    executesToTerminal recipe_16663c525e6b = true := by decide

theorem recipe_16663c525e6b_kernel_certificate :
    kernelCertified recipe_16663c525e6b = true := by decide

end LeanToCook.SourceCatalog
