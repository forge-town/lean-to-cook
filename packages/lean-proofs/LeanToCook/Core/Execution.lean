namespace LeanToCook.Core

/-- Run a partial state transition, stopping at the first rejected action. -/
def run {State Action : Type} (transition : State → Action → Option State) :
    State → List Action → Option State
  | state, [] => some state
  | state, action :: rest =>
      match transition state action with
      | none => none
      | some next => run transition next rest

@[simp] theorem run_nil {State Action : Type}
    (transition : State → Action → Option State) (state : State) :
    run transition state [] = some state := rfl

@[simp] theorem run_cons {State Action : Type}
    (transition : State → Action → Option State) (state : State)
    (action : Action) (rest : List Action) :
    run transition state (action :: rest) =
      (transition state action).bind (fun next => run transition next rest) := by
  cases h : transition state action <;> simp [run, h]

end LeanToCook.Core
