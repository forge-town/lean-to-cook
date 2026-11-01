/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 青椒酿 · dishes/meat_dish/青椒酿/青椒酿.md -/
def recipe_f3bcbbe6cbfb : Recipe := {
  id := "f3bcbbe6cbfb"
  title := "青椒酿"
  category := "meat"
  sourcePath := "dishes/meat_dish/青椒酿/青椒酿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青椒（6-8 个，选笔直、肉厚的，不要用灯笼菜椒）",
    "猪肉（250g，肥瘦比例 3:7 的前夹肉最佳）",
    "葱（2 根）",
    "生姜（1 小块）",
    "生抽",
    "老抽",
    "食盐",
    "食用油",
    "淀粉（可选，涂青椒内壁防粘、勾芡收汁）",
    "大蒜（可选，3-4 瓣）",
    "蚝油（可选）",
    "料酒（可选）",
    "鸡蛋（可选）",
    "白胡椒粉（可选）",
    "白糖（可选）"
  ]
  steps := [
    { index := 1, instruction := "猪肉洗净剁成肉馅（或用绞肉机），姜切末，葱切葱花" },
    { index := 2, instruction := "肉馅中加入姜末、葱花、生抽 15ml、老抽 5ml、食盐 3g，搅拌均匀" },
    { index := 3, instruction := "可选加入：料酒 10ml、蚝油 10ml、鸡蛋 1 个、淀粉 5g、白胡椒粉 2g、白糖 5g" },
    { index := 4, instruction := "朝一个方向搅拌肉馅至粘稠上劲，腌制 10 分钟" },
    { index := 5, instruction := "青椒洗净，去蒂，用筷子小心挖去内部的籽和白筋，保持青椒完整不破" },
    { index := 6, instruction := "可选在青椒内壁撒干淀粉约 5g，摇晃均匀，帮助肉馅粘附不脱落" },
    { index := 7, instruction := "将腌好的肉馅用筷子或裱花袋塞入青椒中，尽量填满但不要太紧以防撑破" },
    { index := 8, instruction := "全部酿好后备用" },
    { index := 9, instruction := "碗中加入生抽 15ml、老抽 5ml、清水 100ml，搅拌均匀" },
    { index := 10, instruction := "可选加入淀粉 5g，使汤汁更浓稠" },
    { index := 11, instruction := "热锅，倒入 30ml 食用油，油温五六成热时放入酿好的青椒（肉面朝下先煎）" },
    { index := 12, instruction := "中小火慢煎，翻面使青椒各面都煎至表皮起皱呈虎皮色，盛出备用" },
    { index := 13, instruction := "锅留底油，可选放入蒜末爆香" },
    { index := 14, instruction := "倒入调好的酱汁，烧开后放入煎好的青椒" },
    { index := 15, instruction := "转中小火，盖上锅盖焖煮 5-8 分钟，至汤汁浓稠、青椒变软" },
    { index := 16, instruction := "开盖大火收汁至汤汁油亮包裹青椒，即可出锅装盘" },
    { index := 17, instruction := "虾仁 250g 去虾线，用刀背拍成虾泥（保留一定颗粒感，口感更好，直接买成品虾滑得了，买那种三角形的裱花一样直接塞进去）" },
    { index := 18, instruction := "虾滑馅调味：姜末 5g、食盐 2g、淀粉 5g、生抽 10ml" },
    { index := 19, instruction := "可选加入：料酒 5ml、白胡椒粉 1g、蛋清半个" },
    { index := 20, instruction := "朝一个方向搅拌至虾滑上劲，腌制 10 分钟" },
    { index := 21, instruction := "后续酿入、煎制、焖煮步骤与猪肉版本一致" },
    { index := 22, instruction := "虾滑易熟，焖煮时间可缩短至 4-5 分钟" }
  ]
}

theorem recipe_f3bcbbe6cbfb_ingredients_nonempty :
    recipe_f3bcbbe6cbfb.ingredients.isEmpty = false := by decide

theorem recipe_f3bcbbe6cbfb_steps_nonempty :
    recipe_f3bcbbe6cbfb.steps.isEmpty = false := by decide

theorem recipe_f3bcbbe6cbfb_step_count :
    recipe_f3bcbbe6cbfb.steps.length = 22 := by decide

theorem recipe_f3bcbbe6cbfb_steps_ordered :
    orderedFrom 1 recipe_f3bcbbe6cbfb.steps = true := by decide

theorem recipe_f3bcbbe6cbfb_executes_to_terminal :
    executesToTerminal recipe_f3bcbbe6cbfb = true := by decide

theorem recipe_f3bcbbe6cbfb_kernel_certificate :
    kernelCertified recipe_f3bcbbe6cbfb = true := by decide

end LeanToCook.SourceCatalog
