import LeanToCook.Theories.KitchenTheory
import LeanToCook.CatalogCases.Proofs
import LeanToCook.Recipes.SteamedSeaBass.Proofs

namespace LeanToCook.AppliedTheory

open KitchenTheory

/- A certified recipe still has to pass the appliance-specific guard. -/
def microwavePlanAllowed
    (recipe : CatalogCases.CatalogCase)
    (material : Microwave.ContainerMaterial) : Bool :=
  CatalogCases.certified recipe && Microwave.startAllowed material

theorem sunny_egg_metal_container_is_rejected :
    microwavePlanAllowed .microwaveSunnyEgg .metal = false := by
  decide

/- The source contract contains 17 minutes of heat.  The reusable appliance
   theory deliberately shortens an unfamiliar first trial to 15 whole minutes. -/
def publishedAirFryerMinutes : Nat :=
  CatalogCases.contractSeconds .airFryerWings / 60

theorem air_fryer_wings_first_trial_is_shorter :
    publishedAirFryerMinutes = 17 ∧
    AirFryer.firstTrialMinutes publishedAirFryerMinutes = 15 ∧
    AirFryer.firstTrialMinutes publishedAirFryerMinutes < publishedAirFryerMinutes := by
  decide

/- Seven-tenths oil heat is the exact 210°C target used by the chili-oil case. -/
theorem chili_oil_level_seven_matches_210c :
    CatalogCases.amountMin .chiliOil = 100 ∧
    OilTemperature.celsiusForLevel 7 = 210 := by
  decide

/- The recipe proves the plan is executable; the method theory separately
   certifies that the selected medium can provide usable steam. -/
theorem steamed_bass_has_usable_steam :
    (SteamedSeaBass.run
      SteamedSeaBass.initialKitchen
      SteamedSeaBass.steamedSeaBassPlan).isSome = true ∧
    Steaming.steamAvailable true true = true := by
  exact ⟨
    SteamedSeaBass.steamedSeaBassPlan_is_executable,
    Steaming.steam_requires_boiling_water
  ⟩

/- The seasoning theory recommends 0.9% of the 500g primary ingredient mass.
   Its 4500mg result lies inside the recipe's explicit 4–6g salt interval. -/
def eggFriedRiceSaltTargetMg : Nat :=
  Seasoning.quickStirFrySaltMg (CatalogCases.amountMin .eggFriedRice)

theorem egg_fried_rice_salt_target_fits_source_range :
    eggFriedRiceSaltTargetMg = 4500 ∧
    4000 ≤ eggFriedRiceSaltTargetMg ∧
    eggFriedRiceSaltTargetMg ≤ 6000 := by
  decide

/- A cold path is not automatically safe: the no-heat fact and ingredient
   safety evidence are independent inputs to the guard. -/
def coldRecipeAllowed
    (ingredientSafetyKnown : Bool)
    (recipe : CatalogCases.CatalogCase) : Bool :=
  ColdDish.coldDishAllowed ingredientSafetyKnown && !CatalogCases.usesHeat recipe

theorem lemon_water_cold_path_requires_known_safety :
    coldRecipeAllowed true .lemonWater = true ∧
    coldRecipeAllowed false .lemonWater = false := by
  decide

/- Missing temperature evidence is represented explicitly rather than being
   replaced by a guessed default value. -/
inductive PoultryTemperatureEvidence where
  | unmeasured
  | measured (centerTemperatureC : Nat)
deriving Repr, DecidableEq

def poultryEvidenceAccepted : PoultryTemperatureEvidence → Bool
  | .unmeasured => false
  | .measured centerTemperatureC => FoodSafety.poultryThresholdMet centerTemperatureC

theorem air_fryer_wings_temperature_evidence_is_independent :
    CatalogCases.certified .airFryerWings = true ∧
    poultryEvidenceAccepted .unmeasured = false ∧
    poultryEvidenceAccepted (.measured 74) = true := by
  exact ⟨
    CatalogCases.airFryerWings_is_certified,
    rfl,
    FoodSafety.poultry_safe_threshold
  ⟩

/- The suite theorem is intentionally heterogeneous.  It demonstrates that a
   library-level conclusion can combine flow, appliance, medium, numeric and
   evidence obligations without collapsing them into one unsafe Boolean. -/
theorem certification_does_not_erase_evidence_obligations :
    microwavePlanAllowed .microwaveSunnyEgg .metal = false ∧
    (publishedAirFryerMinutes = 17 ∧
      AirFryer.firstTrialMinutes publishedAirFryerMinutes = 15 ∧
      AirFryer.firstTrialMinutes publishedAirFryerMinutes < publishedAirFryerMinutes) ∧
    (CatalogCases.amountMin .chiliOil = 100 ∧
      OilTemperature.celsiusForLevel 7 = 210) ∧
    ((SteamedSeaBass.run
        SteamedSeaBass.initialKitchen
        SteamedSeaBass.steamedSeaBassPlan).isSome = true ∧
      Steaming.steamAvailable true true = true) ∧
    (eggFriedRiceSaltTargetMg = 4500 ∧
      4000 ≤ eggFriedRiceSaltTargetMg ∧
      eggFriedRiceSaltTargetMg ≤ 6000) ∧
    (coldRecipeAllowed true .lemonWater = true ∧
      coldRecipeAllowed false .lemonWater = false) ∧
    (CatalogCases.certified .airFryerWings = true ∧
      poultryEvidenceAccepted .unmeasured = false ∧
      poultryEvidenceAccepted (.measured 74) = true) := by
  exact ⟨
    sunny_egg_metal_container_is_rejected,
    air_fryer_wings_first_trial_is_shorter,
    chili_oil_level_seven_matches_210c,
    steamed_bass_has_usable_steam,
    egg_fried_rice_salt_target_fits_source_range,
    lemon_water_cold_path_requires_known_safety,
    air_fryer_wings_temperature_evidence_is_independent
  ⟩

end LeanToCook.AppliedTheory
