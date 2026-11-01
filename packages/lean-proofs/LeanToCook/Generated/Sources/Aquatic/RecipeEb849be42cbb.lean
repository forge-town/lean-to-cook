/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 水煮鱼 · dishes/aquatic/水煮鱼.md -/
def recipe_eb849be42cbb : Recipe := {
  id := "eb849be42cbb"
  title := "水煮鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/水煮鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "巴沙鱼",
    "蔬菜（比如土豆片/豆芽/花菜/生菜/……）",
    "红油豆瓣酱",
    "藤椒油",
    "菜籽油",
    "白胡椒粉",
    "蒜瓣",
    "盐",
    "糖",
    "量杯",
    "厨房秤（可选）",
    "大不锈钢碗"
  ]
  steps := [
    { index := 1, instruction := "准备：巴沙鱼若是从冷冻柜里取出，需要放室温自然解冻 5 小时再做切片处理。" },
    { index := 2, instruction := "切片：巴沙鱼撇成薄片，约 5cm 长，3cm 宽。" },
    { index := 3, instruction := "腌制：将切好片的巴沙鱼放入大不锈钢碗中" },
    { index := 4, instruction := "加入 30g 豆瓣酱，3g 盐，10ml 藤椒油，3g 白胡椒粉" },
    { index := 5, instruction := "用手抓匀后加入 5ml 菜籽油收尾封住口味" },
    { index := 6, instruction := "常温静置至少 30 分钟入味。" },
    { index := 7, instruction := "备菜：大蒜切成蒜末。以 300g 花菜，200g 生菜为例，将花菜与生菜洗净。" },
    { index := 8, instruction := "焯水与炒菜：花菜开水锅焯水备用；将生菜洗净晾干，炒熟备用（不用放油）。" },
    { index := 9, instruction := "炒豆瓣酱：热锅冷油（菜籽油 20ml），加入 10g 豆瓣酱，10g 豆豉（可选），加入蒜末，中火慢炒。" },
    { index := 10, instruction := "汆鱼片：加入 150ml 热水，水很快开后加入腌制好的鱼片，轻轻翻动让鱼片在水中散开，加入 2g 盐和 2g 糖调味（此时可根据个人口味调整盐的用量）。水再次沸腾后即可盛盘。" },
    { index := 11, instruction := "盛盘：先将熟的蔬菜盛至大碗中，然后将热的鱼片盛在蔬菜上面，浇上锅中剩余热汤即可！" }
  ]
}

theorem recipe_eb849be42cbb_ingredients_nonempty :
    recipe_eb849be42cbb.ingredients.isEmpty = false := by decide

theorem recipe_eb849be42cbb_steps_nonempty :
    recipe_eb849be42cbb.steps.isEmpty = false := by decide

theorem recipe_eb849be42cbb_step_count :
    recipe_eb849be42cbb.steps.length = 11 := by decide

theorem recipe_eb849be42cbb_steps_ordered :
    orderedFrom 1 recipe_eb849be42cbb.steps = true := by decide

theorem recipe_eb849be42cbb_executes_to_terminal :
    executesToTerminal recipe_eb849be42cbb = true := by decide

theorem recipe_eb849be42cbb_kernel_certificate :
    kernelCertified recipe_eb849be42cbb = true := by decide

end LeanToCook.SourceCatalog
