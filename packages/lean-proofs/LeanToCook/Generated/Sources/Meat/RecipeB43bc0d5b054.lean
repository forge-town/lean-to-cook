/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 猪肉烩酸菜 · dishes/meat_dish/猪肉烩酸菜.md -/
def recipe_b43bc0d5b054 : Recipe := {
  id := "b43bc0d5b054"
  title := "猪肉烩酸菜"
  category := "meat"
  sourcePath := "dishes/meat_dish/猪肉烩酸菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪五花肉或猪肉排骨",
    "东北酸菜",
    "大葱",
    "姜",
    "蒜",
    "盐",
    "生抽酱油",
    "五香粉",
    "料酒",
    "大料"
  ]
  steps := [
    { index := 1, instruction := "大葱切段；生姜 50 克切段， 50 克切末；大蒜切末，备用。" },
    { index := 2, instruction := "全部酸菜切丝，用水冲洗 2 ～ 3 遍备用。" },
    { index := 3, instruction := "排骨和五花肉入锅，倒入冷水淹没。放入全部葱段， 50 克生姜段和料酒 20 毫升。大火煮开后，等待 5 分钟。关火，将排骨和五花肉捞出，冷水冲洗掉浮沫，备用" },
    { index := 4, instruction := "煮好的五花肉切片或者切块，备用。" },
    { index := 5, instruction := "将之前的锅洗干净，并且擦干（不然加入油会崩出来）。" },
    { index := 6, instruction := "锅中加入油，开中火，放入姜蒜末爆香，放入五花肉和排骨。将五花肉和排骨煎至金黄，倒入 10 克五香粉和 15 克 生抽酱油，用铲子翻动 1 ～ 2 分钟。" },
    { index := 7, instruction := "将冲洗好的酸菜丝加入锅中，翻炒 3 分钟。" },
    { index := 8, instruction := "倒入纯净水至刚好没过食材，加入 2 颗大料，转大火，直到锅中水沸腾。转中火，盖锅盖焖煮。" },
    { index := 9, instruction := "等待 1.5 ～ 2 小时，直至五花肉软烂 （可以用筷子轻松扎穿）" },
    { index := 10, instruction := "掀开锅盖，开大火收汤，翻动锅中食材直至锅中剩余水分只覆盖锅底，转小火，准备调味。" },
    { index := 11, instruction := "调味：加入食用盐 10 克，搅拌均匀。" },
    { index := 12, instruction := "关火，出锅。" }
  ]
}

theorem recipe_b43bc0d5b054_ingredients_nonempty :
    recipe_b43bc0d5b054.ingredients.isEmpty = false := by decide

theorem recipe_b43bc0d5b054_steps_nonempty :
    recipe_b43bc0d5b054.steps.isEmpty = false := by decide

theorem recipe_b43bc0d5b054_step_count :
    recipe_b43bc0d5b054.steps.length = 12 := by decide

theorem recipe_b43bc0d5b054_steps_ordered :
    orderedFrom 1 recipe_b43bc0d5b054.steps = true := by decide

theorem recipe_b43bc0d5b054_executes_to_terminal :
    executesToTerminal recipe_b43bc0d5b054 = true := by decide

theorem recipe_b43bc0d5b054_kernel_certificate :
    kernelCertified recipe_b43bc0d5b054 = true := by decide

end LeanToCook.SourceCatalog
