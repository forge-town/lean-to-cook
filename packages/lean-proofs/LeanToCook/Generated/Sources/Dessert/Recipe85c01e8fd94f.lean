/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炸鲜奶 · dishes/dessert/炸鲜奶/炸鲜奶.md -/
def recipe_85c01e8fd94f : Recipe := {
  id := "85c01e8fd94f"
  title := "炸鲜奶"
  category := "dessert"
  sourcePath := "dishes/dessert/炸鲜奶/炸鲜奶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛奶",
    "玉米淀粉",
    "低筋面粉或普通面粉",
    "面包糠",
    "鸡蛋",
    "白糖",
    "大约 20cm × 15cm 的耐热方形容器",
    "厨房纸"
  ]
  steps := [
    { index := 1, instruction := "从牛奶中取出 80ml，与玉米淀粉混合，搅拌至没有可见颗粒" },
    { index := 2, instruction := "将剩余的 170ml 牛奶和白糖倒入锅中，小火加热并持续搅拌，直至白糖完全溶解" },
    { index := 3, instruction := "再次搅匀玉米淀粉液，将其缓慢倒入锅中，同时持续搅拌" },
    { index := 4, instruction := "保持小火加热并不断搅拌约 3 - 5 分钟，直至奶糊浓稠，刮过锅底后留下的纹路能保持 3 秒不消失" },
    { index := 5, instruction := "在耐热容器内壁均匀涂抹约 2ml 食用油，倒入奶糊并将表面抹平，使奶糊厚度约为 2cm" },
    { index := 6, instruction := "奶糊冷却至室温后盖好，放入冰箱冷藏至少 2 小时；轻按表面不粘手且整体不会流动时即可取出" },
    { index := 7, instruction := "将定型后的奶糊脱模，切成约 6cm × 2cm × 2cm 的长条，共约 12 条" },
    { index := 8, instruction := "将面粉、打散的鸡蛋液和面包糠分别放入 3 个容器" },
    { index := 9, instruction := "每块奶条依次均匀裹上面粉、鸡蛋液和面包糠，确保各面都被覆盖" },
    { index := 10, instruction := "锅中倒入 700ml 食用油，中火加热至 165 - 175℃；没有温度计时，可放入少量面包糠测试，面包糠应在 2 秒内浮起并持续冒出小气泡" },
    { index := 11, instruction := "将奶条分 2 - 3 批放入油中，每批炸约 60 - 90 秒；期间翻动 1 - 2 次，使各面受热均匀" },
    { index := 12, instruction := "奶条表面呈均匀金黄色时捞出，放在厨房纸上沥油约 2 分钟后食用" }
  ]
}

theorem recipe_85c01e8fd94f_ingredients_nonempty :
    recipe_85c01e8fd94f.ingredients.isEmpty = false := by decide

theorem recipe_85c01e8fd94f_steps_nonempty :
    recipe_85c01e8fd94f.steps.isEmpty = false := by decide

theorem recipe_85c01e8fd94f_step_count :
    recipe_85c01e8fd94f.steps.length = 12 := by decide

theorem recipe_85c01e8fd94f_steps_ordered :
    orderedFrom 1 recipe_85c01e8fd94f.steps = true := by decide

theorem recipe_85c01e8fd94f_executes_to_terminal :
    executesToTerminal recipe_85c01e8fd94f = true := by decide

theorem recipe_85c01e8fd94f_kernel_certificate :
    kernelCertified recipe_85c01e8fd94f = true := by decide

end LeanToCook.SourceCatalog
