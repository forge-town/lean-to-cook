import LeanToCook.Recipes.TomatoEgg.Proofs
import LeanToCook.Recipes.ColaWings.Proofs
import LeanToCook.Recipes.ThreeFresh.Proofs
import LeanToCook.Recipes.ButterShrimp.Proofs
import LeanToCook.Recipes.CornRibSoup.Proofs
import LeanToCook.Recipes.SteamedSeaBass.Proofs
import LeanToCook.CatalogCases.Proofs

namespace LeanToCook.CrossRecipe

/- `RecipeCase` closes the world over the recipes currently published in the
   library.  This lets us state properties about an arbitrary catalog member,
   rather than merely conjoining unrelated facts. -/
inductive RecipeCase where
  | tomatoEgg
  | colaWings
  | threeFresh
  | butterShrimp
  | cornRibSoup
  | steamedSeaBass
deriving Repr, DecidableEq

def planExecutable : RecipeCase → Bool
  | .tomatoEgg => (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan).isSome
  | .colaWings => (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan).isSome
  | .threeFresh => (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan).isSome
  | .butterShrimp => (ButterShrimp.run ButterShrimp.initialKitchen ButterShrimp.butterShrimpPlan).isSome
  | .cornRibSoup => (CornRibSoup.run CornRibSoup.initialKitchen CornRibSoup.cornRibSoupPlan).isSome
  | .steamedSeaBass => (SteamedSeaBass.run SteamedSeaBass.initialKitchen SteamedSeaBass.steamedSeaBassPlan).isSome

def planIsPlated : RecipeCase → Bool
  | .tomatoEgg => TomatoEgg.resultIsPlated
      (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan)
  | .colaWings => ColaWings.resultIsPlated
      (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan)
  | .threeFresh => ThreeFresh.resultIsPlated
      (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan)
  | .butterShrimp => ButterShrimp.resultIsPlated
      (ButterShrimp.run ButterShrimp.initialKitchen ButterShrimp.butterShrimpPlan)
  | .cornRibSoup => CornRibSoup.resultIsPlated
      (CornRibSoup.run CornRibSoup.initialKitchen CornRibSoup.cornRibSoupPlan)
  | .steamedSeaBass => SteamedSeaBass.resultIsPlated
      (SteamedSeaBass.run SteamedSeaBass.initialKitchen SteamedSeaBass.steamedSeaBassPlan)

def planLeavesHeatOff : RecipeCase → Bool
  | .tomatoEgg => TomatoEgg.resultLeavesHeatOff
      (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan)
  | .colaWings => ColaWings.resultLeavesHeatOff
      (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan)
  | .threeFresh => ThreeFresh.resultLeavesHeatOff
      (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan)
  | .butterShrimp => ButterShrimp.resultLeavesHeatOff
      (ButterShrimp.run ButterShrimp.initialKitchen ButterShrimp.butterShrimpPlan)
  | .cornRibSoup => CornRibSoup.resultLeavesHeatOff
      (CornRibSoup.run CornRibSoup.initialKitchen CornRibSoup.cornRibSoupPlan)
  | .steamedSeaBass => SteamedSeaBass.resultLeavesHeatOff
      (SteamedSeaBass.run SteamedSeaBass.initialKitchen SteamedSeaBass.steamedSeaBassPlan)

def CertifiedRecipe (recipe : RecipeCase) : Prop :=
  planExecutable recipe = true ∧
  planIsPlated recipe = true ∧
  planLeavesHeatOff recipe = true

/- Every recipe selected from the current catalog carries the same public
   certificate: it executes, plates a dish, and leaves the heat off. -/
theorem every_catalog_recipe_is_certified (recipe : RecipeCase) :
    CertifiedRecipe recipe := by
  cases recipe with
  | tomatoEgg =>
      exact ⟨
        TomatoEgg.tomatoEggPlan_is_executable,
        TomatoEgg.tomatoEggPlan_plates_dish,
        TomatoEgg.tomatoEggPlan_leaves_heat_off
      ⟩
  | colaWings =>
      exact ⟨
        ColaWings.colaWingsPlan_is_executable,
        ColaWings.colaWingsPlan_plates_dish,
        ColaWings.colaWingsPlan_leaves_heat_off
      ⟩
  | threeFresh =>
      exact ⟨
        ThreeFresh.threeFreshPlan_is_executable,
        ThreeFresh.threeFreshPlan_plates_dish,
        ThreeFresh.threeFreshPlan_leaves_heat_off
      ⟩
  | butterShrimp =>
      exact ⟨
        ButterShrimp.butterShrimpPlan_is_executable,
        ButterShrimp.butterShrimpPlan_plates_dish,
        ButterShrimp.butterShrimpPlan_leaves_heat_off
      ⟩
  | cornRibSoup =>
      exact ⟨
        CornRibSoup.cornRibSoupPlan_is_executable,
        CornRibSoup.cornRibSoupPlan_plates_dish,
        CornRibSoup.cornRibSoupPlan_leaves_heat_off
      ⟩
  | steamedSeaBass =>
      exact ⟨
        SteamedSeaBass.steamedSeaBassPlan_is_executable,
        SteamedSeaBass.steamedSeaBassPlan_plates_dish,
        SteamedSeaBass.steamedSeaBassPlan_leaves_heat_off
      ⟩

/- Each model rejects a representative shortcut which violates an essential
   prerequisite.  Successful full plans are therefore not vacuous models in
   which every transition is accepted. -/
def rejectsPrematureStep : RecipeCase → Bool
  | .tomatoEgg => (TomatoEgg.run TomatoEgg.initialKitchen [.cutTomato]).isNone
  | .colaWings => (ColaWings.run ColaWings.initialKitchen [.glazeWings]).isNone
  | .threeFresh => (ThreeFresh.run ThreeFresh.initialKitchen [.combineThreeFresh]).isNone
  | .butterShrimp => (ButterShrimp.run ButterShrimp.initialKitchen [.butterSauceShrimp]).isNone
  | .cornRibSoup => (CornRibSoup.run CornRibSoup.initialKitchen [.simmerCarrot]).isNone
  | .steamedSeaBass => (SteamedSeaBass.run SteamedSeaBass.initialKitchen [.steamFish]).isNone

theorem every_catalog_recipe_rejects_a_premature_step (recipe : RecipeCase) :
    rejectsPrematureStep recipe = true := by
  cases recipe <;> decide

/- Fixed-batch quantities are homomorphisms from batch addition to quantity
   addition.  Here we expose the corresponding multiplication law for two
   independently modeled recipes. -/
theorem fixed_batch_quantities_scale_linearly (batches : Nat) :
    ColaWings.colaMlFor batches = batches * ColaWings.colaMlFor 1 ∧
    ColaWings.sugarGFor batches = batches * ColaWings.sugarGFor 1 ∧
    ThreeFresh.eggplantGFor batches = batches * ThreeFresh.eggplantGFor 1 ∧
    ThreeFresh.potatoGFor batches = batches * ThreeFresh.potatoGFor 1 ∧
    ThreeFresh.sauceWaterMlFor batches = batches * ThreeFresh.sauceWaterMlFor 1 := by
  simp [
    ColaWings.colaMlFor,
    ColaWings.sugarGFor,
    ThreeFresh.eggplantGFor,
    ThreeFresh.potatoGFor,
    ThreeFresh.sauceWaterMlFor,
    Nat.mul_comm
  ]

/- Scaling a bounded ingredient never inverts its interval. -/
theorem bounded_quantities_remain_well_formed (batches : Nat) :
    ColaWings.wingsMinFor batches ≤ ColaWings.wingsMaxFor batches ∧
    ThreeFresh.pepperMinFor batches ≤ ThreeFresh.pepperMaxFor batches := by
  constructor
  · exact Nat.mul_le_mul_right batches (by decide : 10 ≤ 12)
  · exact Nat.mul_le_mul_right batches (by decide : 3 ≤ 4)

/- The three new cooking methods expose observably different time contracts:
   rapid reduction, long liquid simmering, and bounded steam cooking. -/
theorem non_stir_fry_method_time_contracts :
    ButterShrimp.reduceSeconds = 15 ∧
    CornRibSoup.totalSimmerSeconds = 3600 ∧
    SteamedSeaBass.steamSeconds = 600 := by
  decide

theorem non_stir_fry_shortcuts_are_rejected :
    ButterShrimp.run ButterShrimp.initialKitchen [.butterSauceShrimp] = none ∧
    CornRibSoup.run CornRibSoup.initialKitchen [.simmerCarrot] = none ∧
    SteamedSeaBass.run SteamedSeaBass.initialKitchen [.steamFish] = none := by
  exact ⟨
    ButterShrimp.cannot_add_butter_before_searing,
    CornRibSoup.cannot_simmer_carrot_before_corn,
    SteamedSeaBass.cannot_steam_before_racking_and_heating
  ⟩

theorem all_three_plans_are_executable :
    (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan).isSome = true ∧
    (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan).isSome = true ∧
    (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan).isSome = true := by
  exact ⟨
    TomatoEgg.tomatoEggPlan_is_executable,
    ColaWings.colaWingsPlan_is_executable,
    ThreeFresh.threeFreshPlan_is_executable
  ⟩

theorem all_three_plans_finish_safely :
    TomatoEgg.resultIsPlated
      (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan) = true ∧
    TomatoEgg.resultLeavesHeatOff
      (TomatoEgg.run TomatoEgg.initialKitchen TomatoEgg.tomatoEggPlan) = true ∧
    ColaWings.resultIsPlated
      (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan) = true ∧
    ColaWings.resultLeavesHeatOff
      (ColaWings.run ColaWings.initialKitchen ColaWings.colaWingsPlan) = true ∧
    ThreeFresh.resultIsPlated
      (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan) = true ∧
    ThreeFresh.resultLeavesHeatOff
      (ThreeFresh.run ThreeFresh.initialKitchen ThreeFresh.threeFreshPlan) = true := by
  exact ⟨
    TomatoEgg.tomatoEggPlan_plates_dish,
    TomatoEgg.tomatoEggPlan_leaves_heat_off,
    ColaWings.colaWingsPlan_plates_dish,
    ColaWings.colaWingsPlan_leaves_heat_off,
    ThreeFresh.threeFreshPlan_plates_dish,
    ThreeFresh.threeFreshPlan_leaves_heat_off
  ⟩

theorem numeric_contracts_compose_across_recipes :
    (TomatoEgg.tomatoesFor 2 = 2 ∧
      TomatoEgg.eggsFor 2 = 3 ∧
      TomatoEgg.oilMlFor 2 = 12 ∧
      TomatoEgg.saltMinGFor 2 = 3 ∧
      TomatoEgg.saltMaxGFor 2 = 4 ∧
      TomatoEgg.sugarMaxGFor 2 = 4 ∧
      TomatoEgg.scallionMaxGFor 2 = 20) ∧
    (ColaWings.wingsMinFor 1 = 10 ∧
      ColaWings.wingsMaxFor 1 = 12 ∧
      ColaWings.colaMlFor 1 = 500 ∧
      ColaWings.sugarGFor 1 = 10 ∧
      ColaWings.soyGFor 1 = 15 ∧
      ColaWings.saltGFor 1 = 2) ∧
    (ThreeFresh.eggplantGFor 1 = 200 ∧
      ThreeFresh.potatoGFor 1 = 150 ∧
      ThreeFresh.pepperMinFor 1 = 3 ∧
      ThreeFresh.pepperMaxFor 1 = 4 ∧
      ThreeFresh.fryingOilMlFor 1 = 150 ∧
      ThreeFresh.finishingOilMlFor 1 = 15 ∧
      ThreeFresh.sauceWaterMlFor 1 = 80) := by
  exact ⟨
    TomatoEgg.two_serving_amounts,
    ColaWings.one_platter_amounts,
    ThreeFresh.one_batch_amounts
  ⟩

theorem reserve_then_recombine_is_reusable :
    TomatoEgg.reserveEggIndex < TomatoEgg.combineIndex ∧
    (ThreeFresh.potatoReserveIndex < ThreeFresh.combineIndex ∧
      ThreeFresh.eggplantReserveIndex < ThreeFresh.combineIndex) := by
  exact ⟨
    TomatoEgg.egg_is_reserved_before_combine,
    ThreeFresh.components_are_reserved_before_combine
  ⟩

/- The public library uses the ten category names from HowToCook. -/
inductive RecipeCategory where
  | vegetable
  | meat
  | aquatic
  | breakfast
  | staple
  | semiFinished
  | soup
  | drink
  | condiment
  | dessert
deriving Repr, DecidableEq, BEq

/- `LibraryCase` closes the expanded public catalog over all twenty recipes. -/
inductive LibraryCase where
  | tomatoEgg
  | colaWings
  | threeFresh
  | butterShrimp
  | cornRibSoup
  | steamedSeaBass
  | simpleBraisedPork
  | seaweedEggSoup
  | microwaveSunnyEgg
  | perfectBoiledEgg
  | eggFriedRice
  | zhajiangNoodles
  | frozenDumplings
  | airFryerWings
  | lemonWater
  | milkTea
  | chiliOil
  | sweetSourSauce
  | bakedEggTarts
  | coffeeCoconutJelly
deriving Repr, DecidableEq, BEq

def libraryCategory : LibraryCase → RecipeCategory
  | .tomatoEgg => .vegetable
  | .colaWings => .meat
  | .threeFresh => .vegetable
  | .butterShrimp => .aquatic
  | .cornRibSoup => .soup
  | .steamedSeaBass => .aquatic
  | .simpleBraisedPork => .meat
  | .seaweedEggSoup => .soup
  | .microwaveSunnyEgg => .breakfast
  | .perfectBoiledEgg => .breakfast
  | .eggFriedRice => .staple
  | .zhajiangNoodles => .staple
  | .frozenDumplings => .semiFinished
  | .airFryerWings => .semiFinished
  | .lemonWater => .drink
  | .milkTea => .drink
  | .chiliOil => .condiment
  | .sweetSourSauce => .condiment
  | .bakedEggTarts => .dessert
  | .coffeeCoconutJelly => .dessert

def libraryCases : List LibraryCase := [
  .tomatoEgg,
  .colaWings,
  .threeFresh,
  .butterShrimp,
  .cornRibSoup,
  .steamedSeaBass,
  .simpleBraisedPork,
  .seaweedEggSoup,
  .microwaveSunnyEgg,
  .perfectBoiledEgg,
  .eggFriedRice,
  .zhajiangNoodles,
  .frozenDumplings,
  .airFryerWings,
  .lemonWater,
  .milkTea,
  .chiliOil,
  .sweetSourSauce,
  .bakedEggTarts,
  .coffeeCoconutJelly
]

def categoryCaseCount (category : RecipeCategory) : Nat :=
  (libraryCases.filter (fun recipe => libraryCategory recipe == category)).length

def libraryCertified : LibraryCase → Bool
  | .tomatoEgg => planExecutable .tomatoEgg && planIsPlated .tomatoEgg && planLeavesHeatOff .tomatoEgg
  | .colaWings => planExecutable .colaWings && planIsPlated .colaWings && planLeavesHeatOff .colaWings
  | .threeFresh => planExecutable .threeFresh && planIsPlated .threeFresh && planLeavesHeatOff .threeFresh
  | .butterShrimp => planExecutable .butterShrimp && planIsPlated .butterShrimp && planLeavesHeatOff .butterShrimp
  | .cornRibSoup => planExecutable .cornRibSoup && planIsPlated .cornRibSoup && planLeavesHeatOff .cornRibSoup
  | .steamedSeaBass => planExecutable .steamedSeaBass && planIsPlated .steamedSeaBass && planLeavesHeatOff .steamedSeaBass
  | .simpleBraisedPork => CatalogCases.certified .simpleBraisedPork
  | .seaweedEggSoup => CatalogCases.certified .seaweedEggSoup
  | .microwaveSunnyEgg => CatalogCases.certified .microwaveSunnyEgg
  | .perfectBoiledEgg => CatalogCases.certified .perfectBoiledEgg
  | .eggFriedRice => CatalogCases.certified .eggFriedRice
  | .zhajiangNoodles => CatalogCases.certified .zhajiangNoodles
  | .frozenDumplings => CatalogCases.certified .frozenDumplings
  | .airFryerWings => CatalogCases.certified .airFryerWings
  | .lemonWater => CatalogCases.certified .lemonWater
  | .milkTea => CatalogCases.certified .milkTea
  | .chiliOil => CatalogCases.certified .chiliOil
  | .sweetSourSauce => CatalogCases.certified .sweetSourSauce
  | .bakedEggTarts => CatalogCases.certified .bakedEggTarts
  | .coffeeCoconutJelly => CatalogCases.certified .coffeeCoconutJelly

theorem libraryCases_are_complete (recipe : LibraryCase) : recipe ∈ libraryCases := by
  cases recipe <;> simp [libraryCases]

theorem every_category_has_exactly_two_cases (category : RecipeCategory) :
    categoryCaseCount category = 2 := by
  cases category <;> decide

theorem all_twenty_library_cases_are_certified (recipe : LibraryCase) :
    libraryCertified recipe = true := by
  cases recipe <;> decide

end LeanToCook.CrossRecipe
