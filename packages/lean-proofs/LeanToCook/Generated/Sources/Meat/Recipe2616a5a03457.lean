/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 无骨鸡爪 · dishes/meat_dish/无骨鸡爪/无骨鸡爪.md -/
def recipe_2616a5a03457 : Recipe := {
  id := "2616a5a03457"
  title := "无骨鸡爪"
  category := "meat"
  sourcePath := "dishes/meat_dish/无骨鸡爪/无骨鸡爪.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡爪",
    "姜",
    "料酒",
    "大葱",
    "大蒜",
    "小米辣",
    "洋葱",
    "生抽",
    "蚝油",
    "黑醋（推荐陈醋）",
    "白糖",
    "盐",
    "花椒油",
    "香菜",
    "柠檬"
  ]
  steps := [
    { index := 1, instruction := "用剪刀 / 刀 把鸡爪上的指甲的部分全部剪掉 包括指甲下面的肉和骨头，让它一点指甲都不剩" },
    { index := 2, instruction := "用水把他们洗干净，放一边" },
    { index := 3, instruction := "把鸡爪放入大锅中，准备去腥味" },
    { index := 4, instruction := "大葱，料酒，姜 全放进去" },
    { index := 5, instruction := "加水没过鸡爪" },
    { index := 6, instruction := "大火煮开 中途可以把浮末捞起来" },
    { index := 7, instruction := "水开100度，沸腾后等 10 分钟" },
    { index := 8, instruction := "关火，捞出来，把水沥干，洗干净，放入盆里" },
    { index := 9, instruction := "放入冰箱，冷冻层 20 分钟" },
    { index := 10, instruction := "把全部放入不是冷冻层的冰箱，然后分批10个一批拿出来去骨" },
    { index := 11, instruction := "从手指（鸡爪的）最前端开始，每只手指都要用刀划开划到它的手背部分" },
    { index := 12, instruction := "再从手背部用刀分划开至整个手臂" },
    { index := 13, instruction := "把每只手指关节处都掰一掰按手指出声音时那种" },
    { index := 14, instruction := "按着它的手指最前端，往里推，每只手指都一样，先推到中间手掌手背部分" },
    { index := 15, instruction := "每只手指皮脱离后，从手掌开始往手臂部分推直到整个脱下来了" },
    { index := 16, instruction := "放入碗中，备用" },
    { index := 17, instruction := "小米辣 切均匀小颗" },
    { index := 18, instruction := "大蒜，洋葱，香菜切碎" },
    { index := 19, instruction := "柠檬对半切开，把柠檬汁挤入鸡爪的容器里" },
    { index := 20, instruction := "把全部调料倒入装鸡爪的容器，小米辣，大蒜，洋葱和香菜也放进去" },
    { index := 21, instruction := "抓拌均匀" },
    { index := 22, instruction := "放入冰箱一个晚上（6 个小时）" },
    { index := 23, instruction := "调配好后全部放入准备好的鸡爪" }
  ]
}

theorem recipe_2616a5a03457_ingredients_nonempty :
    recipe_2616a5a03457.ingredients.isEmpty = false := by decide

theorem recipe_2616a5a03457_steps_nonempty :
    recipe_2616a5a03457.steps.isEmpty = false := by decide

theorem recipe_2616a5a03457_step_count :
    recipe_2616a5a03457.steps.length = 23 := by decide

theorem recipe_2616a5a03457_steps_ordered :
    orderedFrom 1 recipe_2616a5a03457.steps = true := by decide

theorem recipe_2616a5a03457_executes_to_terminal :
    executesToTerminal recipe_2616a5a03457 = true := by decide

theorem recipe_2616a5a03457_kernel_certificate :
    kernelCertified recipe_2616a5a03457 = true := by decide

end LeanToCook.SourceCatalog
