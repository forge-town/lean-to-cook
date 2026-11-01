/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 水煮肉片 · dishes/meat_dish/水煮肉片.md -/
def recipe_b898ff51880d : Recipe := {
  id := "b898ff51880d"
  title := "水煮肉片"
  category := "meat"
  sourcePath := "dishes/meat_dish/水煮肉片.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪里脊肉",
    "食用盐",
    "胡椒粉",
    "生抽酱油",
    "料酒",
    "鸡蛋清",
    "土豆淀粉",
    "植物油",
    "豆芽",
    "凤尾",
    "芹菜",
    "蒜苗",
    "大蒜",
    "生姜",
    "红泡椒",
    "青花椒",
    "干辣椒",
    "红油豆瓣",
    "鸡精",
    "白砂糖",
    "小葱",
    "菜籽油"
  ]
  steps := [
    { index := 1, instruction := "里脊肉改刀成小块，再切成 2 毫米薄片（可根据自己的口感改进），放入碗中，加入清水清洗两遍来去除血水和杂质，捞出挤干水分备用。" },
    { index := 2, instruction := "碗中加入食用盐 1.5g，胡椒粉 1g，生抽酱油 5g，料酒 3g，然后朝着一个方向搅拌 2 分钟，使其入味。" },
    { index := 3, instruction := "另外准备一个碗，加入一个鸡蛋清，加入 7g 土豆淀粉，一个方向搅拌均匀，倒入肉中" },
    { index := 4, instruction := "绿豆芽 100g，凤尾 1 根（改刀成小条），芹菜 3 根切成小段，蒜苗 2 根拍散切成小段。" },
    { index := 5, instruction := "大蒜 20g 剁碎，生姜小块剁碎，红泡椒 20g 剁碎。" },
    { index := 6, instruction := "小米辣干辣椒 15g，青花椒 3g，锅内加入油滑锅，油稍许热了将多余的倒出备用留 50g 底油，下入干辣椒、花椒，开小火炒香，切记不要炒糊（颜色要变黑即可），倒出在菜板上剁细。" },
    { index := 7, instruction := "锅烧热，放入 100g 植物油烧至 6 成热，加入 2g 青花椒、干辣椒爆香，配菜下锅，加入 1g 食用盐，炒至断生，盛入碗中垫底备用。" },
    { index := 8, instruction := "锅洗干净，加入 150g 植物油烧至 6 成热，加入制作好的姜蒜红泡椒，爆香后加入豆瓣 10g，开小火把豆瓣爆香炒出红油即可。" },
    { index := 9, instruction := "加入 800 毫升清水（根据实际情况选择），大火烧开，转小火调味，加入食用盐 2.5g，鸡精 1.5g，1g 白砂糖提鲜，1g 胡椒粉，5g 水淀粉（根据实际情况选择）将汤汁收浓稠一点。" },
    { index := 10, instruction := "汤汁开后，开小火将腌制好的肉片分开依次下锅，然后开中火将肉片烫熟，用锅铲轻轻推动一下避免粘连，待汤汁烧开，肉片熟后捞出放入碗中配菜上，再将原汤倒入（不超过菜品）。" },
    { index := 11, instruction := "碗中均匀撒上刀口辣椒、蒜蓉和葱花。" },
    { index := 12, instruction := "锅洗干净，加入 200g 菜籽油，烧至 7 成热，然后一次性均匀泼在碗中肉片上（注意安全），美味完成。" }
  ]
}

theorem recipe_b898ff51880d_ingredients_nonempty :
    recipe_b898ff51880d.ingredients.isEmpty = false := by decide

theorem recipe_b898ff51880d_steps_nonempty :
    recipe_b898ff51880d.steps.isEmpty = false := by decide

theorem recipe_b898ff51880d_step_count :
    recipe_b898ff51880d.steps.length = 12 := by decide

theorem recipe_b898ff51880d_steps_ordered :
    orderedFrom 1 recipe_b898ff51880d.steps = true := by decide

theorem recipe_b898ff51880d_executes_to_terminal :
    executesToTerminal recipe_b898ff51880d = true := by decide

theorem recipe_b898ff51880d_kernel_certificate :
    kernelCertified recipe_b898ff51880d = true := by decide

end LeanToCook.SourceCatalog
