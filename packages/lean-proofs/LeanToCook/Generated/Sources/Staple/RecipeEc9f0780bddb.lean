/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 基础牛奶面包 · dishes/staple/基础牛奶面包/基础牛奶面包.md -/
def recipe_ec9f0780bddb : Recipe := {
  id := "ec9f0780bddb"
  title := "基础牛奶面包"
  category := "staple"
  sourcePath := "dishes/staple/基础牛奶面包/基础牛奶面包.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "高筋或中筋面粉 （尽量使用高筋面粉，但避免使用低筋面粉。所有无特殊说明的“万能面粉”均为中筋面粉）",
    "鸡蛋 （不过分要求大小及重量）",
    "糖 （如有糖浆是最好的。）",
    "干酵母",
    "盐",
    "牛奶或淡奶油或炼乳或奶粉 （最好使用奶粉，奶香味十足，但不要使用任何复方奶粉，如成人奶粉或婴儿奶粉，因为化学性质不稳定。同时可以两种奶制品混合使用。尽量避免选用额外含糖的原料，因为实际含糖量会多于本食谱建议加糖量）",
    "黄油或玉米油 （如果选用的奶制品含脂量极高可以不加。黄油尽量选用动脂无盐的。豆油可能会有豆腥味，尽量不要使用。）",
    "谷朊粉（可选）",
    "香草精（可选）",
    "烤箱 （不要使用不带控温的烤箱）",
    "量杯",
    "布",
    "擀面杖",
    "硅油纸或模具"
  ]
  steps := [
    { index := 1, instruction := "首先，将酵母和 30℃ 的温水 用刮刀或厨具混合均匀，静置 5 分钟。之后与面粉混合，搅拌均匀。此时的酵头应该是特别粘稠的面糊。" },
    { index := 2, instruction := "用布盖上面糊，将面糊放置到温暖的地方进行发酵，时长为 45  60 分钟。" },
    { index := 3, instruction := "最终的面糊应该是表面有很多气泡的且体积明显增大。" },
    { index := 4, instruction := "将剩下的原料全部与酵头用刮刀混合、搅拌。在搅拌时一定要刮壁，使其充分混合。在形成面团且没有干粉时，用干净的干燥的一只手按压面团，另一只手扶住容器，使其形成一个大的面团，然后倒在面板或硅胶垫上操作" },
    { index := 5, instruction := "用手掌下部推开面团，然后对折再次推开，直至表面没有干粉结块。这时的面团还不是很光滑。" },
    { index := 6, instruction := "使用喷壶将至少是当前面团三倍大的容器内喷上一层植物油（也可用手涂抹均匀），将面团放入并盖上布，发酵 1 小时。" },
    { index := 7, instruction := "此时面团应该有原来的两倍大。在面板或硅胶垫上撒上薄薄的一层面粉（可以看见面板或硅胶垫的厚度即可），然后将面团拿出，用手压瘪面团排气。" },
    { index := 8, instruction := "之后使用擀面杖，擀成 1 cm 的厚片。并紧实、不留空隙地从一边卷起来。" },
    { index := 9, instruction := "然后旋转 90° ，重复步骤 4、步骤 5 。" },
    { index := 10, instruction := "将面包整形，放到垫了硅油纸的烤盘或者涂抹油脂的模具内。注意接缝处朝下。" },
    { index := 11, instruction := "在托盘或模具内，发酵 30  45 分钟 。" },
    { index := 12, instruction := "于此同时，预热烤箱。" },
    { index := 13, instruction := "在面包上用剪子或者刀划开几条缝作为面包的花纹。" },
    { index := 14, instruction := "用刷子刷上蛋液。（可选）" },
    { index := 15, instruction := "放入烤箱，上下火 180℃ 烤制 30 分钟，然后调 165 ℃ 再烤 10 分钟。" },
    { index := 16, instruction := "放凉后装入食品袋内，可保存一个星期。冷冻可保存一个月。" }
  ]
}

theorem recipe_ec9f0780bddb_ingredients_nonempty :
    recipe_ec9f0780bddb.ingredients.isEmpty = false := by decide

theorem recipe_ec9f0780bddb_steps_nonempty :
    recipe_ec9f0780bddb.steps.isEmpty = false := by decide

theorem recipe_ec9f0780bddb_step_count :
    recipe_ec9f0780bddb.steps.length = 16 := by decide

theorem recipe_ec9f0780bddb_steps_ordered :
    orderedFrom 1 recipe_ec9f0780bddb.steps = true := by decide

theorem recipe_ec9f0780bddb_executes_to_terminal :
    executesToTerminal recipe_ec9f0780bddb = true := by decide

theorem recipe_ec9f0780bddb_kernel_certificate :
    kernelCertified recipe_ec9f0780bddb = true := by decide

end LeanToCook.SourceCatalog
