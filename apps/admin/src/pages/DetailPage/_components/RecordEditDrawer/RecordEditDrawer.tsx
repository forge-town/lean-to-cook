import type { ReactNode } from "react";
import type { CatalogDetail, CatalogResource } from "@repo/schemas/catalog";
import { Button } from "@repo/ui/button";
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetClose } from "@repo/ui/sheet";
import { RecordDetailActions } from "../RecordDetailActions";
import { resources } from "../../../../lib/resources";
import { useEditorPageStore } from "../../../EditorPage/_store";
import { EditorPageContent } from "../../../EditorPage/_components/EditorPageContent";
export type RecordEditDrawerProps = {
  record: CatalogDetail;
  resource: CatalogResource;
  mutationPending?: boolean;
  children: ReactNode;
};
export const RecordEditDrawer = ({
  record,
  resource,
  mutationPending = false,
  children,
}: RecordEditDrawerProps) => {
  const editing = useEditorPageStore((s) => s.editing);
  const handleDrawerOpenChange = useEditorPageStore((s) => s.handleDrawerOpenChange);
  const label = resources.find((r) => r.name === resource)!.label;

  return (
    <Sheet open={editing} onOpenChange={handleDrawerOpenChange.bind(null, record)}>
      <RecordDetailActions busy={mutationPending} record={record} />
      {children}
      <SheetContent
        aria-describedby={undefined}
        className="record-edit-drawer"
        showCloseButton={false}
      >
        <SheetHeader className="record-edit-drawer-header">
          <SheetTitle>编辑{label}</SheetTitle>
          <SheetClose
            render={
              <Button aria-label="关闭编辑" disabled={mutationPending} size="sm" variant="ghost" />
            }
          >
            关闭
          </SheetClose>
        </SheetHeader>
        {editing && (
          <div className="record-edit-drawer-body">
            <EditorPageContent
              inDrawer
              mutationPending={mutationPending}
              record={record}
              resource={resource}
            />
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
};
