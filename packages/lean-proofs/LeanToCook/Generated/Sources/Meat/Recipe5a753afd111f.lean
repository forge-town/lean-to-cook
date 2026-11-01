/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 台式卤肉饭 · dishes/meat_dish/台式卤肉饭/台式卤肉饭.md -/
def recipe_5a753afd111f : Recipe := {
  id := "5a753afd111f"
  title := "台式卤肉饭"
  category := "meat"
  sourcePath := "dishes/meat_dish/台式卤肉饭/台式卤肉饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "红葱头（火葱）",
    "带皮五花肉 （可用猪绞肉代替）",
    "鸡蛋（可选）",
    "食用油",
    "生抽酱油",
    "米酒（可用料酒代替）",
    "大蒜",
    "香叶",
    "八角",
    "冰糖",
    "白胡椒粉",
    "五香粉（可选）",
    "米饭"
  ]
  steps := [
    { index := 1, instruction := "带皮五花肉切成 $0.7cm（长）\\times 0.7cm（宽） \\times 2.5cm（高）$ 的细长条" },
    { index := 2, instruction := "红葱头、大蒜切末备用" },
    { index := 3, instruction := "鸡蛋煮熟剥壳，并用刀划破蛋白（便于入味），备用。" },
    { index := 4, instruction := "大火热锅，锅内放入 15 ml 食用油，让油滑满锅底即可。" },
    { index := 5, instruction := "放入五花肉条，翻炒至肉色稍微变白，沿锅边淋入米酒 10ml 。继续翻炒至五花肉不再出油。" },
    { index := 6, instruction := "将切好的红葱头加入锅中，翻炒 1 分钟爆出油葱香味。" },
    { index := 7, instruction := "将切好的红葱头加入锅中，翻炒 30 秒。" },
    { index := 8, instruction := "把猪肉推到旁边，放入冰糖加热到融化冒泡变成焦糖，再把猪肉一起翻拌，让焦糖均匀附着。" },
    { index := 9, instruction := "加入生抽炒出香气。" },
    { index := 10, instruction := "呛入米酒 25 ml ，水加到淹过猪肉，加入白胡椒粉、五香粉、八角、香叶、水煮蛋，沸腾后转小火卤 1 小时。" },
    { index := 11, instruction := "1 小时后，开大火收汁直到酱汁浓稠，呈现有光泽的琥珀色，即完成。" },
    { index := 12, instruction := "炖煮结束后，乘一碗米饭，将软烂的卤肉浇在米饭上，并加上卤蛋，开始享用。" }
  ]
}

theorem recipe_5a753afd111f_ingredients_nonempty :
    recipe_5a753afd111f.ingredients.isEmpty = false := by decide

theorem recipe_5a753afd111f_steps_nonempty :
    recipe_5a753afd111f.steps.isEmpty = false := by decide

theorem recipe_5a753afd111f_step_count :
    recipe_5a753afd111f.steps.length = 12 := by decide

theorem recipe_5a753afd111f_steps_ordered :
    orderedFrom 1 recipe_5a753afd111f.steps = true := by decide

theorem recipe_5a753afd111f_executes_to_terminal :
    executesToTerminal recipe_5a753afd111f = true := by decide

theorem recipe_5a753afd111f_kernel_certificate :
    kernelCertified recipe_5a753afd111f = true := by decide

end LeanToCook.SourceCatalog
