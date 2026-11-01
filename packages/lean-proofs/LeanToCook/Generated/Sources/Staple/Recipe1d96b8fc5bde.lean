/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 可乐炒饭 · dishes/staple/可乐炒饭.md -/
def recipe_1d96b8fc5bde : Recipe := {
  id := "1d96b8fc5bde"
  title := "可乐炒饭"
  category := "staple"
  sourcePath := "dishes/staple/可乐炒饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米饭",
    "可乐（含糖或无糖均可）",
    "鸡蛋",
    "火腿肠（或午餐肉，可选）",
    "油",
    "生抽",
    "老抽",
    "蚝油",
    "豆瓣酱（可选）",
    "葱花",
    "胡椒粉（白胡椒、黑胡椒均可）"
  ]
  steps := [
    { index := 1, instruction := "将锅烧热后，加入 25 ml 油，放两个鸡蛋，煎至底部完全凝固" },
    { index := 2, instruction := "翻面，煎至两面完全凝固" },
    { index := 3, instruction := "关火，将鸡蛋取出，剪成 2-5 cm² 的小块后放回锅中（也可以直接用锅铲铲碎）" },
    { index := 4, instruction := "重新开火，倒入可乐、生抽、老抽、豆瓣酱、蚝油，搅拌均匀" },
    { index := 5, instruction := "加热到锅内液体剩 1/3，倒入米饭和火腿肠翻炒" },
    { index := 6, instruction := "翻炒均匀后，改小火，锅内食物中心挖一个洞，打入 1 个鸡蛋，盖上锅盖，焖 2 分钟" },
    { index := 7, instruction := "开盖翻炒至第三颗鸡蛋熟透，撒上葱花和胡椒粉，出锅" }
  ]
}

theorem recipe_1d96b8fc5bde_ingredients_nonempty :
    recipe_1d96b8fc5bde.ingredients.isEmpty = false := by decide

theorem recipe_1d96b8fc5bde_steps_nonempty :
    recipe_1d96b8fc5bde.steps.isEmpty = false := by decide

theorem recipe_1d96b8fc5bde_step_count :
    recipe_1d96b8fc5bde.steps.length = 7 := by decide

theorem recipe_1d96b8fc5bde_steps_ordered :
    orderedFrom 1 recipe_1d96b8fc5bde.steps = true := by decide

theorem recipe_1d96b8fc5bde_executes_to_terminal :
    executesToTerminal recipe_1d96b8fc5bde = true := by decide

theorem recipe_1d96b8fc5bde_kernel_certificate :
    kernelCertified recipe_1d96b8fc5bde = true := by decide

end LeanToCook.SourceCatalog
