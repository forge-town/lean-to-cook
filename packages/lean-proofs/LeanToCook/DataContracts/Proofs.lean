import LeanToCook.DataContracts.Recipes

namespace LeanToCook.CatalogData

theorem unclassified_does_not_imply_linked :
    requirementValid [] [] ⟨"牛奶", .unclassified, none, "", none, false⟩ = true := by decide

theorem dangling_ingredient_is_rejected :
    requirementValid [] [] ⟨"牛奶", .ingredient, some "missing", "", none, false⟩ = false := by decide

theorem tool_cannot_claim_an_ingredient :
    requirementValid ["milk"] [] ⟨"锅", .tool, some "milk", "", none, false⟩ = false := by decide

theorem zero_quantity_is_rejected :
    requirementValid [] ["g"] ⟨"盐", .unclassified, none, "", some ⟨0, "g"⟩, false⟩ = false := by decide

end LeanToCook.CatalogData
