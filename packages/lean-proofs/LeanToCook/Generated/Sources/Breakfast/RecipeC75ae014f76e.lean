/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 茶叶蛋 · dishes/breakfast/茶叶蛋.md -/
def recipe_c75ae014f76e : Recipe := {
  id := "c75ae014f76e"
  title := "茶叶蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/茶叶蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "八角",
    "香叶",
    "桂皮",
    "茴香",
    "冰糖",
    "红茶",
    "生抽",
    "老抽",
    "食盐"
  ]
  steps := [
    { index := 1, instruction := "用冷水将鸡蛋煮熟，大火大约 8 分钟（根据自家厨具决定）" },
    { index := 2, instruction := "鸡蛋捞出，过冷水" },
    { index := 3, instruction := "将鸡蛋互相碰撞，使每个鸡蛋产生裂缝" },
    { index := 4, instruction := "将鸡蛋下锅，放入八角，香叶，桂皮，茴香，冰糖，红茶，生抽，老抽，食盐" },
    { index := 5, instruction := "加水直至没过鸡蛋" },
    { index := 6, instruction := "大火煮开之后，转中小火煮 15 分钟" }
  ]
}

theorem recipe_c75ae014f76e_ingredients_nonempty :
    recipe_c75ae014f76e.ingredients.isEmpty = false := by decide

theorem recipe_c75ae014f76e_steps_nonempty :
    recipe_c75ae014f76e.steps.isEmpty = false := by decide

theorem recipe_c75ae014f76e_step_count :
    recipe_c75ae014f76e.steps.length = 6 := by decide

theorem recipe_c75ae014f76e_steps_ordered :
    orderedFrom 1 recipe_c75ae014f76e.steps = true := by decide

theorem recipe_c75ae014f76e_executes_to_terminal :
    executesToTerminal recipe_c75ae014f76e = true := by decide

theorem recipe_c75ae014f76e_kernel_certificate :
    kernelCertified recipe_c75ae014f76e = true := by decide

end LeanToCook.SourceCatalog
