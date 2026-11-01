import type { CookingAction, RecipeCategory } from "@repo/schemas";

import type { SourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";
import { isWashingAction } from "./isWashingAction";
import { buildSourceAnimationContext } from "./buildSourceAnimationContext";
import { getVesselContents } from "./getVesselContents";

export type IngredientState = "cooked" | "cooking" | "prepped" | "raw" | "washed";

export type IngredientVisualKind =
  | "allium"
  | "bean"
  | "butter"
  | "carrot"
  | "cheese"
  | "chili"
  | "chocolate"
  | "corn"
  | "cucumber"
  | "dough"
  | "egg"
  | "eggplant"
  | "fish"
  | "fruit"
  | "ginger"
  | "leaf"
  | "liquid"
  | "meat"
  | "mushroom"
  | "noodle"
  | "oil"
  | "potato"
  | "rice"
  | "sauce"
  | "seasoning"
  | "shellfish"
  | "shrimp"
  | "sugar"
  | "tea"
  | "tofu"
  | "tomato";

export type CookingMethod =
  | "airFry"
  | "fillPastry"
  | "bake"
  | "blend"
  | "boilMix"
  | "soak"
  | "boil"
  | "braise"
  | "brew"
  | "caramelize"
  | "chill"
  | "coldMix"
  | "cupAdd"
  | "muddle"
  | "deepFry"
  | "torch"
  | "grill"
  | "marinate"
  | "microwave"
  | "mix"
  | "heatOil"
  | "pourOil"
  | "pour"
  | "plate"
  | "prep"
  | "waterBath"
  | "warmMix"
  | "wash"
  | "crush"
  | "score"
  | "crack"
  | "cut"
  | "peel"
  | "heat"
  | "panFry"
  | "reduce"
  | "thicken"
  | "rest"
  | "simmer"
  | "rack"
  | "steamerHeat"
  | "steam"
  | "stirFry";

export type FinishedDishForm =
  | "bowl"
  | "cake"
  | "cup"
  | "dumplings"
  | "flatbread"
  | "noodles"
  | "platter"
  | "rice"
  | "wholeFish";

export interface KitchenIngredientVisual {
  form?: "peeled" | "pieces" | "beaten" | "curds" | "melted" | "ribbons" | "sunny" | "tart";
  kind: IngredientVisualKind;
  name: string;
  state: IngredientState;
}

export interface KitchenSceneModel {
  heatOn?: boolean;
  actions?: CookingAction[];
  instruction?: string;
  oilStage?: "ready" | "mix" | "heatAndCool" | "pour" | "finish";
  activeIngredients: KitchenIngredientVisual[];
  allIngredients: KitchenIngredientVisual[];
  atmosphere: "cool" | "dry" | "hot" | "warm";
  category: RecipeCategory;
  completion: number;
  cupFill: number;
  dishForm: FinishedDishForm;
  method: CookingMethod;
  methodLabel: string;
  recipeTitle: string;
  vesselLabel: string;
}

const ingredientRules: { kind: IngredientVisualKind; pattern: RegExp }[] = [
  { kind: "sauce", pattern: /酱油|生抽|老抽|料酒|蚝油|醋|酱$/u },
  { kind: "dough", pattern: /饺|馄饨|汤圆|包子/u },
  { kind: "liquid", pattern: /浓缩咖啡|咖啡液|牛奶|奶粉|淡奶|椰奶|奶油/u },
  { kind: "dough", pattern: /蛋挞皮/u },
  { kind: "shrimp", pattern: /虾|海米/ },
  { kind: "shellfish", pattern: /蟹|螃蟹|生蚝|蛤|贝|花甲|鲍鱼|扇贝/ },
  { kind: "fish", pattern: /鱼|鳕|鲈|鲤|鲫|鳊|带鱼|鳗|金枪|三文/ },
  { kind: "egg", pattern: /鸡蛋|鸭蛋|鹅蛋|蛋黄|蛋清|皮蛋|鹌鹑蛋/ },
  { kind: "tomato", pattern: /番茄|西红柿|圣女果/ },
  { kind: "potato", pattern: /土豆|马铃薯|山药|芋头|红薯|紫薯/ },
  { kind: "eggplant", pattern: /茄子|茄瓜/ },
  { kind: "cucumber", pattern: /黄瓜|丝瓜|苦瓜|冬瓜|南瓜|葫芦|西葫芦/ },
  { kind: "carrot", pattern: /胡萝卜|萝卜|莴笋|竹笋|笋/ },
  { kind: "corn", pattern: /玉米/ },
  { kind: "mushroom", pattern: /蘑菇|香菇|口蘑|金针菇|杏鲍菇|木耳|银耳|菌/ },
  { kind: "tofu", pattern: /豆腐|豆干|豆皮|腐竹|千张/ },
  { kind: "chili", pattern: /辣椒|泡椒|小米辣|小米椒|尖椒|青椒|红椒|剁椒|豆瓣/ },
  { kind: "allium", pattern: /蒜|葱|洋葱|韭菜/ },
  { kind: "ginger", pattern: /姜/ },
  {
    kind: "leaf",
    pattern:
      /紫菜|海带|白菜|青菜|生菜|菠菜|油麦菜|芹菜|豆芽|西兰花|花菜|菜心|茼蒿|香菜|凤尾|豌豆苗|空心菜/,
  },
  { kind: "meat", pattern: /猪|牛|羊|鸡|鸭|鹅|肉|排骨|火腿|腊肠|培根|里脊/ },
  { kind: "noodle", pattern: /面条|面线|粉丝|米粉|河粉|粉条|意面|荞麦面|挂面/ },
  { kind: "rice", pattern: /大米|米饭|糯米|小米|燕麦|麦片/ },
  { kind: "dough", pattern: /面粉|淀粉|面团|吐司|面包|饼干|泡打粉|酵母/ },
  { kind: "butter", pattern: /黄油|猪油/ },
  { kind: "cheese", pattern: /奶酪|芝士|乳酪/ },
  { kind: "chocolate", pattern: /巧克力|可可/ },
  { kind: "tea", pattern: /茶叶|红茶|绿茶|乌龙茶|茶包|咖啡/ },
  { kind: "liquid", pattern: /水|牛奶|奶粉|淡奶|椰奶|啤酒|可乐|果汁|高汤|汤/ },
  { kind: "oil", pattern: /油/ },
  { kind: "sugar", pattern: /糖|蜂蜜|冰糖|麦芽糖/ },
  { kind: "sauce", pattern: /酱油|生抽|老抽|醋|料酒|蚝油|酱|酒|汁/ },
  { kind: "seasoning", pattern: /盐|胡椒|花椒|孜然|芝麻|桂皮|八角|香叶|味精|鸡精|香料/ },
  { kind: "bean", pattern: /豆|花生|坚果|莲子|红枣|腰果|松仁/ },
  { kind: "fruit", pattern: /奇异果|猕猴桃|苹果|梨|桃|香蕉|柠檬|橙|柚|草莓|芒果|菠萝|葡萄|枣/ },
];

const toolPattern =
  /锅|炉|刀|砧板|容器|杯子|烤箱|微波炉|打蛋器|勺|铲|模具|蒸笼|料理机|榨汁机|空气炸锅/;

const methodLabels: Record<CookingMethod, string> = {
  airFry: "热风烘烤",
  fillPastry: "调馅入模",
  bake: "烘烤膨发",
  blend: "高速搅打",
  boilMix: "煮熟沥水，拌入料汁",
  soak: "冷水入锅",
  boil: "沸煮",
  braise: "焖烧入味",
  brew: "冲泡萃取",
  caramelize: "熬糖挂浆",
  chill: "冷藏定型",
  coldMix: "凉拌入味",
  cupAdd: "食材入杯",
  muddle: "杯内捣汁",
  deepFry: "油炸上色",
  torch: "喷枪炙皮",
  grill: "炙烤焦化",
  marinate: "腌制入味",
  microwave: "微波加热",
  mix: "混合搅拌",
  heatOil: "热油炼香，关火降温",
  pourOil: "泼油激香",
  pour: "盘上浇汁",
  plate: "装盘完成",
  prep: "切配处理",
  waterBath: "交替水浴",
  warmMix: "温热溶解",
  wash: "清水冲洗",
  crush: "刀背拍碎",
  score: "开背处理",
  crack: "打蛋入盘",
  cut: "切配处理",
  peel: "去除表皮",
  heat: "热锅加油",
  panFry: "两面煎制",
  reduce: "收汁浓缩",
  thicken: "倒汁勾芡",
  rest: "暂存备用",
  simmer: "小火慢炖",
  rack: "架盘备蒸",
  steamerHeat: "加热蒸锅",
  steam: "蒸汽熟成",
  stirFry: "旺火翻炒",
};

const vesselLabels: Record<CookingMethod, string> = {
  airFry: "空气炸锅 / 炸篮",
  fillPastry: "料液碗 / 挞模",
  bake: "烤箱 / 烤盘",
  blend: "搅拌杯",
  boilMix: "煮面锅 / 拌面碗",
  soak: "汤锅",
  boil: "深汤锅",
  braise: "砂锅 / 炖锅",
  brew: "冲泡杯",
  caramelize: "糖浆炒锅",
  chill: "冷藏容器",
  coldMix: "凉拌钵",
  cupAdd: "玻璃杯",
  muddle: "玻璃杯",
  deepFry: "宽口炸锅",
  torch: "喷枪 / 金属托盘",
  grill: "烤架 / 平底锅",
  marinate: "腌制碗",
  microwave: "微波炉容器",
  mix: "搅拌碗",
  heatOil: "油锅 / 耐热碗",
  pourOil: "耐热碗",
  pour: "餐盘 / 料汁壶",
  plate: "成品餐盘",
  prep: "木质砧板",
  waterBath: "水浴锅 / 冷却碗",
  warmMix: "奶锅 / 搅拌勺",
  wash: "水槽 / 沥水篮",
  crush: "木质砧板",
  score: "木质砧板",
  crack: "耐热餐盘",
  cut: "木质砧板",
  peel: "备料盘",
  heat: "炉灶 / 炒锅",
  panFry: "平底煎锅",
  reduce: "收汁炒锅",
  thicken: "炒锅 / 料汁碗",
  rest: "备料碗",
  simmer: "厚底炖锅",
  rack: "蒸盘 / 筷架",
  steamerHeat: "蒸锅水层",
  steam: "蒸锅 / 蒸盘",
  stirFry: "中式炒锅",
};

const cleanIngredientName = (line: string) =>
  line
    .replaceAll(/\([^)]*\)|（[^）]*）/g, "")
    .replace(/[0-9.]+\s*(?:g|kg|ml|mL|L|个|根|勺|克|毫升|片|块|包|杯).*$/iu, "")
    .replaceAll(/[🥚🍚🍬🧂☕🍫🍿🥛🥜🍪🍌🍆]/gu, "")
    .replace(/^(?:适量|少量|若干)\s*/u, "")
    .trim();

const getIngredientKind = (name: string): IngredientVisualKind =>
  ingredientRules.find(({ pattern }) => pattern.test(name))?.kind ?? "seasoning";

const isFinishingStep = (instruction: string) =>
  /装盘|盛盘|出锅|即可|完成|享用|饮用|取出/u.test(instruction);

const getCookingMethod = (
  instruction: string,
  currentStepIndex: number,
  lastStepIndex: number,
  category: RecipeCategory,
  actions?: CookingAction[]
): CookingMethod => {
  if (currentStepIndex === 0) return "prep";

  const text = instruction;
  if (/沸水锅.*温水锅|两锅间转移|冷水与冰水/u.test(text)) return "waterBath";
  if (actions?.includes("boil") && actions.includes("drain") && actions.includes("mix"))
    return "boilMix";
  if (actions?.includes("add") && !actions.includes("boil") && /锅中水位|放入.*水饺/u.test(text))
    return "soak";
  if (/倒入.*挞皮/u.test(text) && actions?.includes("pour")) return "fillPastry";
  if (actions?.includes("heat") && actions.includes("mix") && /混合液|温热|溶解|不煮沸/u.test(text))
    return "warmMix";
  if (/火焰喷枪|喷枪.*灼烧/u.test(text)) return "torch";
  if (/搅打|打发/u.test(text) && !/料理机|破壁机|榨汁机/u.test(text)) return "mix";
  if (
    /热锅凉油|润锅|润油|油.*烧至.*(?:热|烟)|油温烧至/u.test(text) &&
    !/下入|炸至|翻炒|炖|焖/u.test(text)
  )
    return "heat";
  if (/拍碎|压碎|捣碎/u.test(text) && !/炒|煮|烤/u.test(text)) return "crush";
  if (/蛋液/u.test(text) && /锅|开.*火|翻动|凝固/u.test(text) && !/汤|蒸|煮/u.test(text))
    return "stirFry";
  if (/架空/u.test(text) && !actions?.includes("steam")) return "rack";
  if (/蒸锅/u.test(text) && actions?.includes("heat") && !actions.includes("steam"))
    return "steamerHeat";
  if (actions?.includes("pour") && /鱼身|鱼与|淋.*鱼|浇.*鱼/u.test(text)) return "pour";
  if (/炒.*糖色|熬糖|拔丝|焦糖/u.test(text)) return "caramelize";
  if (/淋入蛋液|蛋花/u.test(text) && actions?.includes("add")) return "boil";
  if (actions?.includes("crack") && !actions.includes("mix")) return "crack";
  if (actions?.includes("plate")) return "plate";
  if (actions?.length === 1 && actions.includes("season")) return "mix";
  if (actions?.includes("peel") && !actions.includes("cut")) return "peel";
  if (
    actions?.includes("cut") &&
    actions.every((action) => ["cut", "wash", "peel", "score", "drain"].includes(action))
  )
    return "cut";

  if (actions?.includes("score") && !actions.includes("marinate")) return "score";
  if (isWashingAction(actions)) return "wash";
  if (
    /洗净|洗干净|清洗|冲洗|漂洗|淘洗|洗菜/u.test(text) &&
    !/切|剁|削|去皮|改刀|腌|煮|焯|炒|煎|炖|蒸|烤|搅拌|混合|捶打|杯/u.test(text)
  )
    return "wash";

  if (currentStepIndex === lastStepIndex && isFinishingStep(instruction)) return "plate";
  if (
    actions?.some((action) => ["remove", "reserve", "transfer"].includes(action)) &&
    actions.every((action) => ["remove", "reserve", "transfer", "turnOffHeat"].includes(action))
  )
    return "rest";
  if (actions?.includes("brew")) return "brew";
  if (category === "drink" && actions?.includes("pound")) return "muddle";
  if (category === "drink" && actions?.includes("add") && /放入.*杯/u.test(text)) return "cupAdd";
  if (actions?.includes("microwave")) return "microwave";
  if (actions?.includes("bake")) return "bake";
  if (actions?.includes("airFry")) return "airFry";
  if (actions?.includes("steam")) return "steam";
  if (actions?.includes("chill")) return "chill";
  if (actions?.includes("simmer")) return "simmer";
  if (actions?.includes("thicken")) return "thicken";
  if (actions?.includes("reduce")) return "reduce";
  if (actions?.some((action) => ["boil", "blanch"].includes(action))) return "boil";
  if (actions?.includes("stirFry")) return "stirFry";
  if (actions?.includes("fry"))
    return /炸/u.test(text) ? "deepFry" : /煎/u.test(text) ? "panFry" : "stirFry";
  if (
    actions?.some((action) => ["heat", "turnOnHeat"].includes(action)) &&
    actions.every((action) => ["heat", "turnOnHeat", "add"].includes(action)) &&
    !/烤箱|微波|空气炸/u.test(text)
  )
    return "heat";
  if (actions?.includes("marinate")) return "marinate";
  if (/拔丝|熬糖|糖色|焦糖|糖.*(?:褐色|琥珀色|融化)/u.test(text)) return "caramelize";
  if (/微波/u.test(text)) return "microwave";
  if (/空气炸/u.test(text)) return "airFry";
  if (/油炸|炸至|煎炸|下油锅炸/u.test(text)) return "deepFry";
  if (/烤箱|烘烤|烤制|烤盘/u.test(text)) return "bake";
  if (
    actions?.some((action) => ["heat", "turnOnHeat"].includes(action)) &&
    actions.every((action) => ["heat", "turnOnHeat", "add"].includes(action))
  )
    return "heat";
  if (/烧烤(?!撒料|料)|炙烤|烤架/u.test(text)) return "grill";
  if (/煎至|香煎|两面煎/u.test(text)) return "panFry";
  if (/蒸笼|蒸锅|上锅蒸|蒸制|清蒸|隔水蒸/u.test(text)) return "steam";
  if (/冲泡|焖泡|泡茶|沸水.*茶|茶.*沸水|茶包|袋泡红茶/u.test(text)) return "brew";
  if (/冰箱|冷藏|冷冻|冰镇/u.test(text)) return "chill";
  if (/料理机|破壁机|榨汁机|搅拌机|打成.*泥/u.test(text)) return "blend";
  if (/凉拌|拌匀|拌入/u.test(text) && !/锅|火/u.test(text)) return "coldMix";
  if (/勾芡/u.test(text)) return "thicken";
  if (/烫熟|汆|焯/u.test(text)) return "boil";
  if (/收汁|收浓/u.test(text) && !/炖|焖/u.test(text)) return "reduce";
  if (/小火|慢炖|焖|煨/u.test(text)) return "simmer";
  if (/红烧|烧至|炖/u.test(text)) return "braise";
  if (/水开|烧开|煮|焯|汆|烫熟/u.test(text)) return "boil";
  if (/炒|爆香|煸香|翻炒|滑炒/u.test(text)) return "stirFry";
  if (/腌制|腌渍|静置.*入味|码味/u.test(text)) return "marinate";
  if (category === "drink" && /捶打|锤打|捣|捶/u.test(text)) return "muddle";
  if (category === "drink" && /(?:放入|加入|倒入|倒进|装入|入杯)[^。；\n]*杯|入杯/u.test(text))
    return "cupAdd";
  if (/搅拌|搅匀|混合|打散|揉|和面/u.test(text)) return "mix";
  if (/切|剁|改刀/u.test(text)) return "cut";
  if (/削皮|去皮|剥皮|剥去.*皮/u.test(text)) return "peel";
  if (/盛出|捞出|取出|沥干/u.test(text)) return "rest";
  if (/切|洗|削|去皮|剁|拍|撕|改刀|切片|切块/u.test(text)) return "prep";
  if (isFinishingStep(instruction)) return "rest";

  return "mix";
};

const getIngredientState = (
  method: CookingMethod,
  completion: number,
  isActive: boolean
): IngredientState => {
  if (method === "wash") return isActive ? "washed" : "raw";
  if (method === "cut" || method === "score" || method === "peel")
    return isActive ? "prepped" : "raw";
  if (completion >= 1) return "cooked";
  if (method === "prep") return completion === 0 ? "raw" : "prepped";
  if (["marinate", "mix", "coldMix", "cupAdd", "muddle"].includes(method))
    return isActive ? "prepped" : "raw";
  if (method === "plate") return "cooked";
  if (method === "rest") return isActive ? "cooked" : completion > 0.45 ? "prepped" : "raw";

  return isActive ? "cooking" : completion > 0.45 ? "prepped" : "raw";
};

const ingredientIsActive = (name: string, instruction: string) => {
  const compactName = name.replaceAll(/食用|饮用|新鲜|适量|少量|全脂/gu, "");
  const candidates = [compactName, compactName.slice(0, 4), compactName.slice(-3)].filter(
    (candidate) => candidate.length > 0
  );

  if (/鸡蛋|鸭蛋|鹅蛋/u.test(name) && /蛋液|打蛋|炒蛋|蛋黄|蛋清/u.test(instruction)) return true;
  if (/蒜/u.test(name) && /蒜/u.test(instruction)) return true;
  if (/葱/u.test(name) && /葱/u.test(instruction)) return true;

  return candidates.some((candidate) => instruction.includes(candidate));
};

const getFinishedDishForm = (
  recipeTitle: string,
  category: RecipeCategory,
  ingredients: KitchenIngredientVisual[]
): FinishedDishForm => {
  if (category === "drink") return "cup";
  if (category === "condiment") return "bowl";
  if (/蛋糕|面包|糕|蛋挞|布丁|慕斯|奶冻|雪媚娘|冰淇淋|饼干/u.test(recipeTitle)) {
    return "cake";
  }
  if (/水饺|饺子|馄饨|包子|烧卖|锅贴|汤圆/u.test(recipeTitle)) return "dumplings";
  if (/披萨|煎饼|烙饼|烧饼|馅饼|烤饼|司康/u.test(recipeTitle)) return "flatbread";
  if (/面|粉|粉丝|凉皮|螺蛳粉/u.test(recipeTitle)) return "noodles";
  if (/粥/u.test(recipeTitle)) return "bowl";
  if (/饭|焖饭|炒饭|盖饭|饭团/u.test(recipeTitle)) return "rice";
  if (/汤|羹|火锅|水煮|煲/u.test(recipeTitle)) return "bowl";
  if (/鱼/u.test(recipeTitle) && ingredients.some(({ kind }) => kind === "fish")) {
    return "wholeFish";
  }

  return "platter";
};

const getOilStage = (
  model: SourceRecipeWorkbenchModel,
  stepIndex: number
): KitchenSceneModel["oilStage"] => {
  if (model.presentationScene !== "chiliOil") return undefined;
  const step = model.steps[stepIndex - 1];
  if (!step) return "ready";
  if (step.actions?.includes("plate")) return "finish";
  if (step.actions?.includes("turnOffHeat")) return "heatAndCool";
  if (step.actions?.includes("pour")) return "pour";

  return "mix";
};

export const buildKitchenSceneModel = (
  sourceModel: SourceRecipeWorkbenchModel,
  recipeTitle: string,
  category: RecipeCategory,
  currentStepIndex: number
): KitchenSceneModel => {
  const ingredientNames = sourceModel.ingredients
    .map(cleanIngredientName)
    .filter(
      (name) =>
        name.length > 0 && !toolPattern.test(name) && !/^(原料|工具|材料|调料)[:：]?$/u.test(name)
    );
  const sourceMethods = sourceModel.steps.map((step, index) =>
    getCookingMethod(step.instruction, index + 1, sourceModel.steps.length, category, step.actions)
  );
  const model = buildSourceAnimationContext(
    sourceModel,
    sourceMethods,
    ingredientNames,
    ingredientIsActive
  );
  const currentStep = model.steps[currentStepIndex - 1];
  const instruction = currentStep?.instruction ?? model.introduction.join(" ");
  const completion = model.steps.length === 0 ? 0 : currentStepIndex / model.steps.length;
  const oilStage = getOilStage(model, currentStepIndex);
  const inferredMethod = oilStage
    ? (
        {
          ready: "prep",
          mix: "mix",
          heatAndCool: "heatOil",
          pour: "pourOil",
          finish: "plate",
        } as const
      )[oilStage]
    : (!sourceModel.steps[currentStepIndex - 1]?.actions && sourceMethods[currentStepIndex - 1]) ||
      getCookingMethod(
        instruction,
        currentStepIndex,
        model.steps.length,
        category,
        currentStep?.actions
      );
  const previousCookingMethod =
    currentStep?.heatOn &&
    currentStep.actions?.length === 1 &&
    currentStep.actions.includes("season")
      ? model.steps
          .slice(0, currentStepIndex - 1)
          .reverse()
          .find((step) =>
            step.actions?.some((action) =>
              ["simmer", "boil", "blanch", "stirFry", "fry", "reduce"].includes(action)
            )
          )
      : undefined;
  const method = previousCookingMethod
    ? getCookingMethod(
        previousCookingMethod.instruction,
        1,
        99,
        category,
        previousCookingMethod.actions
      )
    : inferredMethod === "mix" && currentStep?.heatOn
      ? "stirFry"
      : inferredMethod;
  const residentNames =
    currentStep?.heatOn &&
    [
      "stirFry",
      "boil",
      "simmer",
      "braise",
      "caramelize",
      "grill",
      "deepFry",
      "panFry",
      "reduce",
      "thicken",
    ].includes(method)
      ? getVesselContents(model, currentStepIndex)
      : new Set<string>();
  const activeNames = new Set([
    ...residentNames,
    ...(currentStep?.ingredientNames ??
      ingredientNames.filter((name) => ingredientIsActive(name, instruction))),
  ]);
  const completedInstructions = model.steps
    .slice(0, currentStepIndex)
    .map((step) => step.instruction);
  const coldDrink =
    category === "drink" &&
    ["prep", "cupAdd", "muddle", "mix", "coldMix", "plate", "rest", "chill", "brew"].includes(
      method
    );
  const allIngredients = ingredientNames.map(
    (name): KitchenIngredientVisual => ({
      form: model.steps
        .slice(0, currentStepIndex)
        .reduce<KitchenIngredientVisual["form"]>((form, step) => {
          const active = step.ingredientNames
            ? step.ingredientNames.includes(name)
            : ingredientIsActive(name, step.instruction);
          if (!active) return form;
          const kind = getIngredientKind(name);
          if (/蛋挞皮/u.test(name) && step.actions?.includes("pour")) return "tart";
          if (form === "tart") return form;
          if (kind === "egg" && step.actions?.includes("crack") && !step.actions.includes("mix"))
            return "sunny";
          if (form === "sunny") return form;
          if (kind === "egg" && step.heatOn && /淋入蛋液|蛋花/u.test(step.instruction))
            return "ribbons";
          if (form === "ribbons") return form;
          if (kind === "butter" && step.heatOn) return "melted";
          if (/粉|面|末|碎|芝麻/u.test(name)) return form;
          if (
            kind === "egg" &&
            (form === "curds" ||
              (step.actions?.some((action) => ["fry", "stirFry"].includes(action)) &&
                (form === "beaten" || /蛋液/u.test(step.instruction))))
          )
            return "curds";
          if (
            kind === "egg" &&
            (step.actions?.includes("mix") || /打散|蛋液|搅匀/u.test(step.instruction))
          )
            return "beaten";
          if (
            !["egg", "liquid", "oil", "sauce", "seasoning", "sugar", "rice", "tea"].includes(kind)
          ) {
            if (
              step.actions?.includes("cut") ||
              /切成|切块|切片|切碎|剁碎|拍碎|压碎|捣碎/u.test(step.instruction)
            )
              return "pieces";
            if (step.actions?.includes("peel") || /去皮|剥去.*皮/u.test(step.instruction))
              return "peeled";
          }

          return form;
        }, undefined),
      kind: getIngredientKind(name),
      name,
      state: oilStage
        ? currentStepIndex === model.steps.length
          ? "cooked"
          : model.steps
                .slice(0, currentStepIndex)
                .some((step) => step.ingredientNames?.includes(name))
            ? "prepped"
            : "raw"
        : coldDrink
          ? completedInstructions.some((text) => ingredientIsActive(name, text))
            ? "prepped"
            : "raw"
          : getIngredientState(method, completion, activeNames.has(name)),
    })
  );
  const mainIngredients = allIngredients.filter(
    ({ kind }) => !["oil", "sauce", "seasoning", "sugar"].includes(kind)
  );
  const explicitActiveIngredients = allIngredients.filter(({ name }) => activeNames.has(name));
  const activeIngredients = (
    currentStep?.ingredientNames !== undefined || explicitActiveIngredients.length > 0
      ? explicitActiveIngredients
      : mainIngredients
  ).slice(0, 9);
  const dishForm = getFinishedDishForm(recipeTitle, category, allIngredients);
  const liquidAdded = completedInstructions.some((text) =>
    /(?:加入|倒入|倒进|注入|冲入|放入|添加)[^，。；\n]*(?:水|奶|茶汤|汁|液|糖浆)|(?:水|奶|茶汤|汁|液|糖浆)[^，。；\n]*(?:倒入|倒进|注入|加入)/u.test(
      text
    )
  );
  const muddled = completedInstructions.some((text) => /捶打|锤打|捣|捶/u.test(text));
  const cupFill = category === "drink" ? (liquidAdded ? 0.72 : muddled ? 0.12 : 0) : 0;
  const finishingPresentation =
    method === "plate"
      ? {
          bowl: ["盛碗完成", "深口餐碗"],
          cake: ["脱模完成", "甜品托盘"],
          cup: ["调制完成", "成品饮品杯"],
          dumplings: ["装盘完成", "浅口瓷盘"],
          flatbread: ["切片完成", "木质餐板"],
          noodles: ["盛面完成", "面食大碗"],
          platter: ["装盘完成", "成品餐盘"],
          rice: ["盛饭完成", "米饭餐碗"],
          wholeFish: ["整鱼装盘", "长椭圆鱼盘"],
        }[dishForm]
      : undefined;

  return {
    heatOn: currentStep?.heatOn,
    actions: currentStep?.actions,
    instruction,
    oilStage,
    activeIngredients,
    allIngredients,
    atmosphere: oilStage
      ? oilStage === "pour"
        ? "warm"
        : "dry"
      : ["chill", "coldMix"].includes(method)
        ? "cool"
        : [
              "prep",
              "wash",
              "cut",
              "peel",
              "rest",
              "marinate",
              "mix",
              "plate",
              "cupAdd",
              "muddle",
            ].includes(method)
          ? "dry"
          : ["brew", "steam", "boil", "simmer", "braise"].includes(method)
            ? "warm"
            : "hot",
    category,
    completion,
    cupFill,
    dishForm: oilStage ? "bowl" : dishForm,
    method,
    methodLabel: oilStage
      ? {
          ready: "准备原料",
          mix: "拌匀辣椒面",
          heatAndCool: "热油炼香，关火降温",
          pour: "泼油搅拌",
          finish: "温热加糖",
        }[oilStage]
      : method === "stirFry" && currentStep?.heatOn === false
        ? "离火翻拌"
        : method === "stirFry" && /小火|微火|低火/u.test(instruction)
          ? "小火翻拌"
          : (finishingPresentation?.[0] ?? methodLabels[method]),
    recipeTitle,
    vesselLabel:
      (oilStage
        ? oilStage === "heatAndCool" || oilStage === "pour"
          ? "油锅 → 耐热碗"
          : "耐热碗"
        : undefined) ??
      finishingPresentation?.[1] ??
      (category === "drink" && method === "mix" ? "玻璃杯" : vesselLabels[method]),
  };
};
