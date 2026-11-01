import { recipeCategorySchema, type RecipeCategory } from "@repo/schemas";
import type { ChangeEvent } from "react";
import type { StateCreator } from "zustand";

export type CertificationFilter = "all" | "deep" | "structural";
export type CategoryFilter = "all" | RecipeCategory;

export interface RecipeLibraryPageSlice {
  categoryFilter: CategoryFilter;
  certificationFilter: CertificationFilter;
  handleAllCertificationButtonClick: () => void;
  handleCategorySelectChange: (event: ChangeEvent<HTMLSelectElement>) => void;
  handleStructuralCertificationButtonClick: () => void;
  handleQueryInputChange: (event: ChangeEvent<HTMLInputElement>) => void;
  handleDeepCertificationButtonClick: () => void;
  query: string;
}

export const createRecipeLibraryPageSlice: StateCreator<RecipeLibraryPageSlice> = (set) => ({
  categoryFilter: "all",
  certificationFilter: "all",
  handleAllCertificationButtonClick: () => {
    set({ certificationFilter: "all" });
  },
  handleCategorySelectChange: (event) => {
    const category = recipeCategorySchema.safeParse(event.currentTarget.value);

    set({ categoryFilter: category.success ? category.data : "all" });
  },
  handleStructuralCertificationButtonClick: () => {
    set({ certificationFilter: "structural" });
  },
  handleQueryInputChange: (event) => {
    set({ query: event.currentTarget.value });
  },
  handleDeepCertificationButtonClick: () => {
    set({ certificationFilter: "deep" });
  },
  query: "",
});
