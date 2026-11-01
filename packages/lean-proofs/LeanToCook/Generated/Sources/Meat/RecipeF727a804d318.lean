/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 宫保鸡丁 · dishes/meat_dish/宫保鸡丁/宫保鸡丁.md -/
def recipe_f727a804d318 : Recipe := {
  id := "f727a804d318"
  title := "宫保鸡丁"
  category := "meat"
  sourcePath := "dishes/meat_dish/宫保鸡丁/宫保鸡丁.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "手枪腿（或者鸡胸脯肉）",
    "大葱",
    "干辣椒（或者二荆条）",
    "熟花生",
    "生抽酱油",
    "香醋",
    "白糖",
    "料酒",
    "盐",
    "鸡精",
    "淀粉",
    "植物油",
    "芝麻油",
    "油泼辣子",
    "莴笋",
    "生花生",
    "豆瓣酱"
  ]
  steps := [
    { index := 1, instruction := "手枪腿用剪刀去骨，鸡肉面用刀背拍打一遍，切条后切至 1.5cm 见方肉丁；泡于清水 10 分钟，捞出控干备用（若是鸡胸脯肉，则可以直接进行切丁以及之后的动作）" },
    { index := 2, instruction := "取大葱葱绿与姜片 5g 于碗中，倒入 50g 开水备用；葱白切 1.5cm 圆粒备用；取花生放入微波炉高火 5 分钟焙干备用" },
    { index := 3, instruction := "鸡丁中加入盐 2g，老抽酱油 5g，料酒 15g，淀粉 15g 搅拌均匀，至微微发干；缓慢加入部分葱姜水，搅拌鸡丁至粘手；保鲜膜密封，放入冰箱腌制 1 小时" },
    { index := 4, instruction := "干辣椒切段；起锅，大火烧热转小火；放入干辣椒焙干至微微发糊，捞起备用；花椒焙干至有香味，捞起备用" },
    { index := 5, instruction := "转大火，倒入 20g 植物油，7 成热（竹筷子起泡）下入鸡丁，煎至上面开始发白，用锅铲翻面，煎 30s 后翻炒均匀" },
    { index := 6, instruction := "下入葱粒翻炒，加入余下葱姜水不够 100g 再加一点清水（务必是热水）；盖上锅盖，转中小火焖 2 分钟；" },
    { index := 7, instruction := "转大火，下入熟花生，干辣椒和花椒；加入鸡精 2g，香醋 5g，白糖 2g，翻炒均匀；" },
    { index := 8, instruction := "淀粉 10g 加 50g 清水调成水淀粉，加入锅中，翻炒均匀，收汁到自己想要的浓度" },
    { index := 9, instruction := "关火，淋入芝麻油 10g，即可出锅" },
    { index := 10, instruction := "莴笋去皮切至 1cm 见方的小块，备用；" },
    { index := 11, instruction := "二荆条切成 1cm 长段；" },
    { index := 12, instruction := "手枪腿用剪刀去骨，鸡肉面用刀背拍打一遍，切条后切至 1.5cm 见方肉丁；泡于清水 10 分钟，捞出控干备用（若是鸡胸脯肉，则可以直接进行切丁以及之后的动作）；" },
    { index := 13, instruction := "取大葱葱绿与姜片 5g 于碗中，倒入 50g 开水备用；葱白切 1.5cm 圆粒备用" },
    { index := 14, instruction := "鸡丁中加入盐 2g，老抽酱油 5g，料酒 15g，淀粉 15g 搅拌均匀，至微微发干；缓慢加入部分葱姜水，搅拌鸡丁至粘手；保鲜膜密封，放入冰箱腌制 1 小时" },
    { index := 15, instruction := "转中火，倒入 20g 植物油，放入生花生翻炒至其表面微微焦糊，捞起花生但是油留在锅内；" },
    { index := 16, instruction := "继续加热，7 成热（竹筷子起泡）下入鸡丁，放入豆瓣酱，翻炒大概 1 分钟；" },
    { index := 17, instruction := "加入备好的莴笋丁，继续翻炒 1 分钟；" },
    { index := 18, instruction := "下入葱粒翻炒，加入余下葱姜水不够 100g 再加一点清水（务必是热水）；加入二荆条段；盖上锅盖，转中小火焖 2 分钟；" },
    { index := 19, instruction := "转大火，下入先前捞起来备用的花生，花椒；加入鸡精 2g，香醋 5g，白糖 2g，翻炒均匀；" },
    { index := 20, instruction := "淀粉 10g 加 50g 清水调成水淀粉，加入锅中，翻炒均匀，收汁到自己想要的浓度" },
    { index := 21, instruction := "关火，淋入芝麻油 10g 与油泼辣子 5g 再翻炒 10s，即可出锅" }
  ]
}

theorem recipe_f727a804d318_ingredients_nonempty :
    recipe_f727a804d318.ingredients.isEmpty = false := by decide

theorem recipe_f727a804d318_steps_nonempty :
    recipe_f727a804d318.steps.isEmpty = false := by decide

theorem recipe_f727a804d318_step_count :
    recipe_f727a804d318.steps.length = 21 := by decide

theorem recipe_f727a804d318_steps_ordered :
    orderedFrom 1 recipe_f727a804d318.steps = true := by decide

theorem recipe_f727a804d318_executes_to_terminal :
    executesToTerminal recipe_f727a804d318 = true := by decide

theorem recipe_f727a804d318_kernel_certificate :
    kernelCertified recipe_f727a804d318 = true := by decide

end LeanToCook.SourceCatalog
