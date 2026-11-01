import LeanToCook.Core.Execution

namespace LeanToCook.ColaWings

structure KitchenState where
  heatOn : Bool := false
  wingsBlanched : Bool := false
  wingsMarinated : Bool := false
  panHot : Bool := false
  wingsSeared : Bool := false
  colaBoiling : Bool := false
  seasoned : Bool := false
  colaReduced : Bool := false
  wingsGlazed : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | blanchWings
  | marinateWings
  | searWings
  | boilCola
  | seasonWings
  | simmerWings
  | glazeWings
  | plateWings
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .blanchWings => !state.heatOn
  | .marinateWings => state.heatOn && state.wingsBlanched
  | .searWings => !state.heatOn && state.wingsMarinated
  | .boilCola => state.heatOn && state.wingsSeared
  | .seasonWings => state.heatOn && state.colaBoiling
  | .simmerWings => state.heatOn && state.seasoned
  | .glazeWings => state.heatOn && state.colaReduced
  | .plateWings => state.heatOn && state.wingsGlazed

def applyStep (state : KitchenState) : Step → KitchenState
  | .blanchWings => { state with heatOn := true, wingsBlanched := true }
  | .marinateWings => { state with heatOn := false, wingsMarinated := true }
  | .searWings => { state with heatOn := true, panHot := true, wingsSeared := true }
  | .boilCola => { state with colaBoiling := true }
  | .seasonWings => { state with seasoned := true }
  | .simmerWings => { state with colaReduced := true }
  | .glazeWings => { state with wingsGlazed := true }
  | .plateWings => { state with heatOn := false, plated := true }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def colaWingsPlan : List Step := [
  .blanchWings,
  .marinateWings,
  .searWings,
  .boilCola,
  .seasonWings,
  .simmerWings,
  .glazeWings,
  .plateWings
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def wingsMinFor (platters : Nat) : Nat := 10 * platters

def wingsMaxFor (platters : Nat) : Nat := 12 * platters

def colaMlFor (platters : Nat) : Nat := 500 * platters

def sugarGFor (platters : Nat) : Nat := 10 * platters

def soyGFor (platters : Nat) : Nat := 15 * platters

def saltGFor (platters : Nat) : Nat := 2 * platters

end LeanToCook.ColaWings
