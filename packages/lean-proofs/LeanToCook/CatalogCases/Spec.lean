import LeanToCook.CatalogCases.Model

namespace LeanToCook.CatalogCases

def all_expansion_cases_are_certified_spec (recipe : CatalogCase) : Prop :=
  certified recipe = true

def all_expansion_cases_reject_premature_process_spec (recipe : CatalogCase) : Prop :=
  run recipe initialKitchen [.process] = none

def all_expansion_amount_intervals_are_ordered_spec (recipe : CatalogCase) : Prop :=
  amountMin recipe ≤ amountMax recipe

def simpleBraisedPork_is_certified_spec : Prop :=
  certified .simpleBraisedPork = true

def simpleBraisedPork_rejects_premature_process_spec : Prop :=
  run .simpleBraisedPork initialKitchen [.process] = none

def simpleBraisedPork_numeric_contract_spec : Prop :=
  amountMin .simpleBraisedPork = 1500 ∧ amountMax .simpleBraisedPork = 2000 ∧ contractSeconds .simpleBraisedPork = 4800

def seaweedEggSoup_is_certified_spec : Prop :=
  certified .seaweedEggSoup = true

def seaweedEggSoup_rejects_premature_process_spec : Prop :=
  run .seaweedEggSoup initialKitchen [.process] = none

def seaweedEggSoup_numeric_contract_spec : Prop :=
  amountMin .seaweedEggSoup = 10 ∧ amountMax .seaweedEggSoup = 10 ∧ contractSeconds .seaweedEggSoup = 230

def microwaveSunnyEgg_is_certified_spec : Prop :=
  certified .microwaveSunnyEgg = true

def microwaveSunnyEgg_rejects_premature_process_spec : Prop :=
  run .microwaveSunnyEgg initialKitchen [.process] = none

def microwaveSunnyEgg_numeric_contract_spec : Prop :=
  amountMin .microwaveSunnyEgg = 1 ∧ amountMax .microwaveSunnyEgg = 1 ∧ contractSeconds .microwaveSunnyEgg = 180

def perfectBoiledEgg_is_certified_spec : Prop :=
  certified .perfectBoiledEgg = true

def perfectBoiledEgg_rejects_premature_process_spec : Prop :=
  run .perfectBoiledEgg initialKitchen [.process] = none

def perfectBoiledEgg_numeric_contract_spec : Prop :=
  amountMin .perfectBoiledEgg = 1 ∧ amountMax .perfectBoiledEgg = 1 ∧ contractSeconds .perfectBoiledEgg = 1980

def eggFriedRice_is_certified_spec : Prop :=
  certified .eggFriedRice = true

def eggFriedRice_rejects_premature_process_spec : Prop :=
  run .eggFriedRice initialKitchen [.process] = none

def eggFriedRice_numeric_contract_spec : Prop :=
  amountMin .eggFriedRice = 500 ∧ amountMax .eggFriedRice = 500 ∧ contractSeconds .eggFriedRice = 1500

def zhajiangNoodles_is_certified_spec : Prop :=
  certified .zhajiangNoodles = true

def zhajiangNoodles_rejects_premature_process_spec : Prop :=
  run .zhajiangNoodles initialKitchen [.process] = none

def zhajiangNoodles_numeric_contract_spec : Prop :=
  amountMin .zhajiangNoodles = 150 ∧ amountMax .zhajiangNoodles = 250 ∧ contractSeconds .zhajiangNoodles = 1800

def frozenDumplings_is_certified_spec : Prop :=
  certified .frozenDumplings = true

def frozenDumplings_rejects_premature_process_spec : Prop :=
  run .frozenDumplings initialKitchen [.process] = none

def frozenDumplings_numeric_contract_spec : Prop :=
  amountMin .frozenDumplings = 7 ∧ amountMax .frozenDumplings = 10 ∧ contractSeconds .frozenDumplings = 480

def airFryerWings_is_certified_spec : Prop :=
  certified .airFryerWings = true

def airFryerWings_rejects_premature_process_spec : Prop :=
  run .airFryerWings initialKitchen [.process] = none

def airFryerWings_numeric_contract_spec : Prop :=
  amountMin .airFryerWings = 6 ∧ amountMax .airFryerWings = 6 ∧ contractSeconds .airFryerWings = 1020

def lemonWater_is_certified_spec : Prop :=
  certified .lemonWater = true

def lemonWater_rejects_premature_process_spec : Prop :=
  run .lemonWater initialKitchen [.process] = none

def lemonWater_numeric_contract_spec : Prop :=
  amountMin .lemonWater = 40 ∧ amountMax .lemonWater = 45 ∧ contractSeconds .lemonWater = 300

def milkTea_is_certified_spec : Prop :=
  certified .milkTea = true

def milkTea_rejects_premature_process_spec : Prop :=
  run .milkTea initialKitchen [.process] = none

def milkTea_numeric_contract_spec : Prop :=
  amountMin .milkTea = 180 ∧ amountMax .milkTea = 200 ∧ contractSeconds .milkTea = 1200

def chiliOil_is_certified_spec : Prop :=
  certified .chiliOil = true

def chiliOil_switches_off_before_pouring_spec : Prop :=
  run .chiliOil initialKitchen [.prepare, .process] =
      some { initialKitchen with prepared := true, processed := true }

def chiliOil_rejects_pouring_with_heat_on_spec : Prop :=
  ready .chiliOil { initialKitchen with prepared := true, processed := true, heatOn := true } .finish = false

def chiliOil_rejects_premature_process_spec : Prop :=
  run .chiliOil initialKitchen [.process] = none

def chiliOil_numeric_contract_spec : Prop :=
  amountMin .chiliOil = 100 ∧ amountMax .chiliOil = 100 ∧ contractSeconds .chiliOil = 600

def sweetSourSauce_is_certified_spec : Prop :=
  certified .sweetSourSauce = true

def sweetSourSauce_rejects_premature_process_spec : Prop :=
  run .sweetSourSauce initialKitchen [.process] = none

def sweetSourSauce_numeric_contract_spec : Prop :=
  amountMin .sweetSourSauce = 50 ∧ amountMax .sweetSourSauce = 50 ∧ contractSeconds .sweetSourSauce = 300

def bakedEggTarts_is_certified_spec : Prop :=
  certified .bakedEggTarts = true

def bakedEggTarts_rejects_premature_process_spec : Prop :=
  run .bakedEggTarts initialKitchen [.process] = none

def bakedEggTarts_numeric_contract_spec : Prop :=
  amountMin .bakedEggTarts = 30 ∧ amountMax .bakedEggTarts = 30 ∧ contractSeconds .bakedEggTarts = 1500

def coffeeCoconutJelly_is_certified_spec : Prop :=
  certified .coffeeCoconutJelly = true

def coffeeCoconutJelly_rejects_premature_process_spec : Prop :=
  run .coffeeCoconutJelly initialKitchen [.process] = none

def coffeeCoconutJelly_numeric_contract_spec : Prop :=
  amountMin .coffeeCoconutJelly = 10 ∧ amountMax .coffeeCoconutJelly = 10 ∧ contractSeconds .coffeeCoconutJelly = 10800

end LeanToCook.CatalogCases
