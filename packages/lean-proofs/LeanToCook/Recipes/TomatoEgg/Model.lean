import LeanToCook.Core.Execution

namespace LeanToCook.TomatoEgg

/-!
The discrete kitchen model used by the first Lean to Cook case study.

It proves ordering and terminal-state properties. It intentionally does not
model continuous temperature, texture, nutrition, or physical food safety.
-/

structure KitchenState where
  tomatoClean : Bool := false
  tomatoPeeled : Bool := false
  tomatoCut : Bool := false
  eggMixed : Bool := false
  panHot : Bool := false
  heatOn : Bool := false
  eggHalfCooked : Bool := false
  eggReserved : Bool := false
  tomatoSoft : Bool := false
  dishCombined : Bool := false
  dishSeasoned : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | washTomato
  | peelTomato
  | cutTomato
  | mixEgg
  | heatPan
  | cookEgg
  | reserveEgg
  | cookTomato
  | combine
  | season
  | plate
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .washTomato => true
  | .peelTomato => state.tomatoClean
  | .cutTomato => state.tomatoClean
  | .mixEgg => true
  | .heatPan => !state.heatOn
  | .cookEgg => state.heatOn && state.panHot && state.eggMixed
  | .reserveEgg => state.heatOn && state.eggHalfCooked
  | .cookTomato => !state.heatOn && state.tomatoCut
  | .combine => state.heatOn && state.eggReserved && state.tomatoSoft
  | .season => state.heatOn && state.dishCombined
  | .plate => state.heatOn && state.dishSeasoned

def applyStep (state : KitchenState) : Step → KitchenState
  | .washTomato => { state with tomatoClean := true }
  | .peelTomato => { state with tomatoPeeled := true }
  | .cutTomato => { state with tomatoCut := true }
  | .mixEgg => { state with eggMixed := true }
  | .heatPan => { state with heatOn := true, panHot := true }
  | .cookEgg => { state with eggHalfCooked := true }
  | .reserveEgg => { state with heatOn := false, eggReserved := true }
  | .cookTomato => { state with heatOn := true, tomatoSoft := true }
  | .combine => { state with dishCombined := true }
  | .season => { state with dishSeasoned := true }
  | .plate => { state with heatOn := false, plated := true }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def tomatoEggPlan : List Step := [
  .washTomato,
  .peelTomato,
  .cutTomato,
  .mixEgg,
  .heatPan,
  .cookEgg,
  .reserveEgg,
  .cookTomato,
  .combine,
  .season,
  .plate
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def eggsFor (servings : Nat) : Nat := (3 * servings + 1) / 2

def oilMlFor (servings : Nat) : Nat := 4 * eggsFor servings

def tomatoesFor (servings : Nat) : Nat := servings

def saltMinGFor (servings : Nat) : Nat := (3 * servings + 1) / 2

def saltMaxGFor (servings : Nat) : Nat := 2 * servings

def sugarMaxGFor (servings : Nat) : Nat := 2 * servings

def scallionMaxGFor (servings : Nat) : Nat := 10 * servings

structure AmountContext where
  servings : Nat
  prefersSweet : Bool
deriving Repr, DecidableEq

inductive Seasoning where
  | salt
  | sugar
deriving Repr, DecidableEq

/- `SuitableAmount` formalizes “适量” as a relation among an ingredient,
   its cooking context, and a candidate amount, rather than as a scalar. -/

def SuitableAmount
    (seasoning : Seasoning)
    (context : AmountContext)
    (grams : Nat) : Prop :=
  match seasoning with
  | .salt =>
      3 * context.servings ≤ 2 * grams ∧
      grams ≤ 2 * context.servings
  | .sugar =>
      if context.prefersSweet then
        grams ≤ 2 * context.servings
      else
        grams = 0

def reserveEggIndex : Nat := 7

def combineIndex : Nat := 9

end LeanToCook.TomatoEgg
