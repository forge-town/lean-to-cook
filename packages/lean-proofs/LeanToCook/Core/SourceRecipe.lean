namespace LeanToCook.SourceCatalog

structure Step where
  index : Nat
  instruction : String
deriving Repr, DecidableEq

structure Recipe where
  id : String
  title : String
  category : String
  sourcePath : String
  sourceCommit : String
  ingredients : List String
  steps : List Step
deriving Repr, DecidableEq

def orderedFrom : Nat → List Step → Bool
  | _, [] => true
  | expected, step :: remaining =>
      step.index == expected && orderedFrom (expected + 1) remaining

def run : Nat → List Step → Option Nat
  | expected, [] => some expected
  | expected, step :: remaining =>
      if step.index == expected then
        run (expected + 1) remaining
      else
        none

def executesToTerminal (recipe : Recipe) : Bool :=
  run 1 recipe.steps == some (recipe.steps.length + 1)

def kernelCertified (recipe : Recipe) : Bool :=
  !recipe.ingredients.isEmpty &&
    !recipe.steps.isEmpty &&
    orderedFrom 1 recipe.steps &&
    executesToTerminal recipe

theorem empty_plan_is_rejected (recipe : Recipe) (h : recipe.steps = []) :
    kernelCertified recipe = false := by
  simp [kernelCertified, h]

end LeanToCook.SourceCatalog
