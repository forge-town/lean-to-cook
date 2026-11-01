import type { CatalogResource, CatalogRow } from "@repo/schemas/catalog";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@repo/ui/table";
import { Anchor } from "../ui/Anchor";
import { Typography } from "../ui/Typography";
import { catalogHref } from "../../lib/navigation";
import { Skeleton } from "@repo/ui/skeleton";
import { publicationLabel, resources } from "../../lib/resources";
export type RecordTableProps = {
  resource: CatalogResource;
  rows: CatalogRow[];
  loading?: boolean;
  skeletonRows?: number;
  filtered?: boolean;
  error?: string;
  resetHref?: string;
  retryHref?: string;
};
export const RecordTable = ({
  resource,
  rows,
  loading = false,
  skeletonRows = 25,
  filtered = false,
  error,
  resetHref,
  retryHref,
}: RecordTableProps) => {
  const label = resources.find((r) => r.name === resource)!.label;

  return (
    <div aria-busy={loading} className="record-table">
      {loading && (
        <Typography className="sr-only" role="status">
          正在读取{label}…
        </Typography>
      )}
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>名称</TableHead>
            <TableHead>{resource === "recipes" ? "分类" : "说明"}</TableHead>
            <TableHead>{resource === "recipes" ? "发布" : "被引用"}</TableHead>
            <TableHead>最近修改</TableHead>
            <TableHead>
              <Typography className="sr-only">操作</Typography>
            </TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {loading ? (
            Array.from({ length: skeletonRows }, (_, index) => (
              <TableRow key={index}>
                {Array.from({ length: 5 }, (_, column) => (
                  <TableCell key={column}>
                    <Skeleton className="table-skeleton" />
                  </TableCell>
                ))}
              </TableRow>
            ))
          ) : error ? (
            <TableRow>
              <TableCell colSpan={5}>
                <div className="empty-state" role="alert">
                  <Typography>读取失败：{error}</Typography>
                  <Anchor className="quiet-button" href={retryHref ?? catalogHref(resource)}>
                    重新读取
                  </Anchor>
                </div>
              </TableCell>
            </TableRow>
          ) : rows.length === 0 ? (
            <TableRow>
              <TableCell colSpan={5}>
                <div className="empty-state">
                  <Typography as="h2">{filtered ? "无匹配结果" : `还没有${label}`}</Typography>
                  <Anchor
                    className="quiet-button"
                    href={
                      filtered
                        ? (resetHref ?? catalogHref(resource))
                        : catalogHref(resource, { id: "new" })
                    }
                  >
                    {filtered ? "清空筛选" : `添加第一条${label}`}
                  </Anchor>
                </div>
              </TableCell>
            </TableRow>
          ) : (
            rows.map((row) => (
              <TableRow key={row.id}>
                <TableCell>
                  <Anchor className="record-name" href={catalogHref(resource, { id: row.id })}>
                    {row.name}
                  </Anchor>
                </TableCell>
                <TableCell>
                  <Typography className="row-detail">{row.detail || "—"}</Typography>
                </TableCell>
                <TableCell>
                  {row.publication ? (
                    <Typography as="span" className={`status status-${row.publication}`}>
                      {publicationLabel[row.publication]}
                    </Typography>
                  ) : (
                    <Typography as="span" className="mono">
                      {row.usageCount} 处
                    </Typography>
                  )}
                </TableCell>
                <TableCell>
                  <Typography as="span" className="row-date">
                    {new Date(row.updatedAt).toLocaleDateString("zh-CN")}
                  </Typography>
                </TableCell>
                <TableCell>
                  <Anchor
                    aria-label={`查看${row.name}`}
                    className="edit-link"
                    href={catalogHref(resource, { id: row.id })}
                  >
                    查看 ↗
                  </Anchor>
                </TableCell>
              </TableRow>
            ))
          )}
        </TableBody>
      </Table>
    </div>
  );
};
