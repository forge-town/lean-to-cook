import LeanToCook.Recipes.SteamedSeaBass.Model

namespace LeanToCook.SteamedSeaBass

def steamedSeaBassPlan_is_executable_spec : Prop :=
  (run initialKitchen steamedSeaBassPlan).isSome = true

def steamedSeaBassPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen steamedSeaBassPlan) = true

def steamedSeaBassPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen steamedSeaBassPlan) = true

def cannot_steam_before_racking_and_heating_spec : Prop :=
  run initialKitchen [.steamFish] = none

def one_fish_amounts_and_time_spec : Prop :=
  soyMinMlFor 1 = 10 ∧
    soyMaxMlFor 1 = 15 ∧
    oilMinMlFor 1 = 10 ∧
    oilMaxMlFor 1 = 15 ∧
    saltMaxGFor 1 = 10 ∧
    steamSeconds = 600

def steamedSeaBassPlan_correct_for_one_spec : Prop :=
  (run initialKitchen steamedSeaBassPlan).isSome = true ∧
    resultIsPlated (run initialKitchen steamedSeaBassPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen steamedSeaBassPlan) = true ∧
    (soyMinMlFor 1 = 10 ∧
      soyMaxMlFor 1 = 15 ∧
      oilMinMlFor 1 = 10 ∧
      oilMaxMlFor 1 = 15 ∧
      saltMaxGFor 1 = 10 ∧
      steamSeconds = 600)

end LeanToCook.SteamedSeaBass
