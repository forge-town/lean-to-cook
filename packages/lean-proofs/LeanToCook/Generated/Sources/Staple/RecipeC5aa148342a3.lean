/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 印度烤饼 · dishes/staple/印度烤饼.md -/
def recipe_c5aa148342a3 : Recipe := {
  id := "c5aa148342a3"
  title := "印度烤饼"
  category := "staple"
  sourcePath := "dishes/staple/印度烤饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "中筋面粉（或高筋面粉）",
    "酸奶",
    "酵母",
    "糖",
    "盐",
    "酥油(Ghee)或黄油",
    "温水",
    "黑芝麻或白芝麻（可选）",
    "香菜叶（可选）",
    "大蒜（蒜蓉烤饼版本，可选）",
    "平底锅（不粘锅或铸铁锅）",
    "擀面杖"
  ]
  steps := [
    { index := 1, instruction := "将干酵母 3g 和糖 10g 溶解在 100ml 温水中（水温约 40°C，不可过烫）" },
    { index := 2, instruction := "静置 5 分钟，直至表面冒出细泡沫（说明酵母已激活）" },
    { index := 3, instruction := "在大碗中放入中筋面粉 300g 和盐 5g，混合均匀" },
    { index := 4, instruction := "倒入酵母水、酸奶 60ml 和食用油 15ml" },
    { index := 5, instruction := "用手揉成光滑柔软的面团（面团应比普通面团稍软，微微粘手是正常的）" },
    { index := 6, instruction := "揉面 8-10 分钟" },
    { index := 7, instruction := "在面团表面涂 3ml 油防止干裂" },
    { index := 8, instruction := "用湿布或保鲜膜盖住碗口" },
    { index := 9, instruction := "放置在温暖处发酵 至少 1 小时，直至面团膨胀至约两倍大" },
    { index := 10, instruction := "将发酵好的面团取出，轻揉排气" },
    { index := 11, instruction := "分成 6 个等大的小剂子（每个约 80g）" },
    { index := 12, instruction := "取一个剂子，手上沾 3ml 面粉或油" },
    { index := 13, instruction := "用擀面杖擀成长椭圆形或泪滴形面饼，厚度约 4-5mm" },
    { index := 14, instruction := "如果制作蒜蓉烤饼：在面饼表面撒上切碎的大蒜和香菜叶，轻轻擀压使其嵌入面饼" },
    { index := 15, instruction := "可在面饼表面撒上芝麻" },
    { index := 16, instruction := "将平底锅（铸铁锅最佳）大火加热至非常烫（滴水立即蒸发的程度）" },
    { index := 17, instruction := "在面饼一面刷一层薄薄的水" },
    { index := 18, instruction := "将刷水一面朝下放入锅中" },
    { index := 19, instruction := "烤 1-2 分钟，直至底面出现金棕色斑点且面饼开始鼓泡" },
    { index := 20, instruction := "翻面，继续烤 1-2 分钟" },
    { index := 21, instruction := "如果有煤气灶：翻面后可用夹子夹起面饼，将其直接放在明火上烤 数秒钟，面饼会迅速鼓起" },
    { index := 22, instruction := "取出后立即在表面涂上酥油或黄油" },
    { index := 23, instruction := "烤箱预热至最高温度（通常 250°C）" },
    { index := 24, instruction := "将面饼放在烤盘上" },
    { index := 25, instruction := "烤 3-5 分钟，直至表面金黄且鼓起" },
    { index := 26, instruction := "取出后涂上酥油或黄油" },
    { index := 27, instruction := "趁热食用" },
    { index := 28, instruction := "适合搭配任何印度咖喱，如黄油鸡、红芸豆咖喱等" }
  ]
}

theorem recipe_c5aa148342a3_ingredients_nonempty :
    recipe_c5aa148342a3.ingredients.isEmpty = false := by decide

theorem recipe_c5aa148342a3_steps_nonempty :
    recipe_c5aa148342a3.steps.isEmpty = false := by decide

theorem recipe_c5aa148342a3_step_count :
    recipe_c5aa148342a3.steps.length = 28 := by decide

theorem recipe_c5aa148342a3_steps_ordered :
    orderedFrom 1 recipe_c5aa148342a3.steps = true := by decide

theorem recipe_c5aa148342a3_executes_to_terminal :
    executesToTerminal recipe_c5aa148342a3 = true := by decide

theorem recipe_c5aa148342a3_kernel_certificate :
    kernelCertified recipe_c5aa148342a3 = true := by decide

end LeanToCook.SourceCatalog
