/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 干煎阿根廷红虾 · dishes/aquatic/干煎阿根廷红虾/干煎阿根廷红虾.md -/
def recipe_6417780c575c : Recipe := {
  id := "6417780c575c"
  title := "干煎阿根廷红虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/干煎阿根廷红虾/干煎阿根廷红虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "阿根廷红虾（选用了速冻虾）",
    "海盐（研磨装）",
    "黑胡椒（研磨装）",
    "白葡萄酒",
    "生抽",
    "香菜",
    "柠檬",
    "洋葱",
    "生姜",
    "大蒜"
  ]
  steps := [
    { index := 1, instruction := "阿根廷红虾解冻，最好是提前 1 天从速冻取出放到冷藏里自然解冻，能更好保持风味和口感。可买已经开背去虾线的，节省了不少时间" },
    { index := 2, instruction := "解冻好的红虾洗净擦干备用，注意这里一定要沥干水分，赶时间可以用厨房用纸吸干水分" },
    { index := 3, instruction := "生姜切片，洋葱切小方块，香菜洗干净后，叶茎分离，把香菜叶切碎，大蒜压碎切成小块碎末" },
    { index := 4, instruction := "大火热锅，热锅后倒入两调羹橄榄油，等油温升高后，放入生姜片，洋葱块和香菜茎煸炒" },
    { index := 5, instruction := "约 1 分钟后取出生姜，洋葱和香菜茎，弃用" },
    { index := 6, instruction := "调中大火，放入红虾开始煎，注意所有虾需要单面都完整接触平底锅，煎约 2 分钟，同时给每只虾刷上一层油" },
    { index := 7, instruction := "待底面虾壳有微微焦黄时翻面，并撒入大蒜碎末，轻微晃动平底锅使得受热均匀" },
    { index := 8, instruction := "约 1 分钟后添加 20ml 白葡萄酒" },
    { index := 9, instruction := "再煎 1 分钟后调中小火，均匀撒上一层盐和黑胡椒" },
    { index := 10, instruction := "给每只虾滴上一滴生抽" },
    { index := 11, instruction := "撒上香菜叶，装盘" },
    { index := 12, instruction := "切好柠檬片，摆放到盘边即可" }
  ]
}

theorem recipe_6417780c575c_ingredients_nonempty :
    recipe_6417780c575c.ingredients.isEmpty = false := by decide

theorem recipe_6417780c575c_steps_nonempty :
    recipe_6417780c575c.steps.isEmpty = false := by decide

theorem recipe_6417780c575c_step_count :
    recipe_6417780c575c.steps.length = 12 := by decide

theorem recipe_6417780c575c_steps_ordered :
    orderedFrom 1 recipe_6417780c575c.steps = true := by decide

theorem recipe_6417780c575c_executes_to_terminal :
    executesToTerminal recipe_6417780c575c = true := by decide

theorem recipe_6417780c575c_kernel_certificate :
    kernelCertified recipe_6417780c575c = true := by decide

end LeanToCook.SourceCatalog
