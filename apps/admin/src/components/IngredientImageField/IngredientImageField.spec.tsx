import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { FormProvider, useForm } from "react-hook-form";
import { IngredientImageField } from "./IngredientImageField";
import {
  createEditorPageStore,
  EditorPageContext,
} from "../../pages/EditorPage/_store/editorPageStore";
import { editorOptions } from "../../storybook/fixtures";
afterEach(cleanup);
it("selects an existing image in the form sandbox without submitting", () => {
  const store = createEditorPageStore({
    ...editorOptions,
    resource: "ingredients",
    record: undefined,
  });
  const control = store.getState().formControl;
  control.setValue("name", "土豆");
  control.setValue("imageKey", "jar");
  const Fixture = () => {
    const form = useForm({ formControl: control.formControl });

    return (
      <EditorPageContext value={store}>
        <FormProvider {...form}>
          <IngredientImageField />
        </FormProvider>
      </EditorPageContext>
    );
  };
  render(<Fixture />);
  fireEvent.click(screen.getByRole("button", { name: "按名称匹配" }));
  expect(control.getValues("imageKey")).toBe("potato");
  fireEvent.click(screen.getByRole("button", { name: "选择番茄" }));
  expect(control.getValues("imageKey")).toBe("tomato");
  expect(screen.getByRole("button", { name: "选择番茄" }).getAttribute("aria-pressed")).toBe(
    "true",
  );
});
