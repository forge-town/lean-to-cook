import LeanToCook.CatalogCases.Spec

namespace LeanToCook.CatalogCases

theorem all_expansion_cases_are_certified (recipe : CatalogCase) : all_expansion_cases_are_certified_spec recipe := by
  change certified recipe = true
  cases recipe <;> decide

theorem all_expansion_cases_reject_premature_process (recipe : CatalogCase) : all_expansion_cases_reject_premature_process_spec recipe := by
  change run recipe initialKitchen [.process] = none
  cases recipe <;> decide

theorem all_expansion_amount_intervals_are_ordered (recipe : CatalogCase) : all_expansion_amount_intervals_are_ordered_spec recipe := by
  change amountMin recipe ≤ amountMax recipe
  cases recipe <;> decide

theorem simpleBraisedPork_is_certified : simpleBraisedPork_is_certified_spec  := by
  change certified .simpleBraisedPork = true
  decide

theorem simpleBraisedPork_rejects_premature_process : simpleBraisedPork_rejects_premature_process_spec  := by
  change run .simpleBraisedPork initialKitchen [.process] = none
  decide

theorem simpleBraisedPork_numeric_contract : simpleBraisedPork_numeric_contract_spec  := by
  change amountMin .simpleBraisedPork = 1500 ∧ amountMax .simpleBraisedPork = 2000 ∧ contractSeconds .simpleBraisedPork = 4800
  decide

theorem seaweedEggSoup_is_certified : seaweedEggSoup_is_certified_spec  := by
  change certified .seaweedEggSoup = true
  decide

theorem seaweedEggSoup_rejects_premature_process : seaweedEggSoup_rejects_premature_process_spec  := by
  change run .seaweedEggSoup initialKitchen [.process] = none
  decide

theorem seaweedEggSoup_numeric_contract : seaweedEggSoup_numeric_contract_spec  := by
  change amountMin .seaweedEggSoup = 10 ∧ amountMax .seaweedEggSoup = 10 ∧ contractSeconds .seaweedEggSoup = 230
  decide

theorem microwaveSunnyEgg_is_certified : microwaveSunnyEgg_is_certified_spec  := by
  change certified .microwaveSunnyEgg = true
  decide

theorem microwaveSunnyEgg_rejects_premature_process : microwaveSunnyEgg_rejects_premature_process_spec  := by
  change run .microwaveSunnyEgg initialKitchen [.process] = none
  decide

theorem microwaveSunnyEgg_numeric_contract : microwaveSunnyEgg_numeric_contract_spec  := by
  change amountMin .microwaveSunnyEgg = 1 ∧ amountMax .microwaveSunnyEgg = 1 ∧ contractSeconds .microwaveSunnyEgg = 180
  decide

theorem perfectBoiledEgg_is_certified : perfectBoiledEgg_is_certified_spec  := by
  change certified .perfectBoiledEgg = true
  decide

theorem perfectBoiledEgg_rejects_premature_process : perfectBoiledEgg_rejects_premature_process_spec  := by
  change run .perfectBoiledEgg initialKitchen [.process] = none
  decide

theorem perfectBoiledEgg_numeric_contract : perfectBoiledEgg_numeric_contract_spec  := by
  change amountMin .perfectBoiledEgg = 1 ∧ amountMax .perfectBoiledEgg = 1 ∧ contractSeconds .perfectBoiledEgg = 1980
  decide

theorem eggFriedRice_is_certified : eggFriedRice_is_certified_spec  := by
  change certified .eggFriedRice = true
  decide

theorem eggFriedRice_rejects_premature_process : eggFriedRice_rejects_premature_process_spec  := by
  change run .eggFriedRice initialKitchen [.process] = none
  decide

theorem eggFriedRice_numeric_contract : eggFriedRice_numeric_contract_spec  := by
  change amountMin .eggFriedRice = 500 ∧ amountMax .eggFriedRice = 500 ∧ contractSeconds .eggFriedRice = 1500
  decide

theorem zhajiangNoodles_is_certified : zhajiangNoodles_is_certified_spec  := by
  change certified .zhajiangNoodles = true
  decide

theorem zhajiangNoodles_rejects_premature_process : zhajiangNoodles_rejects_premature_process_spec  := by
  change run .zhajiangNoodles initialKitchen [.process] = none
  decide

theorem zhajiangNoodles_numeric_contract : zhajiangNoodles_numeric_contract_spec  := by
  change amountMin .zhajiangNoodles = 150 ∧ amountMax .zhajiangNoodles = 250 ∧ contractSeconds .zhajiangNoodles = 1800
  decide

theorem frozenDumplings_is_certified : frozenDumplings_is_certified_spec  := by
  change certified .frozenDumplings = true
  decide

theorem frozenDumplings_rejects_premature_process : frozenDumplings_rejects_premature_process_spec  := by
  change run .frozenDumplings initialKitchen [.process] = none
  decide

theorem frozenDumplings_numeric_contract : frozenDumplings_numeric_contract_spec  := by
  change amountMin .frozenDumplings = 7 ∧ amountMax .frozenDumplings = 10 ∧ contractSeconds .frozenDumplings = 480
  decide

theorem airFryerWings_is_certified : airFryerWings_is_certified_spec  := by
  change certified .airFryerWings = true
  decide

theorem airFryerWings_rejects_premature_process : airFryerWings_rejects_premature_process_spec  := by
  change run .airFryerWings initialKitchen [.process] = none
  decide

theorem airFryerWings_numeric_contract : airFryerWings_numeric_contract_spec  := by
  change amountMin .airFryerWings = 6 ∧ amountMax .airFryerWings = 6 ∧ contractSeconds .airFryerWings = 1020
  decide

theorem lemonWater_is_certified : lemonWater_is_certified_spec  := by
  change certified .lemonWater = true
  decide

theorem lemonWater_rejects_premature_process : lemonWater_rejects_premature_process_spec  := by
  change run .lemonWater initialKitchen [.process] = none
  decide

theorem lemonWater_numeric_contract : lemonWater_numeric_contract_spec  := by
  change amountMin .lemonWater = 40 ∧ amountMax .lemonWater = 45 ∧ contractSeconds .lemonWater = 300
  decide

theorem milkTea_is_certified : milkTea_is_certified_spec  := by
  change certified .milkTea = true
  decide

theorem milkTea_rejects_premature_process : milkTea_rejects_premature_process_spec  := by
  change run .milkTea initialKitchen [.process] = none
  decide

theorem milkTea_numeric_contract : milkTea_numeric_contract_spec  := by
  change amountMin .milkTea = 180 ∧ amountMax .milkTea = 200 ∧ contractSeconds .milkTea = 1200
  decide

theorem chiliOil_is_certified : chiliOil_is_certified_spec  := by
  change certified .chiliOil = true
  decide

theorem chiliOil_switches_off_before_pouring : chiliOil_switches_off_before_pouring_spec  := by
  change run .chiliOil initialKitchen [.prepare, .process] =
      some { initialKitchen with prepared := true, processed := true }
  decide

theorem chiliOil_rejects_pouring_with_heat_on : chiliOil_rejects_pouring_with_heat_on_spec  := by
  change ready .chiliOil { initialKitchen with prepared := true, processed := true, heatOn := true } .finish = false
  decide

theorem chiliOil_rejects_premature_process : chiliOil_rejects_premature_process_spec  := by
  change run .chiliOil initialKitchen [.process] = none
  decide

theorem chiliOil_numeric_contract : chiliOil_numeric_contract_spec  := by
  change amountMin .chiliOil = 100 ∧ amountMax .chiliOil = 100 ∧ contractSeconds .chiliOil = 600
  decide

theorem sweetSourSauce_is_certified : sweetSourSauce_is_certified_spec  := by
  change certified .sweetSourSauce = true
  decide

theorem sweetSourSauce_rejects_premature_process : sweetSourSauce_rejects_premature_process_spec  := by
  change run .sweetSourSauce initialKitchen [.process] = none
  decide

theorem sweetSourSauce_numeric_contract : sweetSourSauce_numeric_contract_spec  := by
  change amountMin .sweetSourSauce = 50 ∧ amountMax .sweetSourSauce = 50 ∧ contractSeconds .sweetSourSauce = 300
  decide

theorem bakedEggTarts_is_certified : bakedEggTarts_is_certified_spec  := by
  change certified .bakedEggTarts = true
  decide

theorem bakedEggTarts_rejects_premature_process : bakedEggTarts_rejects_premature_process_spec  := by
  change run .bakedEggTarts initialKitchen [.process] = none
  decide

theorem bakedEggTarts_numeric_contract : bakedEggTarts_numeric_contract_spec  := by
  change amountMin .bakedEggTarts = 30 ∧ amountMax .bakedEggTarts = 30 ∧ contractSeconds .bakedEggTarts = 1500
  decide

theorem coffeeCoconutJelly_is_certified : coffeeCoconutJelly_is_certified_spec  := by
  change certified .coffeeCoconutJelly = true
  decide

theorem coffeeCoconutJelly_rejects_premature_process : coffeeCoconutJelly_rejects_premature_process_spec  := by
  change run .coffeeCoconutJelly initialKitchen [.process] = none
  decide

theorem coffeeCoconutJelly_numeric_contract : coffeeCoconutJelly_numeric_contract_spec  := by
  change amountMin .coffeeCoconutJelly = 10 ∧ amountMax .coffeeCoconutJelly = 10 ∧ contractSeconds .coffeeCoconutJelly = 10800
  decide

end LeanToCook.CatalogCases
