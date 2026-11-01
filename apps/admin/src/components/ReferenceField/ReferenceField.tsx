import { useCustom } from "@refinedev/core";
import type { CatalogResource, CatalogRow } from "@repo/schemas/catalog";
import { ChoiceField } from "../ChoiceField";
import { Typography } from "../ui/Typography";
export const ReferenceField = ({
  name,
  label,
  resource,
}: {
  name: string;
  label: string;
  resource: CatalogResource;
}) => {
  const query = useCustom<{ id: string; options: CatalogRow[] }>({
    url: `options/${resource}`,
    method: "get",
    queryOptions: { staleTime: 30_000 },
  });
  const options = query.result?.data?.options;

  return (
    <div>
      <ChoiceField
        disabled={query.query.isLoading}
        label={label}
        name={name}
        options={[
          { value: "", label: "未选择" },
          ...(options ?? []).map((row) => ({ value: row.id, label: row.name })),
        ]}
      />
      {query.query.isError && (
        <Typography className="field-error" role="alert">
          选项加载失败，请刷新后重试。
        </Typography>
      )}
    </div>
  );
};
