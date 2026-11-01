/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 中式馅饼 · dishes/staple/中式馅饼/中式馅饼.md -/
def recipe_ceb4b4a04f90 : Recipe := {
  id := "ceb4b4a04f90"
  title := "中式馅饼"
  category := "staple"
  sourcePath := "dishes/staple/中式馅饼/中式馅饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面粉（非自发粉）",
    "肉沫",
    "油",
    "盐",
    "糖",
    "生粉",
    "酱油",
    "风味调料（如鸡粉、孜然、椒盐，可选）",
    "蒜头",
    "大葱",
    "鸡蛋（可选）",
    "胡萝卜（可选）",
    "平底锅",
    "炒锅（可以使用同一个平底锅替代）"
  ]
  steps := [
    { index := 1, instruction := "取肉沫（解冻），加入 1/2 所有上述调料（油、盐、糖、酱油、风味调料）和全部的生粉，搅拌均匀，腌制 30 分钟。" },
    { index := 2, instruction := "将面粉加入碗中，加入鸡蛋，加入剩下 1/2 所有上述调料，加入相当于面粉 1/2 的水（使得面粉相对粘稠但可以流动），搅拌均匀。" },
    { index := 3, instruction := "蒜头切为蒜末。" },
    { index := 4, instruction := "大葱切段。" },
    { index := 5, instruction := "胡萝卜切末（作为馅料用，所以要求尽量细碎，可用乱刀）" },
    { index := 6, instruction := "热锅冷油，宽油起锅。" },
    { index := 7, instruction := "待油烧热后，放入蒜末爆香。" },
    { index := 8, instruction := "加入腌制的肉沫，翻炒，直至断生。" },
    { index := 9, instruction := "将胡萝卜末加入肉沫中一同翻炒，直至油被染为金黄色（这是为了萃取胡萝卜的风味）。" },
    { index := 10, instruction := "关火。冷却 2 分钟。" },
    { index := 11, instruction := "将炒好的肉沫倒入生面糊中，搅匀。" },
    { index := 12, instruction := "重新开火，平底锅铺底油。" },
    { index := 13, instruction := "调至小火，将面糊倒入锅中均匀铺满。保证厚度不要过高。可以端起锅，让面糊流过锅底来完成这一操作。" },
    { index := 14, instruction := "在饼的表面尚为液态时，撒上大葱段。" },
    { index := 15, instruction := "保持小火，直到底面凝固。" },
    { index := 16, instruction := "将饼翻面，继续小火煎烤，直至另一侧凝固。" },
    { index := 17, instruction := "之后，每一面再额外煎 20 秒。" },
    { index := 18, instruction := "关火出锅。" }
  ]
}

theorem recipe_ceb4b4a04f90_ingredients_nonempty :
    recipe_ceb4b4a04f90.ingredients.isEmpty = false := by decide

theorem recipe_ceb4b4a04f90_steps_nonempty :
    recipe_ceb4b4a04f90.steps.isEmpty = false := by decide

theorem recipe_ceb4b4a04f90_step_count :
    recipe_ceb4b4a04f90.steps.length = 18 := by decide

theorem recipe_ceb4b4a04f90_steps_ordered :
    orderedFrom 1 recipe_ceb4b4a04f90.steps = true := by decide

theorem recipe_ceb4b4a04f90_executes_to_terminal :
    executesToTerminal recipe_ceb4b4a04f90 = true := by decide

theorem recipe_ceb4b4a04f90_kernel_certificate :
    kernelCertified recipe_ceb4b4a04f90 = true := by decide

end LeanToCook.SourceCatalog
