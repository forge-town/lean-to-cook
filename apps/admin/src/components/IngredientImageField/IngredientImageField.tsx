import { useEditorPageStore } from "../../pages/EditorPage/_store";
import { useFormContext } from "react-hook-form";
import { FormField, FormItem, FormLabel, FormControl, FormMessage } from "@repo/ui/form";
import { Button } from "@repo/ui/button";
import {
  ingredientImageKeys,
  ingredientImageLabels,
  ingredientImagePaths,
} from "@repo/schemas/catalog";
import type { EditorValues } from "../../pages/EditorPage/_schemas/EditorValues.schema";
export const IngredientImageField = () => {
  const form = useFormContext<EditorValues>();
  const handleImageChoiceClick = useEditorPageStore((s) => s.handleImageChoiceClick);
  const handleMatchImageClick = useEditorPageStore((s) => s.handleMatchImageClick);

  return (
    <FormField
      control={form.control}
      name="imageKey"
      render={({ field }) => (
        <FormItem className="ingredient-image-field">
          <div className="section-heading">
            <FormLabel>食材图片</FormLabel>
            <Button size="sm" type="button" variant="outline" onClick={handleMatchImageClick}>
              按名称匹配
            </Button>
          </div>
          <div className="ingredient-image-preview">
            {field.value ? (
              <img
                alt={ingredientImageLabels[field.value]}
                src={ingredientImagePaths[field.value]}
              />
            ) : (
              <span>未配图</span>
            )}
          </div>
          <FormControl>
            <div
              aria-label="食材图片"
              className="ingredient-image-grid"
              role="group"
              // eslint-disable-next-line react/jsx-handler-names -- React Hook Form owns blur tracking.
              onBlur={field.onBlur}
            >
              {ingredientImageKeys.map((key) => (
                <Button
                  key={key}
                  aria-label={`选择${ingredientImageLabels[key]}`}
                  aria-pressed={field.value === key}
                  className="ingredient-image-choice"
                  type="button"
                  variant="ghost"
                  onClick={handleImageChoiceClick.bind(null, key)}
                >
                  <img alt="" loading="lazy" src={ingredientImagePaths[key]} />
                  <span>{ingredientImageLabels[key]}</span>
                </Button>
              ))}
            </div>
          </FormControl>
          <FormMessage />
        </FormItem>
      )}
    />
  );
};
