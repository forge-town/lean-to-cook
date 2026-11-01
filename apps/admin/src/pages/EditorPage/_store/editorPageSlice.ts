import { createFormControl, type FieldPath } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { ResultAsync } from "neverthrow";
import type { StateCreator } from "zustand";
import {
  CatalogWriteSchema,
  matchIngredientImage,
  type IngredientImageKey,
  type CatalogDetail,
  type CatalogResource,
} from "@repo/schemas/catalog";
import { EditorValuesSchema, type EditorValues } from "../_schemas/EditorValues.schema";
import { emptyRequirement, toEditorValues, toWriteValues } from "../_lib/editorValues";
import { catalogHref, navigation } from "../../../lib/navigation";
export interface EditorPageOptions {
  resource: CatalogResource;
  record?: CatalogDetail;
  save: (values: object, expectedUpdatedAt?: string) => Promise<{ data: CatalogDetail }>;
  remove: (expectedUpdatedAt?: string) => Promise<object>;
  publication: (
    action: "publish" | "unpublish",
    expectedUpdatedAt?: string,
  ) => Promise<{ data: CatalogDetail }>;
  verifyLean?: () => Promise<object>;
  onRecordChange?: (record: CatalogDetail) => void;
}
export interface EditorPageSlice {
  formControl: ReturnType<typeof createFormControl<EditorValues>>;
  confirmDelete: boolean;
  editing: boolean;
  detailTab: "details" | "lean";
  handleDetailTabValueChange: (value: string | number | null) => void;
  handleVerifyLeanButtonClick: () => Promise<void>;
  handleDrawerOpenChange: (record: CatalogDetail, open: boolean) => void;
  handleCancelButtonClick: () => void;
  handleFormSubmit: (values: EditorValues) => Promise<void>;
  handleImageChoiceClick: (key: IngredientImageKey) => void;
  handleMatchImageClick: () => void;
  handleAddRequirementButtonClick: () => void;
  handleRemoveRequirementButtonClick: (index: number) => void;
  handleAddStepButtonClick: () => void;
  handleRemoveStepButtonClick: (index: number) => void;
  handleMoveStepButtonClick: (index: number, direction: -1 | 1) => void;
  handleDeleteButtonClick: () => void;
  handleDeleteDialogOpenChange: (open: boolean) => void;
  handleCancelDeleteButtonClick: () => void;
  handleConfirmDeleteButtonClick: () => Promise<void>;
  handlePublishButtonClick: () => Promise<void>;
  handleUnpublishButtonClick: () => Promise<void>;
}
export const createEditorPageSlice =
  (options: EditorPageOptions): StateCreator<EditorPageSlice> =>
  (set, get) => {
    const formControl = createFormControl<EditorValues>({
      resolver: zodResolver(EditorValuesSchema),
      defaultValues: structuredClone(toEditorValues(options.resource, options.record?.values)),
    });
    const operation = { record: options.record, performing: false };
    const discardDraft = () => {
      if (operation.performing) return;
      formControl.reset(
        structuredClone(toEditorValues(options.resource, operation.record?.values)),
      );
      set({ editing: false });
    };
    const reportError = (error: unknown) =>
      formControl.setError("root", {
        message: error instanceof Error ? error.message : "操作失败，请重试",
      });
    const perform = async (action: "publish" | "unpublish") => {
      if (operation.performing) return;
      operation.performing = true;
      const result = await ResultAsync.fromPromise(
        options.publication(action, operation.record?.updatedAt),
        (error) => error,
      );
      operation.performing = false;
      result.match(({ data }) => {
        operation.record = data;
        options.onRecordChange?.(data);
      }, reportError);
    };

    return {
      formControl,
      confirmDelete: false,
      editing: false,
      detailTab: "details",
      handleDetailTabValueChange: (value) => {
        if (value === "details" || value === "lean") set({ detailTab: value });
      },
      handleVerifyLeanButtonClick: async () => {
        if (operation.performing || !options.verifyLean) return;
        operation.performing = true;
        formControl.clearErrors("root");
        set({ detailTab: "lean" });
        const result = await ResultAsync.fromPromise(options.verifyLean(), (error) => error);
        operation.performing = false;
        result.match(() => {}, reportError);
      },
      handleDrawerOpenChange: (record, open) => {
        if (operation.performing) return;
        if (!open) {
          discardDraft();

          return;
        }
        operation.record = record;
        formControl.reset(structuredClone(toEditorValues(options.resource, record.values)));
        set({ editing: true });
      },
      handleCancelButtonClick: discardDraft,
      handleFormSubmit: async (values) => {
        if (operation.performing) return;
        formControl.clearErrors();
        const input = CatalogWriteSchema.safeParse({
          resource: options.resource,
          id: operation.record?.id ?? null,
          expectedUpdatedAt: operation.record?.updatedAt ?? null,
          values: toWriteValues(options.resource, structuredClone(values)),
        });
        if (!input.success) {
          for (const issue of input.error.issues) {
            const path = issue.path[0] === "values" ? issue.path.slice(1) : [];
            const field = path[0] === "aliases" ? "aliasesText" : path.join(".");
            formControl.setError((field || "root") as FieldPath<EditorValues>, {
              message: issue.message,
            });
          }
          if (!formControl.getFieldState("root" as FieldPath<EditorValues>).error)
            formControl.setError("root", { message: "请检查标出的字段" });

          return;
        }
        operation.performing = true;
        const result = await ResultAsync.fromPromise(
          options.save(input.data.values, operation.record?.updatedAt),
          (error) => error,
        );
        operation.performing = false;
        result.match(({ data }) => {
          operation.record = data;
          formControl.reset(structuredClone(toEditorValues(options.resource, data.values)));
          options.onRecordChange?.(data);
          if (options.record) set({ editing: false });
          else navigation.go(catalogHref(options.resource, { id: data.id, notice: "saved" }));
        }, reportError);
      },
      handleImageChoiceClick: (key) =>
        formControl.setValue("imageKey", key, { shouldDirty: true, shouldValidate: true }),
      handleMatchImageClick: () =>
        formControl.setValue("imageKey", matchIngredientImage(formControl.getValues("name")), {
          shouldDirty: true,
          shouldValidate: true,
        }),
      handleAddRequirementButtonClick: () =>
        formControl.setValue(
          "requirements",
          [...formControl.getValues("requirements"), emptyRequirement()],
          { shouldDirty: true },
        ),
      handleRemoveRequirementButtonClick: (index) =>
        formControl.setValue(
          "requirements",
          formControl.getValues("requirements").filter((_, i) => i !== index),
          { shouldDirty: true },
        ),
      handleAddStepButtonClick: () =>
        formControl.setValue(
          "steps",
          [...formControl.getValues("steps"), { key: crypto.randomUUID(), instruction: "" }],
          { shouldDirty: true },
        ),
      handleRemoveStepButtonClick: (index) =>
        formControl.setValue(
          "steps",
          formControl.getValues("steps").filter((_, i) => i !== index),
          { shouldDirty: true },
        ),
      handleMoveStepButtonClick: (index, direction) => {
        const steps = [...formControl.getValues("steps")];
        const destination = index + direction;
        if (destination < 0 || destination >= steps.length) return;
        [steps[index], steps[destination]] = [steps[destination]!, steps[index]!];
        formControl.setValue("steps", steps, { shouldDirty: true });
      },
      handleDeleteButtonClick: () => {
        if (operation.performing) return;
        formControl.clearErrors("root");
        set({ confirmDelete: true });
      },
      handleDeleteDialogOpenChange: (open) => {
        if (operation.performing) return;
        if (!open) formControl.clearErrors("root");
        set({ confirmDelete: open });
      },
      handleCancelDeleteButtonClick: () => {
        if (operation.performing) return;
        formControl.clearErrors("root");
        set({ confirmDelete: false });
      },
      handleConfirmDeleteButtonClick: async () => {
        if (!get().confirmDelete || operation.performing) return;
        operation.performing = true;
        formControl.clearErrors("root");
        const result = await ResultAsync.fromPromise(
          options.remove(operation.record?.updatedAt),
          (error) => error,
        );
        operation.performing = false;
        result.match(
          () => navigation.go(catalogHref(options.resource, { notice: "deleted" })),
          reportError,
        );
      },
      handlePublishButtonClick: () => perform("publish"),
      handleUnpublishButtonClick: () => perform("unpublish"),
    };
  };
