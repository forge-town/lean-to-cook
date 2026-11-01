namespace LeanToCook.Core

/-- Exact amounts: one million micro-units represent one selected unit. -/
structure Quantity where
  microUnits : Nat
  unitId : String
  deriving Repr, DecidableEq

end LeanToCook.Core
