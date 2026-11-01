/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 昂刺鱼豆腐汤 · dishes/soup/昂刺鱼豆腐汤/昂刺鱼豆腐汤.md -/
def recipe_e511d3a4430a : Recipe := {
  id := "e511d3a4430a"
  title := "昂刺鱼豆腐汤"
  category := "soup"
  sourcePath := "dishes/soup/昂刺鱼豆腐汤/昂刺鱼豆腐汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "昂刺鱼或者沙光鱼",
    "豆腐",
    "香葱",
    "姜",
    "食用油",
    "料酒",
    "食用盐",
    "胡椒粉"
  ]
  steps := [
    { index := 1, instruction := "鱼处理好后洗净，（特别注意肚内的血丝、不洗干净会有腥味），放入大碗中，倒入料酒、10g 姜片、5g 盐，腌制 15 分钟" },
    { index := 2, instruction := "豆腐切块，放入凉水浸泡 5 分钟，捞出备用" },
    { index := 3, instruction := "煎鱼前，先用生姜片擦一下锅防止粘锅，倒入油（油量为 15ml  鱼的条数 ），烧热后放入鱼煎 23 分钟，期间需要晃动一下鱼，防止粘底，且需要翻一次身" },
    { index := 4, instruction := "待鱼全部煎好之后，倒入开水、5ml 料酒、姜片，小火转至大火，盖上锅盖、大火煮 10 分钟（水要稍微多一些，后面会蒸发掉一些）" },
    { index := 5, instruction := "见汤变白后倒入准备好的豆腐，调中火再煮 5 分钟，加入 10g 盐、3g 胡椒粉调味，最后撒上葱花出锅" }
  ]
}

theorem recipe_e511d3a4430a_ingredients_nonempty :
    recipe_e511d3a4430a.ingredients.isEmpty = false := by decide

theorem recipe_e511d3a4430a_steps_nonempty :
    recipe_e511d3a4430a.steps.isEmpty = false := by decide

theorem recipe_e511d3a4430a_step_count :
    recipe_e511d3a4430a.steps.length = 5 := by decide

theorem recipe_e511d3a4430a_steps_ordered :
    orderedFrom 1 recipe_e511d3a4430a.steps = true := by decide

theorem recipe_e511d3a4430a_executes_to_terminal :
    executesToTerminal recipe_e511d3a4430a = true := by decide

theorem recipe_e511d3a4430a_kernel_certificate :
    kernelCertified recipe_e511d3a4430a = true := by decide

end LeanToCook.SourceCatalog
