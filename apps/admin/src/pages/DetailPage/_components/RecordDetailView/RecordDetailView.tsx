import { Tabs } from "@base-ui/react/tabs";
import type { CatalogDetail } from "@repo/schemas/catalog";
import { Typography } from "../../../../components/ui/Typography";
import { publicationLabel } from "../../../../lib/resources";
import { useEditorPageStore } from "../../../EditorPage/_store";
import { DetailPageContent } from "../DetailPageContent";
import { RecordLeanPanel } from "../RecordLeanPanel";
export type RecordDetailViewProps = { record: CatalogDetail; checking?: boolean };
export const RecordDetailView = ({ record, checking = false }: RecordDetailViewProps) => {
  const tab = useEditorPageStore((s) => s.detailTab);
  const handleDetailTabValueChange = useEditorPageStore((s) => s.handleDetailTabValueChange);
  const name = "title" in record.values ? record.values.title : record.values.name;
  const hasLean = record.resource === "recipes" || record.resource === "ingredients";

  return (
    <div className="detail-page">
      <div className="detail-heading">
        <Typography as="h1">{name}</Typography>
        {record.publication && (
          <Typography as="span" className={`status status-${record.publication}`}>
            {publicationLabel[record.publication]}
          </Typography>
        )}
      </div>
      {hasLean ? (
        <Tabs.Root
          className="record-detail-tabs"
          value={tab}
          onValueChange={handleDetailTabValueChange}
        >
          <Tabs.List aria-label="记录视图" className="record-tab-list">
            <Tabs.Tab value="details">详情</Tabs.Tab>
            <Tabs.Tab value="lean">{checking ? "Lean 代码 · 校验中" : "Lean 代码"}</Tabs.Tab>
          </Tabs.List>
          <Tabs.Panel value="details">
            <DetailPageContent record={record} />
          </Tabs.Panel>
          <Tabs.Panel value="lean">
            <RecordLeanPanel checking={checking} record={record} />
          </Tabs.Panel>
        </Tabs.Root>
      ) : (
        <DetailPageContent record={record} />
      )}
    </div>
  );
};
