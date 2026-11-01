import { useFormState } from "react-hook-form";
import { useEditorPageStore } from "../../../EditorPage/_store";
import { useCustom } from "@refinedev/core";
import type { CatalogDetail, CatalogLeanArtifact } from "@repo/schemas/catalog";
import { Disclosure } from "../../../../components/ui/Disclosure";
import { Typography } from "../../../../components/ui/Typography";
export type RecordLeanPanelProps = { record: CatalogDetail; checking?: boolean };
export const RecordLeanPanel = ({ record, checking = false }: RecordLeanPanelProps) => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const { errors } = useFormState({ control: formControl.control });
  const query = useCustom<CatalogLeanArtifact>({
    url: "lean",
    method: "get",
    config: { query: { resource: record.resource, id: record.id } },
    queryOptions: {
      queryKey: [
        "catalog-lean",
        record.resource,
        record.id,
        record.updatedAt,
        record.values,
        record.references,
      ],
      retry: false,
    },
    errorNotification: false,
  });
  const artifact = query.result?.data;
  if (query.query.isLoading)
    return (
      <div className="loading-state" role="status">
        正在读取 Lean 代码…
      </div>
    );
  if (query.query.isError || !artifact)
    return (
      <div className="error-banner" role="alert">
        {query.query.error?.message ?? "Lean 代码读取失败"}
      </div>
    );

  return (
    <div className="record-lean-panel">
      <div className="lean-section-heading">
        <Typography as="h2">当前版本</Typography>
        <Typography
          as="span"
          className={
            artifact.verification === "checked" ? "lean-check-state checked" : "lean-check-state"
          }
        >
          {checking ? "正在校验…" : artifact.verification === "checked" ? "结构校验通过" : "待校验"}
        </Typography>
      </div>
      {errors.root?.message && (
        <div className="error-banner" role="alert">
          {errors.root.message}
        </div>
      )}
      <dl className="lean-facts">
        <div>
          <dt>记录版本</dt>
          <dd>{new Date(artifact.updatedAt).toLocaleString("zh-CN")}</dd>
        </div>
        {artifact.checkedAt && (
          <div>
            <dt>校验时间</dt>
            <dd>{new Date(artifact.checkedAt).toLocaleString("zh-CN")}</dd>
          </div>
        )}
        {artifact.leanVersion && (
          <div>
            <dt>编译器</dt>
            <dd>{artifact.leanVersion}</dd>
          </div>
        )}
        <div>
          <dt>SHA-256</dt>
          <dd className="lean-digest">{artifact.digest}</dd>
        </div>
      </dl>
      <pre aria-label="当前版本 Lean 代码" className="lean-code">
        <code>{artifact.source}</code>
      </pre>
      <Disclosure title="数据模型">
        <Typography className="mono">{artifact.modelPath}</Typography>
        <pre aria-label="Lean 数据模型" className="lean-code">
          <code>{artifact.modelSource}</code>
        </pre>
      </Disclosure>
      {artifact.origin && (
        <Disclosure title="来源快照证明">
          <Typography className="mono">
            {artifact.origin.commit.slice(0, 8)} · {artifact.origin.path}
          </Typography>
          <pre aria-label="来源快照 Lean 证明" className="lean-code">
            <code>{artifact.origin.source}</code>
          </pre>
        </Disclosure>
      )}
    </div>
  );
};
