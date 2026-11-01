import { afterEach, expect, it, vi } from "vitest";
import { createEditorPageStore } from "./editorPageStore";
import { editorOptions, fixtureRecipe } from "../../../storybook/fixtures";
import { toEditorValues } from "../_lib/editorValues";
import { navigation } from "../../../lib/navigation";
const subscriptions: (() => void)[] = [];
afterEach(() => {
  subscriptions.splice(0).forEach((unsubscribe) => unsubscribe());
  vi.restoreAllMocks();
});
const connectedStore = (options: Parameters<typeof createEditorPageStore>[0]) => {
  const store = createEditorPageStore(options);
  subscriptions.push(
    store
      .getState()
      .formControl.subscribe({ formState: { values: true, errors: true }, callback: () => {} }),
  );

  return store;
};
it("validates domain values before calling a mutation", async () => {
  const save = vi.fn();
  const store = connectedStore({ ...editorOptions, save });
  const state = store.getState();
  state.formControl.setValue("requirements.0.amount", "2");
  await state.handleFormSubmit(state.formControl.getValues());
  expect(save).not.toHaveBeenCalled();
  expect(state.formControl.getFieldState("requirements.0.amount").error?.message).toBe(
    "数量和单位需要一起填写",
  );
});
it("keeps unsaved input when the server rejects an update", async () => {
  const store = connectedStore({
    ...editorOptions,
    save: async () => {
      throw new Error("记录已经被修改");
    },
  });
  const state = store.getState();
  state.formControl.setValue("title", "保留这份修改");
  await state.handleFormSubmit(state.formControl.getValues());
  expect(state.formControl.getValues("title")).toBe("保留这份修改");
  expect(state.formControl.getFieldState("root" as "title").error?.message).toBe("记录已经被修改");
  expect(fixtureRecipe.values).toHaveProperty("title", "番茄炒蛋");
});
it("navigates only after persistence succeeds", async () => {
  const go = vi.spyOn(navigation, "go").mockImplementation(() => {});
  const store = connectedStore({
    ...editorOptions,
    record: undefined,
    save: async () => ({ data: fixtureRecipe }),
  });
  const state = store.getState();
  state.formControl.reset(structuredClone(toEditorValues("recipes", fixtureRecipe.values)));
  await state.handleFormSubmit(state.formControl.getValues());
  expect(go).toHaveBeenCalledWith(expect.stringContaining("notice=saved"));
});
it("preserves step identity while reordering and ignores out-of-range moves", () => {
  const state = connectedStore(editorOptions).getState();
  const original = state.formControl.getValues("steps");
  state.handleMoveStepButtonClick(0, -1);
  expect(state.formControl.getValues("steps")).toEqual(original);
  state.handleMoveStepButtonClick(1, -1);
  expect(state.formControl.getValues("steps")[0]?.key).toBe(original[1]?.key);
  state.handleAddStepButtonClick();
  expect(state.formControl.getValues("steps")).toHaveLength(3);
  state.handleRemoveStepButtonClick(2);
  expect(state.formControl.getValues("steps")).toHaveLength(2);
});
it("requires the explicit delete-confirm action before invoking removal", async () => {
  const remove = vi.fn(async () => ({}));
  vi.spyOn(navigation, "go").mockImplementation(() => {});
  const store = connectedStore({ ...editorOptions, remove });
  store.getState().handleDeleteButtonClick();
  expect(store.getState().confirmDelete).toBe(true);
  expect(remove).not.toHaveBeenCalled();
  store.getState().handleCancelDeleteButtonClick();
  expect(store.getState().confirmDelete).toBe(false);
  await store.getState().handleConfirmDeleteButtonClick();
  expect(remove).not.toHaveBeenCalled();
  store.getState().handleDeleteButtonClick();
  await store.getState().handleConfirmDeleteButtonClick();
  expect(remove).toHaveBeenCalledOnce();
});
it("should block saving an over-precision quantity without rounding the draft", async () => {
  const save = vi.fn();
  const state = connectedStore({ ...editorOptions, save }).getState();
  state.formControl.setValue("requirements.0.amount", "999999999.00000101");
  state.formControl.setValue("requirements.0.unitId", crypto.randomUUID());
  await state.handleFormSubmit(state.formControl.getValues());
  expect(save).not.toHaveBeenCalled();
  expect(state.formControl.getValues("requirements.0.amount")).toBe("999999999.00000101");
  expect(state.formControl.getFieldState("requirements.0.amount").error).toBeDefined();
});

it("selects Lean view and reports a compilation failure without changing form data", async () => {
  const verifyLean = vi.fn(async () => {
    throw new Error("Lean 校验未通过");
  });
  const store = connectedStore({ ...editorOptions, verifyLean });
  const before = structuredClone(store.getState().formControl.getValues());
  await store.getState().handleVerifyLeanButtonClick();
  expect(verifyLean).toHaveBeenCalledTimes(1);
  expect(store.getState().detailTab).toBe("lean");
  expect(store.getState().formControl.getValues()).toEqual(before);
  expect(store.getState().formControl.getFieldState("root" as "title").error?.message).toBe(
    "Lean 校验未通过",
  );
});
