import { Button } from "@repo/ui/button";
import { useListPageStore } from "../../pages/ListPage/_store";
export const AssignIngredientImages = () => {
  const busy = useListPageStore((s) => s.assigningImages);
  const notice = useListPageStore((s) => s.imageAssignmentNotice);
  const failed = useListPageStore((s) => s.imageAssignmentFailed);
  const handleAssignImagesClick = useListPageStore((s) => s.handleAssignImagesClick);

  return (
    <div className="assign-ingredient-images">
      <Button disabled={busy} type="button" variant="outline" onClick={handleAssignImagesClick}>
        {busy ? "正在配图…" : "一键配图"}
      </Button>
      {notice && <span role="status">{notice}</span>}
      {failed && <span role="alert">配图失败，请重试</span>}
    </div>
  );
};
