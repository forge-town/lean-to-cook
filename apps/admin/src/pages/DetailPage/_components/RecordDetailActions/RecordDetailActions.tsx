import { clientEnvironment } from "../../../../integrations/env/clientEnvironment";
import { Anchor } from "../../../../components/ui/Anchor";
import { Pencil, Trash2, Upload, EyeOff, ExternalLink, ShieldCheck } from "lucide-react";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { SheetTrigger } from "@repo/ui/sheet";
import { HeaderActions } from "../../../../components/HeaderActions";
import { RoundButton } from "../../../../components/RoundButton";
import { useEditorPageStore } from "../../../EditorPage/_store";
export type RecordDetailActionsProps = { record: CatalogDetail; busy?: boolean };
export const RecordDetailActions = ({ record, busy = false }: RecordDetailActionsProps) => {
  const handleVerifyLeanButtonClick = useEditorPageStore((s) => s.handleVerifyLeanButtonClick);
  const handleDeleteButtonClick = useEditorPageStore((s) => s.handleDeleteButtonClick);
  const handlePublishButtonClick = useEditorPageStore((s) => s.handlePublishButtonClick);
  const handleUnpublishButtonClick = useEditorPageStore((s) => s.handleUnpublishButtonClick);

  return (
    <HeaderActions>
      {record.resource === "recipes" &&
        (record.publicPath ? (
          <RoundButton
            label="前台菜谱"
            nativeButton={false}
            render={
              <Anchor
                href={new URL(record.publicPath, clientEnvironment.VITE_PUBLIC_SITE_URL).href}
                rel="noreferrer"
                target="_blank"
              />
            }
            role="link"
          >
            <ExternalLink aria-hidden="true" />
          </RoundButton>
        ) : (
          <RoundButton disabled label="前台菜谱（发布后可查看）">
            <ExternalLink aria-hidden="true" />
          </RoundButton>
        ))}
      {(record.resource === "recipes" || record.resource === "ingredients") && (
        <RoundButton disabled={busy} label="校验 Lean" onClick={handleVerifyLeanButtonClick}>
          <ShieldCheck aria-hidden="true" />
        </RoundButton>
      )}
      {record.publication && record.publication !== "published" && (
        <RoundButton disabled={busy} label="发布当前版本" onClick={handlePublishButtonClick}>
          <Upload aria-hidden="true" />
        </RoundButton>
      )}
      {record.publication && record.publication !== "draft" && (
        <RoundButton disabled={busy} label="取消发布" onClick={handleUnpublishButtonClick}>
          <EyeOff aria-hidden="true" />
        </RoundButton>
      )}
      <SheetTrigger render={<RoundButton disabled={busy} label="编辑" />}>
        <Pencil aria-hidden="true" />
      </SheetTrigger>
      <RoundButton
        className="detail-action-delete"
        disabled={busy}
        label="删除"
        onClick={handleDeleteButtonClick}
      >
        <Trash2 aria-hidden="true" />
      </RoundButton>
    </HeaderActions>
  );
};
