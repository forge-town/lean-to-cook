/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 田螺酿 · dishes/meat_dish/田螺酿/田螺酿.md -/
def recipe_dccabcb0d4a4 : Recipe := {
  id := "dccabcb0d4a4"
  title := "田螺酿"
  category := "meat"
  sourcePath := "dishes/meat_dish/田螺酿/田螺酿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大田螺（乒乓球大小，约 20-25 个，上午买回放一下午吐沙）",
    "猪肉（250g，肥瘦比例 3:7 的前夹肉最佳）",
    "新鲜薄荷叶（一小把，点睛之笔）",
    "紫苏叶（一小把，与田螺是绝配）",
    "生姜（1 小块）",
    "葱（2 根）",
    "桂林三花酒",
    "生抽",
    "食盐",
    "食用油",
    "酸笋（可选，50g）",
    "大蒜（可选，4-5 瓣）",
    "干辣椒（可选，3-4 个）",
    "蚝油（可选）",
    "淀粉（可选）",
    "白胡椒粉（可选）"
  ]
  steps := [
    { index := 1, instruction := "上午买回田螺，放入清水盆中，静置一下午吐沙" },
    { index := 2, instruction := "可在水中滴几滴香油（或者芥末）加速吐沙" },
    { index := 3, instruction := "用刷子将田螺外壳刷洗干净（这一步可以时间久一些）" },
    { index := 4, instruction := "用老虎钳或菜刀剪去田螺尾部（约剪掉 1/3 到一半）" },
    { index := 5, instruction := "大锅烧水，水开后放入田螺焯烫 1-2 分钟（时间不可太久，螺肉会老）" },
    { index := 6, instruction := "捞出后用牙签挑出螺肉，去掉螺盖和黑色泥肠" },
    { index := 7, instruction := "螺壳用水冲洗干净，甩干水分备用" },
    { index := 8, instruction := "螺肉用盐抓洗干净，剁成碎粒（不要剁成泥，保留颗粒感才有嚼头）" },
    { index := 9, instruction := "猪肉剁成肉末" },
    { index := 10, instruction := "薄荷叶、紫苏叶切碎，姜切末，葱切葱花" },
    { index := 11, instruction := "将螺肉碎、猪肉末、薄荷碎、紫苏碎、姜末、葱花放入碗中" },
    { index := 12, instruction := "加入三花酒 15ml、生抽 15ml、食盐 3g" },
    { index := 13, instruction := "可选加入：蚝油 10ml、白胡椒粉 2g、淀粉 10g" },
    { index := 14, instruction := "朝一个方向搅拌至馅料粘稠上劲" },
    { index := 15, instruction := "图省事上面的所有东西直接放入打肉机直接打。" },
    { index := 16, instruction := "将馅料用筷子塞入田螺壳中，尽量塞满塞紧，但不要撑破螺壳" },
    { index := 17, instruction := "依次酿完所有田螺" },
    { index := 18, instruction := "热锅，倒入 30ml 食用油，可选放入酸笋和干辣椒炒出香味" },
    { index := 19, instruction := "倒入清水或高汤约 300ml，加生抽 15ml、食盐 2g，大火烧开" },
    { index := 20, instruction := "将酿好的田螺放入锅中，盖上锅盖，中小火焖煮 10 分钟" },
    { index := 21, instruction := "焖煮过程中不要频繁翻动，等肉馅六七成熟定型后再轻轻翻动" },
    { index := 22, instruction := "开盖，放入剩余的新鲜薄荷叶和紫苏叶，再焖 2-3 分钟" },
    { index := 23, instruction := "大火收汁至汤汁浓稠，即可出锅" }
  ]
}

theorem recipe_dccabcb0d4a4_ingredients_nonempty :
    recipe_dccabcb0d4a4.ingredients.isEmpty = false := by decide

theorem recipe_dccabcb0d4a4_steps_nonempty :
    recipe_dccabcb0d4a4.steps.isEmpty = false := by decide

theorem recipe_dccabcb0d4a4_step_count :
    recipe_dccabcb0d4a4.steps.length = 23 := by decide

theorem recipe_dccabcb0d4a4_steps_ordered :
    orderedFrom 1 recipe_dccabcb0d4a4.steps = true := by decide

theorem recipe_dccabcb0d4a4_executes_to_terminal :
    executesToTerminal recipe_dccabcb0d4a4 = true := by decide

theorem recipe_dccabcb0d4a4_kernel_certificate :
    kernelCertified recipe_dccabcb0d4a4 = true := by decide

end LeanToCook.SourceCatalog
