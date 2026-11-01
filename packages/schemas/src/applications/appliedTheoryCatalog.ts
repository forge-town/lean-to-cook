import { appliedTheorySchema } from "../domain/AppliedTheory.schema";

export const appliedTheoryCatalog = [
  appliedTheorySchema.parse({
    caseIds: ["microwave-sunny-side-egg"],
    conclusion: "microwavePlanAllowed(sunnyEgg, metal) = false",
    id: "sunny-egg-container-guard",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "sunny_egg_metal_container_is_rejected",
    },
    reductions: [
      {
        expression: "certified(sunnyEgg) ∧ startAllowed(metal) = true ∧ false = false",
        reason: "流程证书不能绕过设备容器守卫。",
      },
    ],
    scale: "vertical",
    statement: "太阳蛋流程即使已经认证，使用金属容器仍会被微波启动守卫拒绝。",
    summary: "把微波炉理论的容器材料检查接到太阳蛋案例的执行证书之前。",
    theoryIds: ["microwave"],
    title: "认证菜谱不能绕过微波容器守卫",
  }),
  appliedTheorySchema.parse({
    caseIds: ["air-fryer-chicken-wings"],
    conclusion: "published = 17min ∧ firstTrial = 15min ∧ 15 < 17",
    id: "air-fryer-first-trial",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "air_fryer_wings_first_trial_is_shorter",
    },
    reductions: [
      {
        expression: "1020s / 60 = 17min; ⌊17 × 9 / 10⌋ = 15min",
        reason: "把鸡翅的两段热时长交给首次试做缩放理论计算。",
      },
    ],
    scale: "vertical",
    statement: "空气炸锅鸡翅发布热时长为 17 分钟，首次试做理论建议缩短为 15 个整分钟。",
    summary: "案例提供实际时长，设备理论提供保守缩放函数。",
    theoryIds: ["air-fryer"],
    title: "首次空气炸试做自动缩短两分钟",
  }),
  appliedTheorySchema.parse({
    caseIds: ["chili-oil"],
    conclusion: "amount(chili) = 100g ∧ T₇ = 210°C",
    id: "chili-oil-temperature-scale",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "chili_oil_level_seven_matches_210c",
    },
    reductions: [
      {
        expression: "T₇ = 30 × 7 = 210°C",
        reason: "七成油温的俗称精确落到菜谱给出的泼油温度。",
      },
    ],
    scale: "vertical",
    statement: "油温判断理论中的七成油温严格等于油泼辣子案例的 210°C 目标。",
    summary: "把经验成数转换成可判定摄氏温度。",
    theoryIds: ["oil-temperature"],
    title: "七成油温与 210°C 在 Lean 中相遇",
  }),
  appliedTheorySchema.parse({
    caseIds: ["steamed-sea-bass"],
    conclusion: "Executable(steamedBass) ∧ steamAvailable(boiling, openPath)",
    id: "steamed-bass-medium-evidence",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "steamed_bass_has_usable_steam",
    },
    reductions: [
      {
        expression: "waterBoiling ∧ steamPathOpen ⟹ steamAvailable",
        reason: "分别证明流程可执行、蒸汽可用，再把两个结论合在一起。",
      },
    ],
    scale: "vertical",
    statement: "清蒸鲈鱼计划可执行，并且沸水与开放蒸汽通路共同产生可用蒸汽。",
    summary: "把具体蒸鱼状态机和通用蒸汽介质理论连接起来。",
    theoryIds: ["steaming"],
    title: "能执行的蒸鱼计划还需要可用蒸汽",
  }),
  appliedTheorySchema.parse({
    caseIds: ["egg-fried-rice"],
    conclusion: "saltTarget = 4500mg ∧ 4000mg ≤ saltTarget ≤ 6000mg",
    id: "fried-rice-salt-fit",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "egg_fried_rice_salt_target_fits_source_range",
    },
    reductions: [
      {
        expression: "500g × 0.9% = 4500mg ∈ [4000, 6000]mg",
        reason: "理论比例计算出的点值落在蛋炒饭源菜谱盐量区间内。",
      },
    ],
    scale: "vertical",
    statement: "500g 蛋炒饭主体按 0.9% 理论得到 4500mg 盐，位于菜谱 4–6g 区间。",
    summary: "这是相对量词与菜谱区间真正发生交集的例子。",
    theoryIds: ["seasoning-technique"],
    title: "相对盐比落入蛋炒饭的允许区间",
  }),
  appliedTheorySchema.parse({
    caseIds: ["lemon-water"],
    conclusion: "knownSafety → coldAllowed; unknownSafety → rejected",
    id: "lemon-water-cold-safety",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "lemon_water_cold_path_requires_known_safety",
    },
    reductions: [
      {
        expression: "coldDishAllowed(safetyKnown) ∧ ¬usesHeat(lemonWater)",
        reason: "不点火只描述加工路径，不能替代原料可生食的知识。",
      },
    ],
    scale: "vertical",
    statement: "柠檬水保持冷制路径，但只有原料安全性已知时冷制守卫才放行。",
    summary: "证明“不加热”与“安全”是两个不同谓词。",
    theoryIds: ["cold-dish"],
    title: "冷制不自动等于安全",
  }),
  appliedTheorySchema.parse({
    caseIds: ["air-fryer-chicken-wings"],
    conclusion: "certified = true ∧ unmeasured = false ∧ measured(74°C) = true",
    id: "poultry-evidence-boundary",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "air_fryer_wings_temperature_evidence_is_independent",
    },
    reductions: [
      {
        expression: "flowCertificate ≠ centerTemperatureEvidence",
        reason: "流程结束不代表测过温；模型需要单独传入 74°C 的中心温度测量值。",
      },
    ],
    scale: "vertical",
    statement: "空气炸锅鸡翅流程已认证，但未测温仍被拒绝；输入 74°C 中心温度后安全守卫成立。",
    summary: "把未知温度建模为独立构造子，而不是用零或猜测值代替。",
    theoryIds: ["food-safety"],
    title: "流程证书不是食品安全证书",
  }),
  appliedTheorySchema.parse({
    caseIds: [
      "microwave-sunny-side-egg",
      "air-fryer-chicken-wings",
      "chili-oil",
      "steamed-sea-bass",
      "egg-fried-rice",
      "lemon-water",
    ],
    conclusion: "CertifiedFlow ∧ ApplianceGuards ∧ MediumEvidence ∧ NumericBounds ∧ SafetyEvidence",
    id: "certification-evidence-obligations",
    lean: {
      module: "LeanToCook.Verification.AppliedTheory",
      theorem: "certification_does_not_erase_evidence_obligations",
    },
    reductions: [
      {
        expression: "seven verified applications ↦ one heterogeneous certificate",
        reason: "设备、加热介质、用量和食品安全分别检查，综合定理再把这些结果与流程结论合在一起。",
      },
    ],
    scale: "synthesis",
    statement:
      "流程通过检查后，仍要分别检查设备、加热介质、用量和食品安全；七个局部结论可以组合成一份证明。",
    summary: "把流程、设备、加热介质、用量和食品安全的检查分开写清楚，再把七个结论合成一份证明。",
    theoryIds: [
      "microwave",
      "air-fryer",
      "oil-temperature",
      "steaming",
      "seasoning-technique",
      "cold-dish",
      "food-safety",
    ],
    title: "步骤通过后还要检查什么",
  }),
] as const;
