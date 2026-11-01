/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烤蛋挞 · dishes/dessert/烤蛋挞/烤蛋挞.md -/
def recipe_ebf90ccaf451 : Recipe := {
  id := "ebf90ccaf451"
  title := "烤蛋挞"
  category := "dessert"
  sourcePath := "dishes/dessert/烤蛋挞/烤蛋挞.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蛋挞皮 品牌不限",
    "鸡蛋",
    "牛奶",
    "淡奶油",
    "白砂糖",
    "烤箱 大小不限",
    "克数称",
    "搅拌器 包含且不限于筷子 打蛋器等工具",
    "筛网 网孔约为 1 毫米"
  ]
  steps := [
    { index := 1, instruction := "将碗置于克数称上 称量 450 克 淡奶油（淡奶油密度在此处记为 1 ）" },
    { index := 2, instruction := "加入 80 克白砂糖 （甜度中等 可按个人口味增减 建议范围 60-100 克）" },
    { index := 3, instruction := "加入 200 克牛奶 （牛奶密度在此处记为 1 ）" },
    { index := 4, instruction := "取 8 个蛋黄加入 蛋清可留作他用" },
    { index := 5, instruction := "均匀搅拌所有材料直至白砂糖全部融化" },
    { index := 6, instruction := "使用网筛对搅拌完成的食材进行过滤 滤除鸡蛋黏膜 鸡蛋壳 未融化的白砂糖 结块的淡奶油" },
    { index := 7, instruction := "此时请将烤箱设置 220 摄氏度开始预热（约 10 分钟） 记得拿出烤盘" },
    { index := 8, instruction := "将蛋挞皮以 0.5 厘米的间隔均匀放置于烤盘中" },
    { index := 9, instruction := "将过滤完成的食材倒入蛋挞皮中 液面距离蛋挞皮上沿 0.5 厘米即可不宜过多" },
    { index := 10, instruction := "截止此步骤 半成品蛋挞的制作已经完成 可直接放入冰箱速冻 12 小时以上保存" },
    { index := 11, instruction := "将半成品蛋挞放入烤箱中进行烤制 温度为 200 摄氏度 时间为 25 分钟" },
    { index := 12, instruction := "烤制结束后即可食用" }
  ]
}

theorem recipe_ebf90ccaf451_ingredients_nonempty :
    recipe_ebf90ccaf451.ingredients.isEmpty = false := by decide

theorem recipe_ebf90ccaf451_steps_nonempty :
    recipe_ebf90ccaf451.steps.isEmpty = false := by decide

theorem recipe_ebf90ccaf451_step_count :
    recipe_ebf90ccaf451.steps.length = 12 := by decide

theorem recipe_ebf90ccaf451_steps_ordered :
    orderedFrom 1 recipe_ebf90ccaf451.steps = true := by decide

theorem recipe_ebf90ccaf451_executes_to_terminal :
    executesToTerminal recipe_ebf90ccaf451 = true := by decide

theorem recipe_ebf90ccaf451_kernel_certificate :
    kernelCertified recipe_ebf90ccaf451 = true := by decide

end LeanToCook.SourceCatalog
