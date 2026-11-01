/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 玉米排骨汤 · dishes/soup/玉米排骨汤/玉米排骨汤.md -/
def recipe_38f5fbfaae40 : Recipe := {
  id := "38f5fbfaae40"
  title := "玉米排骨汤"
  category := "soup"
  sourcePath := "dishes/soup/玉米排骨汤/玉米排骨汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨",
    "玉米",
    "胡箩卜",
    "生姜",
    "大葱",
    "食用油",
    "醋",
    "料酒",
    "黑胡椒粉",
    "食用盐",
    "砂锅（没有的话，用铁锅也行）"
  ]
  steps := [
    { index := 1, instruction := "大葱切成 3-4cm 的大段，用刀背拍一下" },
    { index := 2, instruction := "玉米剁成小块" },
    { index := 3, instruction := "胡箩卜切成滚刀块" },
    { index := 4, instruction := "生姜去皮切大片" },
    { index := 5, instruction := "新鲜的排骨砍成小块" },
    { index := 6, instruction := "排骨凉水下锅，放入大葱、生姜、料酒开始焯水，大火烧开，撇去浮沫，捞出排骨，沥干水分" },
    { index := 7, instruction := "热锅凉油，切大片的生姜和排骨一起下锅煸炒，待排骨表面微微焦黄，放入醋（可加速肉质软烂），继续煸炒一分钟" },
    { index := 8, instruction := "冲入开水，一次给足，之后就不要再加了，大火烧开" },
    { index := 9, instruction := "先下入玉米，放入胡椒粉，盖盖小火炖二十分钟，然后放入胡萝卜，盖盖继续小火炖四十分钟" },
    { index := 10, instruction := "调味很简单，出锅前三分钟，除了盐什么都不用放，最后撒上一把小葱花即可" }
  ]
}

theorem recipe_38f5fbfaae40_ingredients_nonempty :
    recipe_38f5fbfaae40.ingredients.isEmpty = false := by decide

theorem recipe_38f5fbfaae40_steps_nonempty :
    recipe_38f5fbfaae40.steps.isEmpty = false := by decide

theorem recipe_38f5fbfaae40_step_count :
    recipe_38f5fbfaae40.steps.length = 10 := by decide

theorem recipe_38f5fbfaae40_steps_ordered :
    orderedFrom 1 recipe_38f5fbfaae40.steps = true := by decide

theorem recipe_38f5fbfaae40_executes_to_terminal :
    executesToTerminal recipe_38f5fbfaae40 = true := by decide

theorem recipe_38f5fbfaae40_kernel_certificate :
    kernelCertified recipe_38f5fbfaae40 = true := by decide

end LeanToCook.SourceCatalog
