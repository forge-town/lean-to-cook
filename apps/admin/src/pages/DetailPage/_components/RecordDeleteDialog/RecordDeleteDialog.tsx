import { useFormState } from "react-hook-form";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { Button } from "@repo/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@repo/ui/dialog";
import { Anchor } from "../../../../components/ui/Anchor";
import { Typography } from "../../../../components/ui/Typography";
import { resources } from "../../../../lib/resources";
import { catalogHref } from "../../../../lib/navigation";
import { useEditorPageStore } from "../../../EditorPage/_store";
export type RecordDeleteDialogProps = { record: CatalogDetail; busy?: boolean };
export const RecordDeleteDialog = ({ record, busy = false }: RecordDeleteDialogProps) => {
  const open = useEditorPageStore((s) => s.confirmDelete);
  const formControl = useEditorPageStore((s) => s.formControl);
  const handleDeleteDialogOpenChange = useEditorPageStore((s) => s.handleDeleteDialogOpenChange);
  const handleCancelDeleteButtonClick = useEditorPageStore((s) => s.handleCancelDeleteButtonClick);
  const handleConfirmDeleteButtonClick = useEditorPageStore(
    (s) => s.handleConfirmDeleteButtonClick,
  );
  const { errors } = useFormState({ control: formControl.control });
  const label = resources.find((r) => r.name === record.resource)!.label;
  const name = "title" in record.values ? record.values.title : record.values.name;
  const recipes =
    record.resource === "ingredients" ? record.references.filter((r) => r.kind === "recipe") : [];

  return (
    <Dialog open={open} onOpenChange={handleDeleteDialogOpenChange}>
      <DialogContent className="record-delete-dialog" showCloseButton={false}>
        <DialogHeader>
          <DialogTitle>删除{label}</DialogTitle>
          <DialogDescription>确定删除「{name}」？</DialogDescription>
        </DialogHeader>
        <div className="record-delete-body">
          {recipes.length > 0 ? (
            <>
              <Typography role="status">已关联 {recipes.length} 道菜谱，不能删除。</Typography>
              <ul className="delete-reference-list">
                {recipes.map((recipe) => (
                  <li key={recipe.id}>
                    <Anchor href={catalogHref("recipes", { id: recipe.id })}>{recipe.name}</Anchor>
                  </li>
                ))}
              </ul>
            </>
          ) : (
            <Typography>删除后无法恢复。</Typography>
          )}
          {errors.root?.message && (
            <div className="error-banner" role="alert">
              {errors.root.message}
            </div>
          )}
        </div>
        <DialogFooter>
          <Button
            disabled={busy}
            type="button"
            variant="outline"
            onClick={handleCancelDeleteButtonClick}
          >
            取消
          </Button>
          <Button
            disabled={busy || recipes.length > 0}
            type="button"
            variant="destructive"
            onClick={handleConfirmDeleteButtonClick}
          >
            {busy ? "正在删除…" : "删除"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
};
