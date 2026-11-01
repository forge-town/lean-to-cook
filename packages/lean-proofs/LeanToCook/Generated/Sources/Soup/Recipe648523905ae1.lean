/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 皮蛋瘦肉粥 · dishes/soup/皮蛋瘦肉粥.md -/
def recipe_648523905ae1 : Recipe := {
  id := "648523905ae1"
  title := "皮蛋瘦肉粥"
  category := "soup"
  sourcePath := "dishes/soup/皮蛋瘦肉粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "饮用水",
    "皮蛋（松花蛋）",
    "瘦肉",
    "大米",
    "小葱",
    "香菜",
    "生菜",
    "生姜",
    "酱油",
    "蚝油",
    "盐",
    "胡椒粉",
    "食用油",
    "电饭锅",
    "小碗若干"
  ]
  steps := [
    { index := 1, instruction := "大米 - 洗净 - 放入电饭锅内胆 - 加入 1 升 饮用水" },
    { index := 2, instruction := "瘦肉 - 洗净 - 简易晾去水分 - 加入 10ml 食用油 - 揉搓均匀 - 放入电饭锅内胆" },
    { index := 3, instruction := "皮蛋 - 去壳 - 洗净 - 对半切开 - 分离蛋白蛋黄 - 蛋白简单切碎块 - 蛋黄揉碎 - 放入电饭锅内胆" },
    { index := 4, instruction := "生姜 - 洗净 - 削皮 - 去除枯黄枯黑无法食用部分 - 切丝 - 放入电饭锅内胆" },
    { index := 5, instruction := "小葱 - 洗净 - 去除根部 - 去除枯黄枯黑无法食用部分 - 切碎 - 放入小碗备用" },
    { index := 6, instruction := "香菜 - 洗净 - 去除根部 - 去除枯黄枯黑无法食用部分 - 切碎 - 放入小碗备用" },
    { index := 7, instruction := "生菜 - 洗净 - 去除根部 - 去除枯黄枯黑无法食用部分 - 切碎 - 放入小碗备用" },
    { index := 8, instruction := "酱油 + 蚝油 + 盐 + 胡椒粉 - 搅拌均匀 - 放入小碗备用" },
    { index := 9, instruction := "主料 - 使用电饭锅煮粥模式煮熟" },
    { index := 10, instruction := "配料 - 待主料煮熟后，生菜单独过一次热水，并与其余配料一同开盖加入主料中搅拌均匀" },
    { index := 11, instruction := "酱料 - 待主料煮熟后，与其余配料一同开盖加入主料中搅拌均匀" }
  ]
}

theorem recipe_648523905ae1_ingredients_nonempty :
    recipe_648523905ae1.ingredients.isEmpty = false := by decide

theorem recipe_648523905ae1_steps_nonempty :
    recipe_648523905ae1.steps.isEmpty = false := by decide

theorem recipe_648523905ae1_step_count :
    recipe_648523905ae1.steps.length = 11 := by decide

theorem recipe_648523905ae1_steps_ordered :
    orderedFrom 1 recipe_648523905ae1.steps = true := by decide

theorem recipe_648523905ae1_executes_to_terminal :
    executesToTerminal recipe_648523905ae1 = true := by decide

theorem recipe_648523905ae1_kernel_certificate :
    kernelCertified recipe_648523905ae1 = true := by decide

end LeanToCook.SourceCatalog
