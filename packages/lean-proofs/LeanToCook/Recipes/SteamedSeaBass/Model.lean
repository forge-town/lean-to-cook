import LeanToCook.Core.Execution

namespace LeanToCook.SteamedSeaBass

structure KitchenState where
  heatOn : Bool := false
  aromaticsCut : Bool := false
  fishMarinated : Bool := false
  fishRacked : Bool := false
  steamerHot : Bool := false
  fishSteamed : Bool := false
  fishTransferred : Bool := false
  seasoned : Bool := false
  oilHot : Bool := false
  fishFinished : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | cutAromatics
  | scoreMarinateFish
  | rackFish
  | heatSteamer
  | steamFish
  | transferFish
  | seasonFish
  | heatFinishingOil
  | pourHotOilPlate
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .cutAromatics => true
  | .scoreMarinateFish => state.aromaticsCut
  | .rackFish => state.fishMarinated && state.aromaticsCut
  | .heatSteamer => !state.heatOn && state.fishRacked
  | .steamFish => state.heatOn && state.steamerHot && state.fishRacked
  | .transferFish => state.heatOn && state.fishSteamed
  | .seasonFish => state.fishTransferred && state.aromaticsCut
  | .heatFinishingOil => state.heatOn && state.seasoned
  | .pourHotOilPlate =>
      state.heatOn && state.oilHot && state.fishTransferred && state.seasoned

def applyStep (state : KitchenState) : Step → KitchenState
  | .cutAromatics => { state with aromaticsCut := true }
  | .scoreMarinateFish => { state with fishMarinated := true }
  | .rackFish => { state with fishRacked := true }
  | .heatSteamer => { state with heatOn := true, steamerHot := true }
  | .steamFish => { state with fishSteamed := true }
  | .transferFish => { state with fishTransferred := true }
  | .seasonFish => { state with seasoned := true }
  | .heatFinishingOil => { state with oilHot := true }
  | .pourHotOilPlate => {
      state with heatOn := false, fishFinished := true, plated := true
    }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def steamedSeaBassPlan : List Step := [
  .cutAromatics,
  .scoreMarinateFish,
  .rackFish,
  .heatSteamer,
  .steamFish,
  .transferFish,
  .seasonFish,
  .heatFinishingOil,
  .pourHotOilPlate
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def soyMinMlFor (fish : Nat) : Nat := 10 * fish

def soyMaxMlFor (fish : Nat) : Nat := 15 * fish

def oilMinMlFor (fish : Nat) : Nat := 10 * fish

def oilMaxMlFor (fish : Nat) : Nat := 15 * fish

def saltMaxGFor (fish : Nat) : Nat := 10 * fish

def steamSeconds : Nat := 10 * 60

end LeanToCook.SteamedSeaBass
