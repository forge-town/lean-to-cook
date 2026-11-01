/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 老友猪肉粉 · dishes/staple/老友猪肉粉/老友猪肉粉.md -/
def recipe_00350cbfad20 : Recipe := {
  id := "00350cbfad20"
  title := "老友猪肉粉"
  category := "staple"
  sourcePath := "dishes/staple/老友猪肉粉/老友猪肉粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米粉",
    "猪肉",
    "酸笋",
    "剁椒",
    "豆豉",
    "大蒜",
    "料酒",
    "生抽",
    "白糖",
    "米醋",
    "盐",
    "油",
    "生粉",
    "胡椒粉"
  ]
  steps := [
    { index := 1, instruction := "全部猪肉用料酒、盐、生抽、生粉、胡椒粉倒在一个碗里调味，备用" },
    { index := 2, instruction := "热锅不放油，下全部酸笋把水份炒干，炒干的酸笋中间留点空间" },
    { index := 3, instruction := "放入 10ml - 15ml 食用油与全部大蒜、 剁椒、 豆豉到炒干的酸笋中间，全部推到中间炒出香味" },
    { index := 4, instruction := "放入全部调味好的猪肉，持续放入 10ml 生抽炒一分钟" },
    { index := 5, instruction := "放入 5ml 米醋、 10ml 生抽、450ml 清水一起煮开" },
    { index := 6, instruction := "水煮开后，放入温水泡好的米粉，继续煮 3 分钟就可以盛盘" }
  ]
}

theorem recipe_00350cbfad20_ingredients_nonempty :
    recipe_00350cbfad20.ingredients.isEmpty = false := by decide

theorem recipe_00350cbfad20_steps_nonempty :
    recipe_00350cbfad20.steps.isEmpty = false := by decide

theorem recipe_00350cbfad20_step_count :
    recipe_00350cbfad20.steps.length = 6 := by decide

theorem recipe_00350cbfad20_steps_ordered :
    orderedFrom 1 recipe_00350cbfad20.steps = true := by decide

theorem recipe_00350cbfad20_executes_to_terminal :
    executesToTerminal recipe_00350cbfad20 = true := by decide

theorem recipe_00350cbfad20_kernel_certificate :
    kernelCertified recipe_00350cbfad20 = true := by decide

end LeanToCook.SourceCatalog
