import { IngredientIllustration } from "@/pages/SourceRecipeWorkbenchPage/IngredientIllustration";
import type { KitchenIngredientVisual } from "@/pages/SourceRecipeWorkbenchPage/kitchenSceneModel";

const ingredientKinds: KitchenIngredientVisual[] = [
  { kind: "tomato", name: "西红柿", state: "raw" },
  { kind: "potato", name: "土豆", state: "raw" },
  { kind: "eggplant", name: "茄子", state: "raw" },
  { kind: "cucumber", name: "黄瓜", state: "raw" },
  { kind: "carrot", name: "胡萝卜", state: "raw" },
  { kind: "corn", name: "玉米", state: "raw" },
  { kind: "mushroom", name: "香菇", state: "raw" },
  { kind: "chili", name: "辣椒", state: "raw" },
  { kind: "allium", name: "大蒜", state: "raw" },
  { kind: "ginger", name: "生姜", state: "raw" },
  { kind: "leaf", name: "青菜", state: "raw" },
  { kind: "shrimp", name: "鲜虾", state: "raw" },
  { kind: "shellfish", name: "螃蟹", state: "raw" },
  { kind: "fish", name: "鲈鱼", state: "raw" },
  { kind: "egg", name: "鸡蛋", state: "raw" },
  { kind: "meat", name: "牛肉", state: "raw" },
  { kind: "tofu", name: "豆腐", state: "raw" },
  { kind: "bean", name: "花生", state: "raw" },
  { kind: "noodle", name: "意大利面", state: "raw" },
  { kind: "rice", name: "米饭", state: "raw" },
  { kind: "dough", name: "面包", state: "raw" },
  { kind: "butter", name: "黄油", state: "raw" },
  { kind: "cheese", name: "芝士", state: "raw" },
  { kind: "chocolate", name: "巧克力", state: "raw" },
  { kind: "fruit", name: "柠檬", state: "raw" },
  { kind: "tea", name: "红茶", state: "raw" },
  { kind: "liquid", name: "牛奶", state: "raw" },
  { kind: "oil", name: "食用油", state: "raw" },
  { kind: "sugar", name: "蜂蜜", state: "raw" },
  { kind: "sauce", name: "酱油", state: "raw" },
  { kind: "seasoning", name: "食盐", state: "raw" },
];

const shrimpStates: KitchenIngredientVisual[] = [
  { kind: "shrimp", name: "鲜虾", state: "raw" },
  { kind: "shrimp", name: "鲜虾", state: "prepped" },
  { kind: "shrimp", name: "鲜虾", state: "cooking" },
  { kind: "shrimp", name: "鲜虾", state: "cooked" },
];

export const IngredientIconGallery = () => (
  <main className="sb-ingredient-gallery">
    <header className="sb-ingredient-gallery__intro">
      <div>
        <span>FLUENT EMOJI FLAT / LOCAL SVG</span>
        <h1>食材不是色块，是能被认出来的食物。</h1>
      </div>
      <p>
        优先按中文食材名匹配，再退回到 31 种食材类别。所有 SVG
        已下载到项目本地，烹饪状态由项目自己的视觉层负责。
      </p>
    </header>

    <section aria-labelledby="ingredient-state-title" className="sb-ingredient-gallery__states">
      <header>
        <span>STATE STUDY / SHRIMP</span>
        <h2 id="ingredient-state-title">同一食材的四个烹饪阶段</h2>
      </header>
      <div>
        {shrimpStates.map((ingredient) => (
          <IngredientIllustration key={ingredient.state} ingredient={ingredient} />
        ))}
      </div>
    </section>

    <section aria-labelledby="ingredient-catalog-title" className="sb-ingredient-gallery__catalog">
      <header>
        <span>31 VISUAL KINDS</span>
        <h2 id="ingredient-catalog-title">食材图标目录</h2>
      </header>
      <div>
        {ingredientKinds.map((ingredient) => (
          <IngredientIllustration key={ingredient.kind} ingredient={ingredient} />
        ))}
      </div>
    </section>

    <footer>Artwork: Microsoft Fluent Emoji · MIT License · served locally from /public</footer>
  </main>
);
