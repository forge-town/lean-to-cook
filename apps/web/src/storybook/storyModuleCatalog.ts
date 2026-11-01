export type StoryModuleTier = "deep" | "hybrid" | "structural" | "theory" | "visual";

export interface StoryModuleInfo {
  frontendFiles: readonly string[];
  id: string;
  leanFiles: readonly string[];
  route: string;
  summary: string;
  supportFiles: readonly string[];
  tier: StoryModuleTier;
  title: string;
}

export const storyModules = {
  codeMap: {
    frontendFiles: [
      "apps/web/src/storybook/CodeModuleMap.tsx",
      "apps/web/src/storybook/storyModuleCatalog.ts",
    ],
    id: "code-map",
    leanFiles: [],
    route: "Storybook / 00 Architecture",
    summary: "把网页模块、路由、React 文件、数据层和 Lean 文件放在同一张可浏览的代码地图里。",
    supportFiles: ["apps/web/.storybook/main.ts", "apps/web/.storybook/preview.tsx"],
    tier: "hybrid",
    title: "代码结构总览",
  },
  recipeLibrary: {
    frontendFiles: [
      "apps/web/src/pages/RecipeLibraryPage/RecipeLibraryPage.tsx",
      "apps/web/src/pages/RecipeLibraryPage/RecipeLibraryPageContent.tsx",
      "apps/web/src/pages/RecipeLibraryPage/RecipeWorkbenchCatalog.tsx",
    ],
    id: "recipe-library",
    leanFiles: [
      "packages/lean-proofs/LeanToCook/Generated/SourceCatalog.lean",
      "packages/lean-proofs/LeanToCook/Verification/CrossRecipe.lean",
    ],
    route: "/library",
    summary: "首页总目录：展示 373 份结构证书、20 份深度案例和跨菜谱推论。",
    supportFiles: [
      "apps/web/src/pages/RecipeLibraryPage/_store/recipeLibraryPageSlice.ts",
      "packages/schemas/src/recipes/recipeCatalog.ts",
      "packages/schemas/src/sourceRecipes/sourceRecipeCatalog.ts",
    ],
    tier: "hybrid",
    title: "证明库首页",
  },
  sourceLibrary: {
    frontendFiles: [
      "apps/web/src/pages/SourceRecipeLibraryPage/SourceRecipeLibraryPage.tsx",
      "apps/web/src/pages/SourceRecipeLibraryPage/SourceRecipeLibraryPageContent.tsx",
      "apps/web/src/pages/SourceRecipePage/SourceRecipePage.tsx",
    ],
    id: "source-library",
    leanFiles: ["packages/lean-proofs/LeanToCook/Generated/SourceCatalog.lean"],
    route: "/source-recipes · /source-recipe/:sourceRecipeId",
    summary: "固定 commit 的 HowToCook 原文目录与只读 Markdown 档案。",
    supportFiles: ["apps/web/src/sourceRecipeDocuments.ts", "content/how-to-cook/dishes/**/*.md"],
    tier: "structural",
    title: "源菜谱档案库",
  },
  structuralWorkbench: {
    frontendFiles: [
      "apps/web/src/pages/SourceRecipeWorkbenchPage/SourceRecipeWorkbenchPage.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/SourceRecipeWorkbenchPageContent.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/sourceRecipeWorkbenchModel.ts",
    ],
    id: "structural-workbench",
    leanFiles: ["packages/lean-proofs/LeanToCook/Generated/SourceCatalog.lean"],
    route: "/source-workbench/:sourceRecipeId",
    summary: "373 道菜共用的 Lean 结构证书工作台，逐步执行并展示六项内核检查。",
    supportFiles: [
      "scripts/generate-source-recipe-proofs.ts",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/_store/sourceRecipeWorkbenchPageSlice.ts",
    ],
    tier: "structural",
    title: "Lean 结构证书工作台",
  },
  simulator: {
    frontendFiles: [
      "apps/web/src/pages/SimulatorPage/SimulatorPage.tsx",
      "apps/web/src/pages/SimulatorPage/SimulatorPageContent.tsx",
      "apps/web/src/pages/SimulatorPage/simulatorStepMachine.ts",
    ],
    id: "theorem-driven-simulator",
    leanFiles: [
      "packages/lean-proofs/LeanToCook/CatalogCases/Proofs.lean",
      "packages/lean-proofs/LeanToCook/Recipes/SteamedSeaBass/Proofs.lean",
    ],
    route: "/simulator?recipe=:recipeId",
    summary: "从 requires、effects 和已编译定理推进厨房状态；失败动作保持原状态并解释阻断原因。",
    supportFiles: [
      "apps/web/src/pages/SimulatorPage/_store/simulatorPageSlice.ts",
      "apps/web/src/pages/SimulatorPage/simulatorStepMachine.test.ts",
      "packages/schemas/src/recipes/recipeCatalog.ts",
    ],
    tier: "deep",
    title: "证明驱动做菜模拟器",
  },
  deepWorkbench: {
    frontendFiles: [
      "apps/web/src/pages/RecipeProofPage/RecipeProofPage.tsx",
      "apps/web/src/pages/RecipeProofPage/RecipeProofPageContent.tsx",
      "apps/web/src/pages/RecipeProofPage/ProofStepper.tsx",
      "apps/web/src/pages/RecipeProofPage/ProofInspector.tsx",
    ],
    id: "deep-workbench",
    leanFiles: [
      "packages/lean-proofs/LeanToCook/Recipes/TomatoEgg/Proofs.lean",
      "packages/lean-proofs/LeanToCook/CatalogCases/Proofs.lean",
      "packages/lean-proofs/LeanToCook/Verification/CrossRecipe.lean",
    ],
    route: "/recipes/:recipeId",
    summary: "20 道菜的逐状态深度证明阅读器，连接步骤、状态、定理和 Lean 源码。",
    supportFiles: [
      "apps/web/src/pages/RecipeProofPage/recipeProofSources.ts",
      "packages/schemas/src/recipes/recipeCatalog.ts",
    ],
    tier: "deep",
    title: "Lean 深度证明工作台",
  },
  kitchenScene: {
    frontendFiles: [
      "apps/web/src/pages/SourceRecipeWorkbenchPage/KitchenScene/KitchenScene.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/CookingVessel/CookingVessel.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/FinishedDish/FinishedDish.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/kitchenSceneModel.ts",
    ],
    id: "kitchen-scene",
    leanFiles: [],
    route: "嵌入 /source-workbench/:sourceRecipeId",
    summary: "根据菜名、食材和当前步骤，展示相应的器皿、火候、动作和成品。",
    supportFiles: ["apps/web/src/pages/SourceRecipeWorkbenchPage/kitchenSceneModel.test.ts"],
    tier: "visual",
    title: "厨房场景引擎",
  },
  ingredientVisual: {
    frontendFiles: [
      "apps/web/src/pages/SourceRecipeWorkbenchPage/IngredientIllustration/IngredientIllustration.tsx",
      "apps/web/src/pages/SourceRecipeWorkbenchPage/ingredientIconCatalog.ts",
    ],
    id: "ingredient-visual",
    leanFiles: [],
    route: "嵌入 KitchenScene",
    summary: "食材类型与 raw、prepped、cooking、cooked 四种视觉状态的基础组件。",
    supportFiles: [
      "apps/web/src/pages/SourceRecipeWorkbenchPage/kitchenSceneModel.ts",
      "apps/web/public/ingredient-icons/fluent-flat/*.svg",
      "apps/web/src/tailwind.css",
    ],
    tier: "visual",
    title: "食材状态图形",
  },
  theoryLibrary: {
    frontendFiles: [
      "apps/web/src/pages/TheoryLibraryPage/TheoryLibraryPage.tsx",
      "apps/web/src/pages/TheoryLibraryPage/TheoryLibraryPageContent.tsx",
    ],
    id: "theory-library",
    leanFiles: [
      "packages/lean-proofs/LeanToCook/Theories/KitchenTheory.lean",
      "packages/lean-proofs/LeanToCook/Verification/AppliedTheory.lean",
    ],
    route: "/theories",
    summary: "18 条基础理论及其应用证明的前端阅读器。",
    supportFiles: ["packages/schemas/src/theories", "packages/schemas/src/applications"],
    tier: "theory",
    title: "厨房基础理论库",
  },
} as const satisfies Record<string, StoryModuleInfo>;

export const storyModuleCatalog = Object.values(storyModules);
