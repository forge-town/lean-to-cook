import LeanToCook.Recipes.SteamedSeaBass.Spec

namespace LeanToCook.SteamedSeaBass

theorem steamedSeaBassPlan_is_executable : steamedSeaBassPlan_is_executable_spec  := by
  change (run initialKitchen steamedSeaBassPlan).isSome = true
  decide

theorem steamedSeaBassPlan_plates_dish : steamedSeaBassPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen steamedSeaBassPlan) = true
  decide

theorem steamedSeaBassPlan_leaves_heat_off : steamedSeaBassPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen steamedSeaBassPlan) = true
  decide

theorem cannot_steam_before_racking_and_heating : cannot_steam_before_racking_and_heating_spec  := by
  change run initialKitchen [.steamFish] = none
  decide

theorem one_fish_amounts_and_time : one_fish_amounts_and_time_spec  := by
  change soyMinMlFor 1 = 10 ∧
    soyMaxMlFor 1 = 15 ∧
    oilMinMlFor 1 = 10 ∧
    oilMaxMlFor 1 = 15 ∧
    saltMaxGFor 1 = 10 ∧
    steamSeconds = 600
  decide

theorem steamedSeaBassPlan_correct_for_one : steamedSeaBassPlan_correct_for_one_spec  := by
  change (run initialKitchen steamedSeaBassPlan).isSome = true ∧
    resultIsPlated (run initialKitchen steamedSeaBassPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen steamedSeaBassPlan) = true ∧
    (soyMinMlFor 1 = 10 ∧
      soyMaxMlFor 1 = 15 ∧
      oilMinMlFor 1 = 10 ∧
      oilMaxMlFor 1 = 15 ∧
      saltMaxGFor 1 = 10 ∧
      steamSeconds = 600)
  exact ⟨
    steamedSeaBassPlan_is_executable,
    steamedSeaBassPlan_plates_dish,
    steamedSeaBassPlan_leaves_heat_off,
    one_fish_amounts_and_time
  ⟩

end LeanToCook.SteamedSeaBass
