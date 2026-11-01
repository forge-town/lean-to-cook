/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 甜辣烤全翅 · dishes/meat_dish/甜辣烤全翅.md -/
def recipe_f37f90893dda : Recipe := {
  id := "f37f90893dda"
  title := "甜辣烤全翅"
  category := "meat"
  sourcePath := "dishes/meat_dish/甜辣烤全翅.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "空气炸锅",
    "鸡全翅",
    "生抽",
    "老抽",
    "蒜粉",
    "胡椒粉",
    "糖",
    "甜椒粉",
    "辣椒粉",
    "蚝油",
    "水",
    "油",
    "锡纸盘",
    "保鲜膜"
  ]
  steps := [
    { index := 1, instruction := "将 4 个新鲜鸡全翅取出，在翅中两根骨头之间用刀划开表皮，正反面各一刀" },
    { index := 2, instruction := "将 4 个鸡全翅放入碗中，加入生抽 45ml ， 老抽 15ml ， 蒜粉 10g ， 胡椒粉 5g ， 糖 10g ， 甜椒粉 10g ，辣椒粉 5g ， 蚝油 15ml ， 水 20ml 以及油 10ml" },
    { index := 3, instruction := "用勺子将酱汁均匀的抹在鸡全翅上，尤其是翅中的刀口处，大约花费 3 分钟" },
    { index := 4, instruction := "用保鲜膜盖住防油腌制中鸡全翅的碗，放入冰箱冷藏格静置 120 分钟" },
    { index := 5, instruction := "取出鸡全翅，锡纸盘中放入鸡全翅 4 个，将碗中残余酱料均匀倒在鸡全翅上" },
    { index := 6, instruction := "锡纸盘放入空气炸锅的烤篮上，用 200 摄氏度烤 25 分钟" },
    { index := 7, instruction := "打开空气炸锅，小心取出锡纸盘，将鸡全翅翻面" },
    { index := 8, instruction := "继续 200 摄氏度烤 25 分钟" },
    { index := 9, instruction := "取出即可食用" }
  ]
}

theorem recipe_f37f90893dda_ingredients_nonempty :
    recipe_f37f90893dda.ingredients.isEmpty = false := by decide

theorem recipe_f37f90893dda_steps_nonempty :
    recipe_f37f90893dda.steps.isEmpty = false := by decide

theorem recipe_f37f90893dda_step_count :
    recipe_f37f90893dda.steps.length = 9 := by decide

theorem recipe_f37f90893dda_steps_ordered :
    orderedFrom 1 recipe_f37f90893dda.steps = true := by decide

theorem recipe_f37f90893dda_executes_to_terminal :
    executesToTerminal recipe_f37f90893dda = true := by decide

theorem recipe_f37f90893dda_kernel_certificate :
    kernelCertified recipe_f37f90893dda = true := by decide

end LeanToCook.SourceCatalog
