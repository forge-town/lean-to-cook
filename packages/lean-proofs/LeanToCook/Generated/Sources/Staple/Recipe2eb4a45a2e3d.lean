/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 披萨饼皮 · dishes/staple/披萨饼皮/披萨饼皮.md -/
def recipe_2eb4a45a2e3d : Recipe := {
  id := "2eb4a45a2e3d"
  title := "披萨饼皮"
  category := "staple"
  sourcePath := "dishes/staple/披萨饼皮/披萨饼皮.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "中筋面粉",
    "水（温水）",
    "安琪干酵母粉",
    "食用盐",
    "橄榄油",
    "白砂糖",
    "烤箱",
    "烘焙油纸",
    "披萨石（有更好，没有普通烤盘也可以）",
    "擀面杖（非必需）"
  ]
  steps := [
    { index := 1, instruction := "用准备好的温水把酵母粉化开，稍微搅拌小就好，备用" },
    { index := 2, instruction := "取准备好的面粉，依次添加盐、橄榄油、白砂糖" },
    { index := 3, instruction := "准备混合水和面粉，边加水边搅拌直至水全部加完" },
    { index := 4, instruction := "搅拌至看不到干米粉为止" },
    { index := 5, instruction := "用差不多三倍大面团的容器装好，密封，冰箱冷藏（4 度） 等待 812 小时，一般晚上做第二天就可以用" },
    { index := 6, instruction := "观察面团醒发完毕 差不多是原始大小大约两倍算醒发完毕" },
    { index := 7, instruction := "取醒发好的面团，均匀分成四份，分别用保鲜膜盖好，备用" },
    { index := 8, instruction := "案板撒稍微多一点的干面粉，准备开始揉面" },
    { index := 9, instruction := "因为是比较湿的面团，所以粘上干面粉后才没那么粘手，不用揉太多次，面团表面稍微光滑一点就可以了" },
    { index := 10, instruction := "用手拉扯，或者擀面杖擀平，也不一定非得擀圆，只要厚度均匀，烤箱放得进去就好" },
    { index := 11, instruction := "铺好油纸，放上饼皮，依照个人口味，把准备好的食材放上去，撒上芝士碎" },
    { index := 12, instruction := "水果烤箱上 180 度，下 220 度，16 分钟即可" },
    { index := 13, instruction := "肉蔬菜烤箱上 200 度，下 230 度，18 分钟即可" },
    { index := 14, instruction := "挤上沙拉酱或者其他自己喜欢的酱即可享用" }
  ]
}

theorem recipe_2eb4a45a2e3d_ingredients_nonempty :
    recipe_2eb4a45a2e3d.ingredients.isEmpty = false := by decide

theorem recipe_2eb4a45a2e3d_steps_nonempty :
    recipe_2eb4a45a2e3d.steps.isEmpty = false := by decide

theorem recipe_2eb4a45a2e3d_step_count :
    recipe_2eb4a45a2e3d.steps.length = 14 := by decide

theorem recipe_2eb4a45a2e3d_steps_ordered :
    orderedFrom 1 recipe_2eb4a45a2e3d.steps = true := by decide

theorem recipe_2eb4a45a2e3d_executes_to_terminal :
    executesToTerminal recipe_2eb4a45a2e3d = true := by decide

theorem recipe_2eb4a45a2e3d_kernel_certificate :
    kernelCertified recipe_2eb4a45a2e3d = true := by decide

end LeanToCook.SourceCatalog
