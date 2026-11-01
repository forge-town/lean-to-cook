import { ingredientImagePaths } from "@repo/schemas/catalog";
import type {
  IngredientState,
  IngredientVisualKind,
  KitchenIngredientVisual,
} from "./kitchenSceneModel";

export type IngredientIconName = keyof typeof ingredientImagePaths;

export interface IngredientIconAsset {
  key: IngredientIconName;
  src: string;
}

interface IngredientIconRule {
  icon: IngredientIconName;
  pattern: RegExp;
}

const ingredientNameRules: IngredientIconRule[] = [
  { icon: "garlic", pattern: /蒜/u },
  { icon: "onion", pattern: /洋葱|圆葱/u },
  { icon: "herb", pattern: /葱|韭菜|香菜|欧芹|罗勒|薄荷/u },
  { icon: "gingerRoot", pattern: /姜/u },
  { icon: "lobster", pattern: /龙虾/u },
  { icon: "oyster", pattern: /生蚝|牡蛎|蚝/u },
  { icon: "octopus", pattern: /章鱼|八爪/u },
  { icon: "squid", pattern: /鱿鱼|墨鱼|乌贼/u },
  { icon: "crab", pattern: /蟹|螃蟹/u },
  { icon: "shrimp", pattern: /虾|海米/u },
  { icon: "fish", pattern: /鱼|鳕|鲈|鲤|鲫|鳊|鳗|金枪|三文/u },
  { icon: "egg", pattern: /鸡蛋|鸭蛋|鹅蛋|蛋黄|蛋清|皮蛋|鹌鹑蛋/u },
  { icon: "glassOfMilk", pattern: /牛奶|奶粉|淡奶|椰奶|奶油/u },
  { icon: "droplet", pattern: /清水|饮用水|凉水|热水|温水|开水|沸水/u },
  { icon: "butter", pattern: /黄油|猪油|牛油(?!果)/u },
  { icon: "pouringLiquid", pattern: /油(?!果)/u },
  { icon: "honeyPot", pattern: /蜂蜜|糖浆|麦芽糖/u },
  { icon: "jar", pattern: /酱油|生抽|老抽|醋|料酒|蚝油|豆瓣酱|酱|酒|汁/u },
  { icon: "salt", pattern: /盐|胡椒|花椒|孜然|芝麻|香料|味精|鸡精/u },
  { icon: "bacon", pattern: /培根/u },
  { icon: "poultryLeg", pattern: /鸡腿|鸡翅|鸭腿|鹅腿/u },
  { icon: "meatOnBone", pattern: /排骨|肋骨|骨肉/u },
  { icon: "peanuts", pattern: /花生|腰果|松仁|坚果/u },
  { icon: "beans", pattern: /红豆|绿豆|黄豆|芸豆|豆子|莲子/u },
  { icon: "banana", pattern: /香蕉/u },
  { icon: "lemon", pattern: /柠檬/u },
  { icon: "tangerine", pattern: /橙|橘|桔|柚/u },
  { icon: "strawberry", pattern: /草莓/u },
  { icon: "mango", pattern: /芒果/u },
  { icon: "pineapple", pattern: /菠萝|凤梨/u },
  { icon: "grapes", pattern: /葡萄/u },
  { icon: "avocado", pattern: /牛油果|鳄梨/u },
  { icon: "redApple", pattern: /苹果|梨|桃|枣/u },
  { icon: "tofu", pattern: /豆腐|豆干|豆皮|腐竹|千张/u },
  { icon: "bread", pattern: /面粉|淀粉|面团|吐司|面包|饼干|泡打粉|酵母/u },
  { icon: "teacup", pattern: /茶叶|红茶|绿茶|乌龙茶|茶包|咖啡/u },
  { icon: "cutOfMeat", pattern: /猪|牛|羊|鸡|鸭|鹅|肉|火腿|腊肠|里脊/u },
];

const cookedNameRules: IngredientIconRule[] = [
  { icon: "cooking", pattern: /鸡蛋|鸭蛋|鹅蛋|蛋黄|蛋清|鹌鹑蛋/u },
  { icon: "roastedSweetPotato", pattern: /红薯|紫薯|地瓜/u },
  { icon: "steamingBowl", pattern: /面条|面线|粉丝|米粉|河粉|粉条|挂面/u },
  { icon: "spaghetti", pattern: /意面|意大利面/u },
  { icon: "cookedRice", pattern: /大米|米饭|糯米|小米|炒饭|盖饭/u },
  { icon: "bowlWithSpoon", pattern: /汤|粥|羹/u },
];

const kindIcons = {
  allium: "onion",
  bean: "beans",
  butter: "butter",
  carrot: "carrot",
  cheese: "cheeseWedge",
  chili: "hotPepper",
  chocolate: "chocolateBar",
  corn: "earOfCorn",
  cucumber: "cucumber",
  dough: "bread",
  egg: "egg",
  eggplant: "eggplant",
  fish: "fish",
  fruit: "redApple",
  ginger: "gingerRoot",
  leaf: "leafyGreen",
  liquid: "droplet",
  meat: "cutOfMeat",
  mushroom: "mushroom",
  noodle: "spaghetti",
  oil: "pouringLiquid",
  potato: "potato",
  rice: "cookedRice",
  sauce: "jar",
  seasoning: "salt",
  shellfish: "crab",
  shrimp: "shrimp",
  sugar: "honeyPot",
  tea: "teacup",
  tofu: "tofu",
  tomato: "tomato",
} as const satisfies Record<IngredientVisualKind, IngredientIconName>;

const getRuleMatch = (name: string, rules: IngredientIconRule[]) =>
  rules.find(({ pattern }) => pattern.test(name))?.icon;

const shouldUseCookedAsset = (state: IngredientState) => state === "cooked";

export const getIngredientIconAsset = (
  ingredient: Pick<KitchenIngredientVisual, "kind" | "name" | "state">
): IngredientIconAsset => {
  const cookedMatch = shouldUseCookedAsset(ingredient.state)
    ? getRuleMatch(ingredient.name, cookedNameRules)
    : undefined;
  const key =
    cookedMatch ?? getRuleMatch(ingredient.name, ingredientNameRules) ?? kindIcons[ingredient.kind];

  return {
    key,
    src: ingredientImagePaths[key].replace(
      "/api/ingredient-images/",
      "/ingredient-icons/fluent-flat/"
    ),
  };
};
