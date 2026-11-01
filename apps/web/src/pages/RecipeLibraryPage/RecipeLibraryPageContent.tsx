import { recipeCatalog } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import { Workspace } from "@/components/Workspace";
import {
  sourceRecipeCategoryLabels,
  sourceRecipeCategoryOrder,
  getSourceRecipeForRecipe,
} from "@/sourceRecipePresentation";
import { getSourceRecipeThumbnail } from "../SourceRecipeLibraryPage/sourceRecipeThumbnails";
export const RecipeLibraryPageContent = () => (
  <Workspace
    left={
      <nav className="flex flex-col gap-1 p-3">
        {sourceRecipeCategoryOrder
          .filter((category) => recipeCatalog.some((recipe) => recipe.category === category))
          .map((category) => (
            <a
              key={category}
              className="rounded-2xl px-4 py-3 text-sm font-medium transition-colors hover:bg-egg/35"
              href={`#proof-category-${category}`}
            >
              {sourceRecipeCategoryLabels[category]}
            </a>
          ))}
      </nav>
    }
  >
    <div className="min-h-0 flex-1 overflow-y-auto p-6 sm:p-8">
      <h1 className="mb-8 text-3xl font-bold">证明库</h1>
      {sourceRecipeCategoryOrder.map((category) => {
        const recipes = recipeCatalog.filter((recipe) => recipe.category === category);

        return recipes.length > 0 ? (
          <section key={category} className="mb-10 scroll-mt-5" id={`proof-category-${category}`}>
            <h2 className="mb-5 text-xl font-bold">{sourceRecipeCategoryLabels[category]}</h2>
            <div className="grid grid-cols-2 gap-x-5 gap-y-7 xl:grid-cols-3">
              {recipes.map((recipe) => {
                const source = getSourceRecipeForRecipe(recipe);
                const image = source
                  ? getSourceRecipeThumbnail(source)
                  : { src: "/brand/cook-mark.png", isPhotograph: false };

                return (
                  <Link
                    key={recipe.id}
                    className="group block rounded-3xl border border-border/60 bg-surface p-2.5 pb-4 shadow-[0_3px_0_#eee2c9] transition-transform duration-200 ease-kitchen hover:-translate-y-1 active:translate-y-0 motion-reduce:transform-none motion-reduce:transition-none"
                    params={{ recipeId: recipe.id }}
                    to="/recipes/$recipeId"
                  >
                    <img
                      alt={recipe.title}
                      className={
                        image.isPhotograph
                          ? "aspect-4/3 w-full rounded-2xl object-cover"
                          : "aspect-4/3 w-full rounded-2xl bg-surface object-contain p-10"
                      }
                      height={480}
                      loading="lazy"
                      src={image.src}
                      width={640}
                    />
                    <h3 className="mt-3 px-2 text-base font-semibold">{recipe.title}</h3>
                  </Link>
                );
              })}
            </div>
          </section>
        ) : null;
      })}
    </div>
  </Workspace>
);
