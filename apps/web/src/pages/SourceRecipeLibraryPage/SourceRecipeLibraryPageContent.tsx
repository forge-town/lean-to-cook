import { Workspace } from "@/components/Workspace";
import { sourceRecipeCatalog } from "@repo/schemas";
import { Link } from "@tanstack/react-router";
import { sourceRecipeCategoryLabels, sourceRecipeCategoryOrder } from "@/sourceRecipePresentation";
import { getSourceRecipeThumbnail } from "./sourceRecipeThumbnails";
const categoryIcons = [
  "leafy_green",
  "cut_of_meat",
  "fish",
  "egg",
  "cooked_rice",
  "canned_food",
  "steaming_bowl",
  "teacup_without_handle",
  "salt",
  "honey_pot",
];
const categoryGroups = sourceRecipeCategoryOrder.map((category) => ({
  category,
  recipes: sourceRecipeCatalog
    .filter((recipe) => recipe.category === category)
    .sort(
      (left, right) =>
        Number(getSourceRecipeThumbnail(right).isPhotograph) -
        Number(getSourceRecipeThumbnail(left).isPhotograph)
    ),
}));
export const SourceRecipeLibraryPageContent = () => (
  <Workspace
    left={
      <nav aria-label="菜谱分类" className="flex flex-col gap-1 p-3">
        {categoryGroups.map(({ category }, index) => (
          <a
            key={category}
            className="flex items-center gap-3 rounded-2xl px-3 py-3 text-sm font-medium text-ink transition-colors hover:bg-egg/35"
            href={`#source-category-${category}`}
          >
            <img
              alt=""
              className="size-7"
              height={28}
              src={`/ingredient-icons/fluent-flat/${categoryIcons[index]}.svg`}
              width={28}
            />
            {sourceRecipeCategoryLabels[category]}
          </a>
        ))}
      </nav>
    }
  >
    <div className="min-h-0 flex-1 overflow-y-auto px-5 py-6 sm:px-8">
      <h1 className="mb-8 text-3xl font-bold tracking-tight">菜谱</h1>
      {categoryGroups.map(({ category, recipes }) => (
        <section
          key={category}
          aria-label={sourceRecipeCategoryLabels[category]}
          className="mb-10 scroll-mt-5"
          id={`source-category-${category}`}
        >
          <h2 className="mb-5 flex items-center gap-3 text-xl font-bold before:h-5 before:w-1.5 before:rounded-full before:bg-tomato">
            {sourceRecipeCategoryLabels[category]}
          </h2>
          <div className="grid grid-cols-2 gap-x-4 gap-y-7 xl:grid-cols-3 2xl:grid-cols-4">
            {recipes.map((recipe, index) => {
              const image = getSourceRecipeThumbnail(recipe);

              return (
                <article
                  key={recipe.id}
                  className={
                    category === sourceRecipeCategoryOrder[0] && index < 6
                      ? [
                          "motion-safe:animate-kitchen-arrive",
                          "motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:40ms]",
                          "motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:80ms]",
                          "motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:120ms]",
                          "motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:160ms]",
                          "motion-safe:animate-kitchen-arrive motion-safe:[animation-delay:200ms]",
                        ][index]
                      : undefined
                  }
                >
                  <Link
                    aria-label={recipe.title}
                    className="group block rounded-3xl border border-border/60 bg-surface p-2.5 pb-4 text-ink shadow-[0_3px_0_#eee2c9] transition-[transform,box-shadow] duration-200 ease-kitchen hover:-translate-y-1 hover:shadow-[0_7px_0_#eee2c9] active:translate-y-0 motion-reduce:transform-none motion-reduce:transition-none"
                    params={{ sourceRecipeId: recipe.id }}
                    to="/source-recipe/$sourceRecipeId"
                  >
                    <div className="aspect-4/3 overflow-hidden rounded-2xl bg-egg/15">
                      <img
                        alt={image.isPhotograph ? recipe.title : `${recipe.title}（插画）`}
                        className={
                          image.isPhotograph
                            ? "size-full object-cover transition-transform duration-300 ease-kitchen group-hover:scale-105 motion-reduce:transform-none motion-reduce:transition-none"
                            : "size-full object-contain p-[24%]"
                        }
                        decoding="async"
                        height={480}
                        loading={
                          category === sourceRecipeCategoryOrder[0] && index < 4 ? "eager" : "lazy"
                        }
                        src={image.src}
                        width={640}
                      />
                    </div>
                    <h3 className="mt-3 px-2 text-base font-semibold leading-snug">
                      {recipe.title}
                    </h3>
                  </Link>
                </article>
              );
            })}
          </div>
        </section>
      ))}
    </div>
  </Workspace>
);
