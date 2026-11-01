/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 腐乳肉 · dishes/meat_dish/腐乳肉.md -/
def recipe_68c7a9333f5e : Recipe := {
  id := "68c7a9333f5e"
  title := "腐乳肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/腐乳肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "带皮五花肉",
    "红腐乳（推荐咸亨牌玫瑰腐乳）",
    "冰糖",
    "老抽",
    "料酒",
    "香葱（可选）",
    "生姜",
    "清水",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "五花肉切成长宽 2.5 cm 的小块" },
    { index := 2, instruction := "冷水放料酒姜片，五花肉放入开火慢慢加入到水沸腾后捞出" },
    { index := 3, instruction := "玫瑰腐乳块和腐乳汁碾成泥，加冰糖、老抽调成酱汁" },
    { index := 4, instruction := "热锅冷油爆香葱姜，下肉块煸到金黄" },
    { index := 5, instruction := "倒入腐乳酱炒匀加热水焖煮" },
    { index := 6, instruction := "小火慢炖 40 分钟" },
    { index := 7, instruction := "大火收汁，看到汤汁冒浓稠鱼眼泡时关火" }
  ]
}

theorem recipe_68c7a9333f5e_ingredients_nonempty :
    recipe_68c7a9333f5e.ingredients.isEmpty = false := by decide

theorem recipe_68c7a9333f5e_steps_nonempty :
    recipe_68c7a9333f5e.steps.isEmpty = false := by decide

theorem recipe_68c7a9333f5e_step_count :
    recipe_68c7a9333f5e.steps.length = 7 := by decide

theorem recipe_68c7a9333f5e_steps_ordered :
    orderedFrom 1 recipe_68c7a9333f5e.steps = true := by decide

theorem recipe_68c7a9333f5e_executes_to_terminal :
    executesToTerminal recipe_68c7a9333f5e = true := by decide

theorem recipe_68c7a9333f5e_kernel_certificate :
    kernelCertified recipe_68c7a9333f5e = true := by decide

end LeanToCook.SourceCatalog
