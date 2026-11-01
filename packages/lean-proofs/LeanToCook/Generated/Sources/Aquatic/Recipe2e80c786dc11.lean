/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧鲤鱼 · dishes/aquatic/红烧鲤鱼.md -/
def recipe_2e80c786dc11 : Recipe := {
  id := "2e80c786dc11"
  title := "红烧鲤鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/红烧鲤鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大葱、姜、大蒜、干辣椒",
    "油、盐、生抽、老抽、陈醋、蚝油、料酒、白糖",
    "鲤鱼、五花肉"
  ]
  steps := [
    { index := 1, instruction := "葱、姜、蒜、干辣椒分别清洗干净。" },
    { index := 2, instruction := "葱白处切段，每段长度约 4cm，再将每段劈为四瓣。" },
    { index := 3, instruction := "姜切片，每片厚度约 3mm。" },
    { index := 4, instruction := "一个大蒜拍碎切末，其余蒜切为二瓣。" },
    { index := 5, instruction := "干辣椒切四段。" },
    { index := 6, instruction := "五花肉切片，约 4cm4cm。" },
    { index := 7, instruction := "清洗鱼。" },
    { index := 8, instruction := "鱼背肉厚处拉几道斜口，方便入味" },
    { index := 9, instruction := "锅里多倒点油，烧至 7 成热（刚刚开始冒烟），下入鱼炸 1 分钟至鱼皮稍稍变硬捞出备用（注意不要一下锅就拨弄鱼，等炸一会再拨弄、翻面），炸鱼的油倒出，锅里留一点底油" },
    { index := 10, instruction := "将锅里底油烧热，下入五花肉，煸出香味。" },
    { index := 11, instruction := "放入干辣椒、葱、姜、蒜瓣，翻炒 1 分钟。" },
    { index := 12, instruction := "将炸好的鱼倒入锅中。" },
    { index := 13, instruction := "沿锅边倒入" },
    { index := 14, instruction := "调至中火，将水烧开。" },
    { index := 15, instruction := "调至小火，慢焖入味。" },
    { index := 16, instruction := "15 分钟 后，打开锅盖，挑出锅里的葱、姜、蒜、干辣椒。" },
    { index := 17, instruction := "调至大火收汁，汤汁剩余 1/4 时，撒点蒜末，关火盛出。" },
    { index := 18, instruction := "红烧鲤鱼出锅！" }
  ]
}

theorem recipe_2e80c786dc11_ingredients_nonempty :
    recipe_2e80c786dc11.ingredients.isEmpty = false := by decide

theorem recipe_2e80c786dc11_steps_nonempty :
    recipe_2e80c786dc11.steps.isEmpty = false := by decide

theorem recipe_2e80c786dc11_step_count :
    recipe_2e80c786dc11.steps.length = 18 := by decide

theorem recipe_2e80c786dc11_steps_ordered :
    orderedFrom 1 recipe_2e80c786dc11.steps = true := by decide

theorem recipe_2e80c786dc11_executes_to_terminal :
    executesToTerminal recipe_2e80c786dc11 = true := by decide

theorem recipe_2e80c786dc11_kernel_certificate :
    kernelCertified recipe_2e80c786dc11 = true := by decide

end LeanToCook.SourceCatalog
