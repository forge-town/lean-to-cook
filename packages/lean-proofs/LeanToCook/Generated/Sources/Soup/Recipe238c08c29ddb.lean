/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金针菇汤 · dishes/soup/金针菇汤.md -/
def recipe_238c08c29ddb : Recipe := {
  id := "238c08c29ddb"
  title := "金针菇汤"
  category := "soup"
  sourcePath := "dishes/soup/金针菇汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金针菇",
    "鸡蛋（如需要）"
  ]
  steps := [
    { index := 1, instruction := "金针菇徒手掰散，越散越好不然容易藏牙，洗净备用。" },
    { index := 2, instruction := "用菜刀或者水果刀将上述金针菇段段切，可依据个人喜好，但长度不宜超过 5 cm。" },
    { index := 3, instruction := "将金针菇放入锅中，加水没过约食材总高度 1.1 倍，沸腾后等待 3 分钟。" },
    { index := 4, instruction := "加入味精和食盐并搅拌。" },
    { index := 5, instruction := "继续加热约 30 秒，关火装盘。" }
  ]
}

theorem recipe_238c08c29ddb_ingredients_nonempty :
    recipe_238c08c29ddb.ingredients.isEmpty = false := by decide

theorem recipe_238c08c29ddb_steps_nonempty :
    recipe_238c08c29ddb.steps.isEmpty = false := by decide

theorem recipe_238c08c29ddb_step_count :
    recipe_238c08c29ddb.steps.length = 5 := by decide

theorem recipe_238c08c29ddb_steps_ordered :
    orderedFrom 1 recipe_238c08c29ddb.steps = true := by decide

theorem recipe_238c08c29ddb_executes_to_terminal :
    executesToTerminal recipe_238c08c29ddb = true := by decide

theorem recipe_238c08c29ddb_kernel_certificate :
    kernelCertified recipe_238c08c29ddb = true := by decide

end LeanToCook.SourceCatalog
