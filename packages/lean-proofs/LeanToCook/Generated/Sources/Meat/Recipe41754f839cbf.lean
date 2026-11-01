/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 辣椒炒肉 · dishes/meat_dish/辣椒炒肉.md -/
def recipe_41754f839cbf : Recipe := {
  id := "41754f839cbf"
  title := "辣椒炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/辣椒炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青椒（吃辣的话推荐用杭椒，螺丝椒，不吃辣的用尖椒，甜椒）",
    "猪瘦肉",
    "盐",
    "生抽",
    "蚝油",
    "大蒜",
    "姜",
    "酱油（可选）",
    "豆豉（可选）"
  ]
  steps := [
    { index := 1, instruction := "将青椒洗净，去除青椒把以及青椒籽，再用滚刀手法切好备用。" },
    { index := 2, instruction := "大蒜用刀拍一下，再横切成蒜瓣，生姜切碎成姜末。" },
    { index := 3, instruction := "将猪瘦肉切成肉片（顺着猪肉的纹理切，即刀和肉的纹理呈水平线，出来的肉片，纹路呈“川”字）。" },
    { index := 4, instruction := "将切好的猪肉洗净，放入空碗，再加入计算好的生抽、蚝油、盐搅拌均匀，腌制 10 分钟。" },
    { index := 5, instruction := "热锅，不用倒油，把切好的青椒放入锅中，大火干煸至虎皮状后，再加 2g盐继续翻炒 1 分钟 后捞起。" },
    { index := 6, instruction := "不用洗锅，大火热锅，加入份数  8ml油，等待 30s，加入蒜瓣、姜末翻炒 15s。" },
    { index := 7, instruction := "加入腌制好的猪肉倒入锅内翻炒 2 分钟，再加入干煸过的青椒翻炒 1 分钟。" },
    { index := 8, instruction := "根据个人口味喜好加入豆豉，最后加入酱油，继续翻炒 30s。" },
    { index := 9, instruction := "出锅，盛盘。" }
  ]
}

theorem recipe_41754f839cbf_ingredients_nonempty :
    recipe_41754f839cbf.ingredients.isEmpty = false := by decide

theorem recipe_41754f839cbf_steps_nonempty :
    recipe_41754f839cbf.steps.isEmpty = false := by decide

theorem recipe_41754f839cbf_step_count :
    recipe_41754f839cbf.steps.length = 9 := by decide

theorem recipe_41754f839cbf_steps_ordered :
    orderedFrom 1 recipe_41754f839cbf.steps = true := by decide

theorem recipe_41754f839cbf_executes_to_terminal :
    executesToTerminal recipe_41754f839cbf = true := by decide

theorem recipe_41754f839cbf_kernel_certificate :
    kernelCertified recipe_41754f839cbf = true := by decide

end LeanToCook.SourceCatalog
