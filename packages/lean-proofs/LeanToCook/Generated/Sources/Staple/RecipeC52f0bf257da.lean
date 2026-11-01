/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 手工水饺 · dishes/staple/手工水饺.md -/
def recipe_c52f0bf257da : Recipe := {
  id := "c52f0bf257da"
  title := "手工水饺"
  category := "staple"
  sourcePath := "dishes/staple/手工水饺.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "擀面杖",
    "面粉",
    "冷水",
    "直径 30cm 以上的盆",
    "芝麻香油"
  ]
  steps := [
    { index := 1, instruction := "盆中加入所有面粉" },
    { index := 2, instruction := "加入芝麻香油" },
    { index := 3, instruction := "面粉中央挖小洞" },
    { index := 4, instruction := "分 4-5 次加入水，并搅和，当出现碎末状的稍微干燥面团时" },
    { index := 5, instruction := "取消加水，用手将面团压实" },
    { index := 6, instruction := "面团压实至可把盆周围的面粉纳入即可，此步骤为面光盆光" },
    { index := 7, instruction := "将面团置于桌上，盆倒扣于桌上，环境温度为 25 度，使面团醒发约 45 分钟" },
    { index := 8, instruction := "醒发完成后，将面团搓成条状，合成一团，再次搓成条，重复 3 次" },
    { index := 9, instruction := "擀成条状，切成 20 份均匀大小面团，并搓成直径约 3-3.5cm 的球状" },
    { index := 10, instruction := "压扁面团，在手上，桌上，擀面杖上，及面团上撒上面粉，此步骤防止面团发粘" },
    { index := 11, instruction := "用擀面杖将面团擀平，约 8cm 直径，厚约 2mm，中间略微比四周厚 1mm" },
    { index := 12, instruction := "猪肉去皮，保留部分肥肉,切成小块" },
    { index := 13, instruction := "菜刀（建议两把）将猪肉剁成肉沫，放入碗中" },
    { index := 14, instruction := "葱、姜切成末，放入肉碗中搅拌均匀" },
    { index := 15, instruction := "韭菜洗净，切短至 3mm 以下长度" },
    { index := 16, instruction := "韭菜和肉沫混合，加入蚝油、生抽、香油各 2ml，加入一个鸡蛋的蛋清，用手混合搅拌均匀" },
    { index := 17, instruction := "放置 30 分钟即可开始包饺子" },
    { index := 18, instruction := "左手上放面皮，放饺子馅一面尽量不要粘到面粉，防止无法合拢" },
    { index := 19, instruction := "右手用筷子夹约面皮 1/2 直径的馅" },
    { index := 20, instruction := "沿饺子皮圆周进行合拢，捏实，个人吃无需捏花，饺子皮不漏即可" },
    { index := 21, instruction := "使用可放下 20 只饺子的锅，或分批量煮" },
    { index := 22, instruction := "烧水，水约 3/4 锅的高度" },
    { index := 23, instruction := "大火烧开水后放入饺子，调至中火" },
    { index := 24, instruction := "第一次放入饺子，且水冒泡后，锅边加入 50ml 冷水（重复此步骤两次）" },
    { index := 25, instruction := "第三次水开后加入冷水 50ml，水开后调至小火等 60s 即可出锅" }
  ]
}

theorem recipe_c52f0bf257da_ingredients_nonempty :
    recipe_c52f0bf257da.ingredients.isEmpty = false := by decide

theorem recipe_c52f0bf257da_steps_nonempty :
    recipe_c52f0bf257da.steps.isEmpty = false := by decide

theorem recipe_c52f0bf257da_step_count :
    recipe_c52f0bf257da.steps.length = 25 := by decide

theorem recipe_c52f0bf257da_steps_ordered :
    orderedFrom 1 recipe_c52f0bf257da.steps = true := by decide

theorem recipe_c52f0bf257da_executes_to_terminal :
    executesToTerminal recipe_c52f0bf257da = true := by decide

theorem recipe_c52f0bf257da_kernel_certificate :
    kernelCertified recipe_c52f0bf257da = true := by decide

end LeanToCook.SourceCatalog
