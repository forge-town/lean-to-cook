/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱油桂鱼 · dishes/aquatic/葱油桂鱼/葱油桂鱼.md -/
def recipe_d22fb95d6bed : Recipe := {
  id := "d22fb95d6bed"
  title := "葱油桂鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/葱油桂鱼/葱油桂鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "桂鱼",
    "小葱",
    "小米辣",
    "姜",
    "料酒",
    "植物油",
    "盐",
    "蒸鱼豉油",
    "蒸笼（含蒸锅）",
    "清水",
    "砧板",
    "铁锅",
    "塑料盘或塑料盆（腌鱼用）",
    "一次性手套",
    "厨房纸",
    "蒸鱼盘子（能平放下一条鱼即可）",
    "菜刀",
    "削皮刀",
    "防烫盘夹（或者防烫手套）"
  ]
  steps := [
    { index := 1, instruction := "去菜市场买已经处理好的鱼（自己处理的话最好不要内脏），将鱼身表面的所有鳞片刮干净" },
    { index := 2, instruction := "用厨房用纸将鱼肚子里的贴骨血和黑膜擦干净（帖骨血会影响口感，黑膜是鱼腥味的来源）" },
    { index := 3, instruction := "用菜刀在鱼身表面来回刮几次，将鱼身的黏液刮掉，进一步去除腥味，然后用清水将鱼内外冲洗干净" },
    { index := 4, instruction := "将鱼平放在砧板，使用厨房纸将鱼内外的水分擦干，然后鱼头朝左，尾朝右，从鱼鳃边开始，每隔 3cm 纵向划一刀，深度达到鱼的脊椎骨即可，另一面使用同样的处理方式" },
    { index := 5, instruction := "将鱼平放在盆中，确保盘中没有多余水分" },
    { index := 6, instruction := "取一块 50g 姜（鸡蛋大小），用削皮刀把表面的皮去除并洗干净，然后切成厚度为 3mm 的姜片" },
    { index := 7, instruction := "将小米辣洗干净、去蒂，切成厚度为 2mm 的小圆片（或切成 1mm 宽度的丝状）" },
    { index := 8, instruction := "将小葱洗干净，去除根须，切成 3cm 的小段，稍微粗一点的小葱，可以沿着小葱生长的方向沿中间劈开" },
    { index := 9, instruction := "加入 8g 盐，25g 料酒到盆中，带上一次性手套，然后对鱼进行全身按摩 1 分钟，确保鱼身每个部位都均匀涂抹了盐和料酒" },
    { index := 10, instruction := "按摩好鱼后，在鱼身的每一个刀口中塞入一片姜片，鱼肚子中放入 3 片姜片，腌制 10 分钟（建议不要腌制太久，否则鱼的鲜度降低）" },
    { index := 11, instruction := "在鱼腌制期间，在蒸锅中加入 5L 清水，烧开后，在蒸锅上放上蒸笼" },
    { index := 12, instruction := "鱼腌制好后，会析出水分，将多余水分和腌制用料酒、姜片倒掉，用清水冲洗干净鱼身和鱼肚，用厨房纸擦干鱼身和鱼肚" },
    { index := 13, instruction := "将鱼平放在蒸鱼盘中，重新在鱼身、鱼肚刀口处塞入姜片" },
    { index := 14, instruction := "然后将蒸鱼盘放入蒸笼中，盖上盖子，中火蒸 20 分钟" },
    { index := 15, instruction := "期间水蒸气会附着整个鱼和盘子上，凝结后形成鱼汤，出锅后千万不要倒掉这个汤，这个汤汁是鲜味精华" },
    { index := 16, instruction := "用防烫夹将蒸鱼盘夹出，在鱼身和鱼周围淋上 10g 蒸鱼豉油" },
    { index := 17, instruction := "然后在鱼身和周围均匀撒上小葱段和小米辣" },
    { index := 18, instruction := "在铁锅中倒入 15g 植物油，用中小火慢熬 5 分钟，不要用大火，否则油会挥发很快" },
    { index := 19, instruction := "将出锅后的热油均匀地慢慢地淋在鱼身上，鲜掉眉毛的葱油桂鱼就出炉啦！" }
  ]
}

theorem recipe_d22fb95d6bed_ingredients_nonempty :
    recipe_d22fb95d6bed.ingredients.isEmpty = false := by decide

theorem recipe_d22fb95d6bed_steps_nonempty :
    recipe_d22fb95d6bed.steps.isEmpty = false := by decide

theorem recipe_d22fb95d6bed_step_count :
    recipe_d22fb95d6bed.steps.length = 19 := by decide

theorem recipe_d22fb95d6bed_steps_ordered :
    orderedFrom 1 recipe_d22fb95d6bed.steps = true := by decide

theorem recipe_d22fb95d6bed_executes_to_terminal :
    executesToTerminal recipe_d22fb95d6bed = true := by decide

theorem recipe_d22fb95d6bed_kernel_certificate :
    kernelCertified recipe_d22fb95d6bed = true := by decide

end LeanToCook.SourceCatalog
