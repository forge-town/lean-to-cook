/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 地三鲜 · dishes/vegetable_dish/地三鲜/地三鲜.md -/
def recipe_0250e6ee464f : Recipe := {
  id := "0250e6ee464f"
  title := "地三鲜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/地三鲜/地三鲜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "土豆",
    "尖椒",
    "葱",
    "姜",
    "蒜",
    "豆瓣酱",
    "生抽",
    "糖",
    "淀粉"
  ]
  steps := [
    { index := 1, instruction := "土豆、茄子、尖椒洗净。" },
    { index := 2, instruction := "土豆去皮。" },
    { index := 3, instruction := "茄子、土豆均切成 15g 的不规则的小块。" },
    { index := 4, instruction := "尖椒用手顺着纹路撕即可，撕成比土豆、茄子略大 25%的块。" },
    { index := 5, instruction := "尽可能除去青椒表面的水分，避免后续炸的时候炸水。考虑使用厨房纸或风干半小时。" },
    { index := 6, instruction := "葱切 0.5cm 小段，共取 5g。蒜剁碎成蒜蓉取 15g，分成两份，各 7.5g。姜切沫取 5g。" },
    { index := 7, instruction := "拿一个空碗，放入生抽 10ml、糖 10g、淀粉 8g，加入 80ml 清水，彻底搅拌均匀，作为调料碗，备用。" },
    { index := 8, instruction := "热锅，加入 150ml 油。" },
    { index := 9, instruction := "加入土豆，煎炸大约 3-4 分钟，以显示金黄色、筷子能轻松扎透为准。" },
    { index := 10, instruction := "捞出土豆，留下油。" },
    { index := 11, instruction := "加入茄子，煎炸大约 2-3 分钟，待其到大约 7 分熟，以茄子变软、边缘微焦且吐出多余油脂为准。" },
    { index := 12, instruction := "捞出茄子，留下油。（也可能没有残余的油了）" },
    { index := 13, instruction := "如果锅内已经没有流动的油，可以考虑补充 15ml 油。" },
    { index := 14, instruction := "加入尖椒块，煎炸大约 15 秒，边缘稍微起虎皮后，立刻捞出。倒出锅里的油。" },
    { index := 15, instruction := "重新热锅，重新加入 15ml 新底油。" },
    { index := 16, instruction := "放入葱 5g，姜 5g，蒜 7.5g。中小火爆香。" },
    { index := 17, instruction := "放入豆瓣酱 15ml。转小火，炒出红油和酱香味。" },
    { index := 18, instruction := "倒入调料碗。立刻转大火，高速搅拌避免糊锅！大约 10 秒后汤汁就会开始冒泡并变得黏稠。" },
    { index := 19, instruction := "立刻放入之前准备好的全部土豆、茄子和尖椒。" },
    { index := 20, instruction := "翻炒 20 秒，让浓稠的酱汁均匀挂在食材上。" },
    { index := 21, instruction := "关火，撒入 7.5g 蒜。翻拌均匀，盛盘。" }
  ]
}

theorem recipe_0250e6ee464f_ingredients_nonempty :
    recipe_0250e6ee464f.ingredients.isEmpty = false := by decide

theorem recipe_0250e6ee464f_steps_nonempty :
    recipe_0250e6ee464f.steps.isEmpty = false := by decide

theorem recipe_0250e6ee464f_step_count :
    recipe_0250e6ee464f.steps.length = 21 := by decide

theorem recipe_0250e6ee464f_steps_ordered :
    orderedFrom 1 recipe_0250e6ee464f.steps = true := by decide

theorem recipe_0250e6ee464f_executes_to_terminal :
    executesToTerminal recipe_0250e6ee464f = true := by decide

theorem recipe_0250e6ee464f_kernel_certificate :
    kernelCertified recipe_0250e6ee464f = true := by decide

end LeanToCook.SourceCatalog
