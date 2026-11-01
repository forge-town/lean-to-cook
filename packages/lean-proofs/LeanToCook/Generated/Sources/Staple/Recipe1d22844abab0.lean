/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 滕州菜煎饼 · dishes/staple/滕州菜煎饼.md -/
def recipe_1d22844abab0 : Recipe := {
  id := "1d22844abab0"
  title := "滕州菜煎饼"
  category := "staple"
  sourcePath := "dishes/staple/滕州菜煎饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白面煎饼（市售山东煎饼，或自制）",
    "白菜",
    "粉条（干）",
    "豆腐",
    "胡萝卜",
    "韭菜（可选）",
    "鸡蛋",
    "火腿肠（可选）",
    "食用油",
    "食盐",
    "味精（可选）",
    "孜然粉",
    "辣椒粉（可选）",
    "黑胡椒粉",
    "鏊子 或 平底不粘锅（直径不小于 28 cm）"
  ]
  steps := [
    { index := 1, instruction := "粉条放入温水中浸泡 10 分钟至变软，捞出沥干，切成不超过 5 cm 的段，备用" },
    { index := 2, instruction := "白菜洗净，切成不超过 1 cm 宽的细丝；胡萝卜去皮，切成不超过 1 cm 的细丝；豆腐切成不超过 1 cm 见方的小丁；韭菜洗净，切成不超过 1 cm 的段。全部放入拌碗" },
    { index := 3, instruction := "在拌碗中依次加入食用油 15 ml、食盐 2 g、味精 1 g、孜然粉 2 g、黑胡椒粉 1 g、辣椒粉 2 g，用筷子搅拌均匀，使蔬菜表面均匀裹上调料，备用" },
    { index := 4, instruction := "平底锅（或鏊子）中火预热，倒入食用油 5 ml 并转动锅体使油铺满锅面。打入鸡蛋，用锅铲将蛋清与蛋黄打散，摊成比煎饼略小的圆形薄蛋皮" },
    { index := 5, instruction := "取 1 张煎饼平铺在蛋皮上，使蛋皮贴服于煎饼，将煎饼连蛋皮翻面（蛋皮朝上），转小火备用" },
    { index := 6, instruction := "将拌好的蔬菜均匀铺在煎饼（蛋皮朝上）表面，边缘留约 1 cm 不铺菜，防止折叠时漏出" },
    { index := 7, instruction := "取第 2 张煎饼覆盖在蔬菜上方，用锅铲轻轻按压使两层煎饼贴合" },
    { index := 8, instruction := "开中小火加热 2 分钟至底部微黄，用锅铲将整张菜煎饼翻面，继续加热 2 分钟至另一面微黄、油润" },
    { index := 9, instruction := "转最小火继续加热 1 分钟，至两面均呈金黄色、蔬菜熟透（可用筷子插入中心，确认无生蔬菜的阻力）" },
    { index := 10, instruction := "关火，将菜煎饼两边向中间折叠成约 10 cm 宽的长方形，用锅铲或刀从中间一分为二，盛盘" }
  ]
}

theorem recipe_1d22844abab0_ingredients_nonempty :
    recipe_1d22844abab0.ingredients.isEmpty = false := by decide

theorem recipe_1d22844abab0_steps_nonempty :
    recipe_1d22844abab0.steps.isEmpty = false := by decide

theorem recipe_1d22844abab0_step_count :
    recipe_1d22844abab0.steps.length = 10 := by decide

theorem recipe_1d22844abab0_steps_ordered :
    orderedFrom 1 recipe_1d22844abab0.steps = true := by decide

theorem recipe_1d22844abab0_executes_to_terminal :
    executesToTerminal recipe_1d22844abab0 = true := by decide

theorem recipe_1d22844abab0_kernel_certificate :
    kernelCertified recipe_1d22844abab0 = true := by decide

end LeanToCook.SourceCatalog
