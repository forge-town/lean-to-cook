import { relations } from "drizzle-orm";
import { ingredientCategoriesTable } from "../tables/ingredient_categories_table";
import { recipeCategoriesTable } from "../tables/recipe_categories_table";
import { measurementUnitsTable } from "../tables/measurement_units_table";
import { ingredientsTable } from "../tables/ingredients_table";
import { ingredientAliasesTable } from "../tables/ingredient_aliases_table";
import { recipesTable } from "../tables/recipes_table";
import { recipeRequirementsTable } from "../tables/recipe_requirements_table";
import { recipeStepsTable } from "../tables/recipe_steps_table";
import { recipeSourcesTable } from "../tables/recipe_sources_table";
import { recipePublicationsTable } from "../tables/recipe_publications_table";

export const ingredientCategoriesRelations = relations(ingredientCategoriesTable, ({ many }) => ({
  ingredients: many(ingredientsTable),
}));

export const recipeCategoriesRelations = relations(recipeCategoriesTable, ({ many }) => ({
  recipes: many(recipesTable),
}));

export const measurementUnitsRelations = relations(measurementUnitsTable, ({ many }) => ({
  recipeRequirements: many(recipeRequirementsTable),
}));

export const ingredientsRelations = relations(ingredientsTable, ({ one, many }) => ({
  category: one(ingredientCategoriesTable, {
    fields: [ingredientsTable.categoryId],
    references: [ingredientCategoriesTable.id],
  }),
  ingredientAliases: many(ingredientAliasesTable),
  recipeRequirements: many(recipeRequirementsTable),
}));

export const ingredientAliasesRelations = relations(ingredientAliasesTable, ({ one }) => ({
  ingredient: one(ingredientsTable, {
    fields: [ingredientAliasesTable.ingredientId],
    references: [ingredientsTable.id],
  }),
}));

export const recipesRelations = relations(recipesTable, ({ one, many }) => ({
  category: one(recipeCategoriesTable, {
    fields: [recipesTable.categoryId],
    references: [recipeCategoriesTable.id],
  }),
  recipeRequirements: many(recipeRequirementsTable),
  recipeSteps: many(recipeStepsTable),
  recipeSources: many(recipeSourcesTable),
  recipePublications: many(recipePublicationsTable),
}));

export const recipeRequirementsRelations = relations(recipeRequirementsTable, ({ one }) => ({
  recipe: one(recipesTable, {
    fields: [recipeRequirementsTable.recipeId],
    references: [recipesTable.id],
  }),
  ingredient: one(ingredientsTable, {
    fields: [recipeRequirementsTable.ingredientId],
    references: [ingredientsTable.id],
  }),
  unit: one(measurementUnitsTable, {
    fields: [recipeRequirementsTable.unitId],
    references: [measurementUnitsTable.id],
  }),
}));

export const recipeStepsRelations = relations(recipeStepsTable, ({ one }) => ({
  recipe: one(recipesTable, { fields: [recipeStepsTable.recipeId], references: [recipesTable.id] }),
}));

export const recipeSourcesRelations = relations(recipeSourcesTable, ({ one }) => ({
  recipe: one(recipesTable, {
    fields: [recipeSourcesTable.recipeId],
    references: [recipesTable.id],
  }),
}));

export const recipePublicationsRelations = relations(recipePublicationsTable, ({ one }) => ({
  recipe: one(recipesTable, {
    fields: [recipePublicationsTable.recipeId],
    references: [recipesTable.id],
  }),
}));
