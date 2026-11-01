/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 牛油火锅底料 · dishes/semi-finished/牛油火锅底料.md -/
def recipe_1bc98124aec5 : Recipe := {
  id := "1bc98124aec5"
  title := "牛油火锅底料"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/牛油火锅底料.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛油 4500 g",
    "（色拉油 或 菜籽油） 1000 ml",
    "纯猪油 500 g",
    "豆瓣（郫县） 1000 g",
    "糍粑辣椒 3000 g",
    "老姜（切片） 250 g",
    "大葱（切段） 100 g",
    "洋葱（切丝） 100 g",
    "大蒜（切片） 200 g",
    "豆鼓（剁碎）（永川） 10 g",
    "豆母子 140 g",
    "红花椒 150 g",
    "老油 ? 颗粒香料 100 g : 整形香料 150 g",
    "麦芽粉（肉香） 12.5 g",
    "白酒(52%VOL) 150 ml",
    "老油 ?? 干辣椒面 15 g",
    "山奈 5 g",
    "八角 10 g",
    "草果 10 g",
    "肉桂 10 g",
    "丁香 5 g",
    "小茴香 10 g",
    "白芷 10 g",
    "荜拨 5 g",
    "香草 10 g",
    "香果 10 g",
    "山楂 10 g",
    "陈皮 5 g",
    "香茅 10 g",
    "砂仁 10 g",
    "白蔻 10 g",
    "香叶 10 g",
    "粉碎机"
  ]
  steps := [
    { index := 1, instruction := "锅置旺火（大火）放入牛油烧至 八成热(240±10°C) 时放入 老姜、大葱、洋葱、大蒜 (各100g)，炸干（吸尽异味（牛油腥味））后捞出扔掉。" },
    { index := 2, instruction := "放入 (色拉油 || 菜籽油)、纯猪油，等待锅中油温下降到 五成热(150±10°C) 时放入 糍粑辣椒 持续翻炒 5-8 分钟。" },
    { index := 3, instruction := "放入 豆瓣 炒散，转用 中小火 慢炒至料渣略发白翻砂（发出沙沙声）。" },
    { index := 4, instruction := "油在外观呈现樱桃红时放入 姜片(150g)、大蒜(100g) 炒香，大约 15 秒。" },
    { index := 5, instruction := "放入 豆鼓、豆母子 炒香，放入 红花椒、小茴香 炒香。" },
    { index := 6, instruction := "（老油） 此刻放入 颗粒香料" },
    { index := 7, instruction := "放入 麦芽粉 炒散，放入 白酒 炒散。" },
    { index := 8, instruction := "起锅装入容器中，静置于温度低的环境(10-20) 5 天后再使用效果最佳。" },
    { index := 9, instruction := "起锅装入容器中放入 干辣椒面 搅匀置放 24 小时，等待制作 老油。" },
    { index := 10, instruction := "将底料倒入锅中，加入 3/5 的开水用大火烧开 （底料:2/5 开水:3/5）。" },
    { index := 11, instruction := "烧开后表面会出现泡沫，将泡沫撇净。" },
    { index := 12, instruction := "转用 中小火 慢熬出味（约 25-30 分钟），过滤去渣。" },
    { index := 13, instruction := "等待容器中 油水分离 后，将表面的 油 撇净（将油打出来） 装入另外的容器。" },
    { index := 14, instruction := "将上一步所 撇 出来的 油 重新倒入 净锅 中，直至 炼干 油中水分起锅装入容器即为 火锅老油。" }
  ]
}

theorem recipe_1bc98124aec5_ingredients_nonempty :
    recipe_1bc98124aec5.ingredients.isEmpty = false := by decide

theorem recipe_1bc98124aec5_steps_nonempty :
    recipe_1bc98124aec5.steps.isEmpty = false := by decide

theorem recipe_1bc98124aec5_step_count :
    recipe_1bc98124aec5.steps.length = 14 := by decide

theorem recipe_1bc98124aec5_steps_ordered :
    orderedFrom 1 recipe_1bc98124aec5.steps = true := by decide

theorem recipe_1bc98124aec5_executes_to_terminal :
    executesToTerminal recipe_1bc98124aec5 = true := by decide

theorem recipe_1bc98124aec5_kernel_certificate :
    kernelCertified recipe_1bc98124aec5 = true := by decide

end LeanToCook.SourceCatalog
